vim.g.mapleader = " "

local keymap = vim.keymap

-- base
keymap.set("n", "x", '"_x')
keymap.set("n", "dw", 'bn"_d')
keymap.set("n", "<C-a>", "gg<S-v>G")

-- crementols
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- splitting
keymap.set("n", "_", ":split<CR><C-w>w", { silent = true })
keymap.set("n", "|", ":vsplit<CR><C-w>w", { silent = true })
keymap.set("n", "aa", "<cmd>close<CR>")

-- movement
keymap.set("", "a<left>", "<C-w>h")
keymap.set("", "ah", "<C-w>h")
keymap.set("", "a<up>", "<C-w>k")
keymap.set("", "ak", "<C-w>k")
keymap.set("", "a<down>", "<C-w>j")
keymap.set("", "aj", "<C-w>j")
keymap.set("", "a<right>", "<C-w>l")
keymap.set("", "al", "<C-w>l")

-- buffers
keymap.set("n", "<leader>c", "<cmd>tabedit<CR>", { silent = true })
keymap.set("n", "<leader>l", "<cmd>bnext<CR>")
keymap.set("n", "<leader>h", "<cmd>bprevious<CR>")
keymap.set("n", "<leader>bb", "<cmd>bp <bar> bd #<CR>")

-- telescope

