local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
    return
end

null_ls.setup({
    on_init = function(new_client, _)
        new_client.offset_encoding = "utf-16"
    end,
    sources = {
        -- base
        null_ls.builtins.completion.tags,
        null_ls.builtins.completion.luasnip,

        -- c++ & cmake
        null_ls.builtins.diagnostics.clang_check,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cmake_lint,

        -- TypeScript & JavaScript
        null_ls.builtins.diagnostics.tsc,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,

    }
})
