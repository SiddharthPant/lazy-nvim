-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

local function escape_statusline(text)
  return text:gsub("%%", "%%%%")
end

local function buffer_is_special()
  local buftype = vim.bo.buftype
  local filetype = vim.bo.filetype

  return buftype ~= "" or filetype == "neo-tree" or filetype == "snacks_dashboard" or filetype == "help"
end

local function get_file_icon(path)
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if not ok then
    return ""
  end

  local filename = vim.fn.fnamemodify(path, ":t")
  local extension = vim.fn.fnamemodify(path, ":e")
  local icon = devicons.get_icon(filename, extension, { default = true })
  if not icon then
    return ""
  end

  return icon .. " "
end

local function get_workspace_label()
  local cwd = vim.fn.getcwd(0)
  local label = vim.fn.fnamemodify(cwd, ":t")
  if label == "" or label == "." then
    label = cwd
  end

  return (" %s"):format(escape_statusline(label))
end

local function set_winbar()
  local ok, err = pcall(function()
    if buffer_is_special() then
      vim.opt_local.winbar = ""
      return
    end

    local name = vim.api.nvim_buf_get_name(0)
    local label = name == "" and "[No Name]" or vim.fn.fnamemodify(name, ":~:.")
    local icon = name == "" and " " or get_file_icon(name)

    label = escape_statusline(label)
    if vim.bo.modified then
      label = label .. " [+]"
    end

    vim.opt_local.winbar = table.concat({
      get_workspace_label(),
      "%=",
      icon .. label,
    })
  end)

  if not ok then
    vim.opt_local.winbar = ""
    vim.schedule(function()
      vim.notify(("winbar failed: %s"):format(err), vim.log.levels.WARN)
    end)
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter", "FileType", "VimEnter", "DirChanged" }, {
  callback = set_winbar,
})

local function is_snacks_explorer_buf(buf)
  local ok_picker, picker_api = pcall(require, "snacks.picker")
  if not ok_picker then
    return false
  end

  for _, picker in ipairs(picker_api.get({ source = "explorer", tab = false })) do
    local list_buf = picker.list and picker.list.win and picker.list.win.buf
    local preview_buf = picker.preview and picker.preview.win and picker.preview.win.buf
    local input_buf = picker.input and picker.input.win and picker.input.win.buf
    if buf == list_buf or buf == preview_buf or buf == input_buf then
      return true
    end
  end

  return false
end

local function select_tmux_pane(direction)
  if not vim.env.TMUX then
    return false
  end

  vim.fn.system({ "tmux", "select-pane", direction })
  return vim.v.shell_error == 0
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "snacks_picker_list", "snacks_picker_preview" },
  callback = function(ev)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(ev.buf) or not is_snacks_explorer_buf(ev.buf) then
        return
      end

      vim.keymap.set("n", "<C-l>", function()
        if not select_tmux_pane("-R") then
          vim.cmd("wincmd l")
        end
      end, {
        buffer = ev.buf,
        silent = true,
        desc = "Right tmux pane",
      })
    end)
  end,
})
