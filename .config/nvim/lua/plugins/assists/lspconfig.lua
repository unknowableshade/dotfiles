local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap

local on_attach = function(client, buff)
    local opts = { noremap = true, silent = true, buffer = buff }

    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap.set("n", "d[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap.set("n", "d]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end

local capabilities = cmp.default_capabilities()

lspconfig["sumneko_lua"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true
                }
            }
        }
    }
})

local lsp_flags = {
    debounce_text_changes = 150
}

capabilities.offsetEncoding = { "utf-16" }

local clangd_extensions_status, clangd_extensions = pcall(require, "clangd_extensions")
if not clangd_extensions_status then
    return
end

clangd_extensions.setup({
    server = {
        capabilities = capabilities,
        on_attach = on_attach
    }
})

lspconfig["jdtls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["tsserver"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

lspconfig["cmake"].setup({
    on_attach = on_attach,
    capabilities = capabilities
})
