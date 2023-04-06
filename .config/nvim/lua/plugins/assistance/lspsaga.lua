local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status then
    return
end

lspsaga.setup({
    move_in_saga = {
        prev = "<C-p>",
        next = "<C-n>"
    },
    finder_action_keys = {
        open = "<CR>"
    },
    definition_action_keys = {
        edit = "<CR>"
    }
})
