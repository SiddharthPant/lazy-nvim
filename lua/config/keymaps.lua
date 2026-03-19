-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to System Clipboard" })  -- explicit copy to the system clipboard
map({ "n", "x" }, "<leader>d", '"+d', { desc = "Delete to System Clipboard" })  -- explicit cut to the system clipboard
