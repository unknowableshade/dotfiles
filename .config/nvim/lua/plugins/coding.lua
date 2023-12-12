return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.window = { documentation = { winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None" } }
    return opts
  end,
}
