local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    return
end

local actions = require("telescope.actions")

telescope.setup({
    pickers = {
        find_files = {
            hidden = true
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
        },
    },
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
            }
        }
    }
})

telescope.load_extension("file_browser")

local keymap = vim.keymap

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fn", "<cmd>Telescope help_tags<CR>")
keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>")


