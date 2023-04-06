local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP Actions",
    callback = function()
        local opts = { buffer = true }

        keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
        keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", opts)
        keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
        keymap.set("n", "<leader>gt", "<cmd>Lspsaga goto_type_definition<CR>")
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        keymap.set({"n", "v"}, "ga", "<cmd>Lspsaga code_action<CR>", opts)
        keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
        keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>", opts)
        keymap.set("n", "gg", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
        keymap.set("n", "<leader>gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
        keymap.set("n", "<leader>gb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
        keymap.set("n", "<leader>gw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
        keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
        keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
        keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>")
    end
})

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lsp_defaults.capabilities,
    cmp.default_capabilities()
)

require("clangd_extensions").setup({})

lspconfig["lua_ls"].setup({
    single_file_support = true,
    flags = {
        debounce_text_changes = 150,
    },
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
