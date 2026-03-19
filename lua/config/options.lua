-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = ""  -- keep clipboard local unless a mapping explicitly copies to the system clipboard

-- Treat dotenv files as their own filetype so shell diagnostics do not attach.
vim.filetype.add({
  filename = {
    [".env"] = "dotenv",
  },
  pattern = {
    [".env%.[^/]+"] = "dotenv",
    [".*/%.env%.[^/]+"] = "dotenv",
  },
})
