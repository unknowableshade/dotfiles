-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- base
keymap.set("n", "x", '"_x')
keymap.set("n", "dw", "vb_d")
keymap.set("n", "<C-a>", "gg<S-v>G")

-- (inc/dec)rement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- windows
keymap.set("n", "<Leader>-", "<cmd>split<CR><C-w>j", opts)
keymap.set("n", "<Leader>\\", "<cmd>vsplit<CR><C-w>l", opts)

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

keymap.set("n", "<C-M-h>", "<C-w><")
keymap.set("n", "<C-M-j>", "<C-w>+")
keymap.set("n", "<C-M-k>", "<C-w>-")
keymap.set("n", "<C-M-l>", "<C-w>>")

-- tabs
keymap.set("n", "<tab>", "<cmd>tabnext<CR>")
keymap.set("n", "<s-tab>", "<cmd>tabprev<CR>")
