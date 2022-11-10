local fidget_status, fidget = pcall(require, "fidget")
if not fidget_status then
    return
end

fidget.setup({
    window = { blend = 0 }
})
