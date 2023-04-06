local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
    return
end

treesitter.setup({
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                vim.notify("Treesitter gives up. (file is too large)", 3)
                return true
            end
        end
    },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "regex"
    },
    auto_install = true
})

