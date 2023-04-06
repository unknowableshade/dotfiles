local noice_status, noice = pcall(require, "noice")
if not noice_status then
    return
end

noice.setup({
    lsp = {
        progress = {
            enabled = false
        },
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        }
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
    }
})

local notify_status, notify = pcall(require, "notify")
if not notify_status then
    return
end

pcall(function()
    require("telescope").load_extension("notify")
end)

notify.setup({
    stages = "static",
    on_open = nil,
    on_close = nil,
    timeout = 2000,
    render = "default",
    background_colour = "Normal",
    minimum_width = 50,
    level = "TRACE",
})

vim.keymap.set("n", "<leader>p", "", { callback = notify.dismiss })

vim.notify = notify
