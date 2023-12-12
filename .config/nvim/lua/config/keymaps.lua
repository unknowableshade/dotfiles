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
keymap.set("n", "w-", "<cmd>split<CR><C-w>w", opts)
keymap.set("n", "w\\", "<cmd>vsplit<CR><C-w>w", opts)

keymap.set("n", "ww", "<cmd>close<CR>")

keymap.set("n", "wh", "<C-w>h")
keymap.set("n", "wj", "<C-w>j")
keymap.set("n", "wk", "<C-w>k")
keymap.set("n", "wl", "<C-w>l")

keymap.set("n", "<C-w><left>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")
keymap.set("n", "<C-w><right>", "<C-w>>")

-- tabs
keymap.set("n", "tc", "<cmd>tabedit<CR>", opts)
keymap.set("n", "<tab>", "<cmd>tabnext<CR>")
keymap.set("n", "<s-tab>", "<cmd>tabprev<CR>")
keymap.set("n", "tt", "<cmd>bd<CR>")
