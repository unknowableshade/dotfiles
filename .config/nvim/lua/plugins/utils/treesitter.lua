local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
    return
end

treesitter.setup({
    highlight = {
        enable = true,
    },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
        "java",
        "cpp",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "bash",
        "lua",
        "vim",
        "dockerfile"
    },
    auto_install = true,
})

