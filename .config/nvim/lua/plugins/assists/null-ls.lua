local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
    return
end

null_ls.setup({
    on_init = function(new_client, _)
        new_client.offset_encoding = "utf-16"
    end,
    sources = {
        null_ls.builtins.completion.tags,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.diagnostics.clang_check,
        null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
    }
})
