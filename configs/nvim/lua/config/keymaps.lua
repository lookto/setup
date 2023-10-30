-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<cr>", { silent = true, remap = true, desc = "Go to lower panel" })
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<cr>", { silent = true, remap = true, desc = "Go to upper panel" })
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<cr>", { silent = true, remap = true, desc = "Go to left panel" })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<cr>", { silent = true, remap = true, desc = "Go to right panel" })
