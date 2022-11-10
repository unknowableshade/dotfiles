vim.cmd("autocmd!")

local opt = vim.opt

-- lines
opt.number = true

-- indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- splitting
opt.splitright = true
opt.splitbelow = true

-- misc
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.iskeyword:append("_")

-- style
opt.termguicolors = true
opt.cursorline = true
