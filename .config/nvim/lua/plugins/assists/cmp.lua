local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function (args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-]>"] = cmp.mapping.scroll_docs(-4),
        ["<C-[>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-x>"] = cmp.mapping.abort(),
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = false })
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
        { name = "path" }
    }),
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        })
    }
})
