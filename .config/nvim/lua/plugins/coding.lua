return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:PmenuThumb,Search:None",
          col_offset = -3,
          side_padding = 0,
        },
        documentation = {
          border = "rounded",
          col_offset = 3,
          winhighlight = "Normal:Normal,FloatBorder:NoiceCmdlinePopupBorder,Search:None",
        },
      }
      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          item.menu = "    (" .. (item.kind or "unknown") .. ")"
          item.kind = " " .. (icons[item.kind] or " ")
          return item
        end,
      }
      return opts
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- stylua: ignore
    init = function ()
      local luasnip = require('luasnip')

      local unlinkgrp = vim.api.nvim_create_augroup(
        'UnlinkSnippetOnModeChange',
        { clear = true }
      )

      vim.api.nvim_create_autocmd('ModeChanged', {
        group = unlinkgrp,
        pattern = {'s:n', 'i:*'},
        desc = 'Forget the current snippet when leaving the insert mode',
        callback = function(evt)
          if
            luasnip.session
            and luasnip.session.current_nodes[evt.buf]
            and not luasnip.session.jump_active
          then
            luasnip.unlink_current()
          end
        end,
      })
    end
,
  },
}
