local js_ts_filetypes = {
  javascript = true,
  javascriptreact = true,
  ["javascript.jsx"] = true,
  json = true,
  jsonc = true,
  typescript = true,
  typescriptreact = true,
  ["typescript.tsx"] = true,
}

local oxfmt_config_files = { ".oxfmtrc.json", ".oxfmtrc.jsonc" }
local oxlint_config_files = { ".oxlintrc.json", "oxlint.config.ts" }

local function has_config(filename, config_files)
  if filename == "" then
    return false
  end
  return #vim.fs.find(config_files, { path = filename, upward = true }) > 0
end

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for ft in pairs(js_ts_filetypes) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], "oxfmt")
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.oxfmt = {
        condition = function(_, ctx)
          return has_config(ctx.filename, oxfmt_config_files)
        end,
      }
    end,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      for ft in pairs(js_ts_filetypes) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        table.insert(opts.linters_by_ft[ft], "oxlint")
      end

      opts.linters = opts.linters or {}
      opts.linters.oxlint = {
        condition = function(ctx)
          return has_config(ctx.filename, oxlint_config_files)
        end,
      }
    end,
  },
}
