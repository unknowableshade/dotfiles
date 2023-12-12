return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        ";f",
        function()
          require("telescope.builtin").find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
      },
      {
        ";g",
        function()
          require("telescope.builtin").live_grep()
        end,
      },
      {
        ";b",
        function()
          require("telescope.builtin").buffers()
        end,
      },
      {
        ";t",
        function()
          require("telescope.builtin").help_tags()
        end,
      },
      {
        ";;",
        function()
          require("telescope.builtin").resume()
        end,
      },
      {
        ";d",
        function()
          require("telescope.builtin").diagnostics()
        end,
      },
      {
        ";s",
        function()
          require("telescope.builtin").treesitter()
        end,
      },
      {
        ";e",
        function()
          local telescope = require("telescope")
          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
