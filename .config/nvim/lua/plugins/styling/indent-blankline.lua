local indent_blankline_status, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_status then
    return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

indent_blankline.setup({
    char = "│",
    show_first_indent_level = true,
    filetype_exclude = {
        "startify",
        "dashboard",
        "dotooagenda",
        "log",
        "fugitive",
        "gitcommit",
        "packer",
        "vimwiki",
        "markdown",
        "json",
        "txt",
        "vista",
        "help",
        "todoist",
        "NvimTree",
        "peekaboo",
        "git",
        "TelescopePrompt",
        "undotree",
        "flutterToolsOutline",
        "", -- for all buffers without a file type
    },
    buftype_exclude = { "terminal", "nofile" },
    show_trailing_blankline_indent = false,
    show_current_context = true,
    context_patterns = {
        "class",
        "function",
        "method",
        "block",
        "list_literal",
        "selector",
        "^if",
        "^table",
        "if_statement",
        "while",
        "for",
        "type",
        "var",
        "import",
    },
    space_char_blankline = " ",
})
