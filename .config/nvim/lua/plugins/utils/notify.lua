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
