local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
    return
end

local colors = {
    darkgray = "#16161d",
    gray = "#727169",
    innerbg = nil,
    outerbg = "#16161D",
    normal = "#afd7af",
    insert = "#5fafd7",
    visual = "#c678dd",
    replace = "#e46876",
    command = "#cab092",
}

local theme = {
    inactive = {
        a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
        a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
        a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
        a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
        a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
        a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
        b = { fg = colors.gray, bg = colors.outerbg },
        c = { fg = colors.gray, bg = colors.innerbg },
    },
}

lualine.setup({
    options = {
        theme = theme
    },
    extensions = { "nvim-tree" }
})
