vim.g.mapleader = " "

local keymap = vim.keymap

-- base
keymap.set("n", "x", '"_x"')

-- numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- splitting
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>ss", "<cmd>close<CR>")

-- buffers
keymap.set("n", "<leader>c", "<cmd>enew<CR>")
keymap.set("n", "<leader>l", "<cmd>bnext<CR>")
keymap.set("n", "<leader>h", "<cmd>bprevious<CR>")
keymap.set("n", "<leader>bb", "<cmd>bp <bar> bd #<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fn", "<cmd>Telescope help_tags<CR>")

