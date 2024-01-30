return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Telescope
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_p1 },

          -- Popup
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_m1, blend = vim.o.pumblend },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.special },

          CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
          CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
          CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
          CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },

          CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
          CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
          CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

          CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
          CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
          CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },

          CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
          CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
          CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

          CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
          CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
          CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
          CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
          CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

          CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
          CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

          CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
          CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
          CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

          CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
          CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
          CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

          CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
          CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
          CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
        }
      end,
    },
    init = function()
      vim.o.background = ""
      vim.opt.pumblend = 0
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      }

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
__ __  ____  __ __  ____  __ __  ____   ____  __    __  __    __ 
|  |  ||    ||  |  ||    ||  |  ||    | /    ||  |__|  ||  |__|  |
|  |  | |  | |  |  | |  | |  |  | |  | |  o  ||  |  |  ||  |  |  |
|  ~  | |  | |  ~  | |  | |  ~  | |  | |     ||  |  |  ||  |  |  |
|___, | |  | |___, | |  | |___, | |  | |  _  ||  `  '  ||  `  '  |
|     | |  | |     | |  | |     | |  | |  |  | \      /  \      / 
|____/ |____||____/ |____||____/ |____||__|__|  \_/\_/    \_/\_/  
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
