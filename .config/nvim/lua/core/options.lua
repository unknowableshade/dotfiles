vim.cmd("autocmd!")

-- encodings
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- lines
vim.opt.number = true
vim.opt.wrap = false
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.breakindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- misc
vim.opt.backup = false
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus")
vim.opt.iskeyword:append("_")
vim.opt.shell = "zsh"
vim.opt.inccommand = "split"

-- style
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste"
})
