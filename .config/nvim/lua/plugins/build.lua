local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path
        })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- dependencies
    use("nvim-lua/plenary.nvim")

    -- style
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("lukas-reineke/indent-blankline.nvim")
    use("nvim-tree/nvim-web-devicons")
    use("xiyaowong/nvim-transparent")

    -- exploring
    use("nvim-tree/nvim-tree.lua")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    })
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x"
    })

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- lsp
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    use("neovim/nvim-lspconfig")
    use("p00f/clangd_extensions.nvim")
    use("hrsh7th/cmp-nvim-lsp")
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use("onsails/lspkind.nvim")

    use("jose-elias-alvarez/null-ls.nvim")

    -- automation
    use("windwp/nvim-autopairs")
    use({
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter"
    })

    -- utils
    use("nvim-lualine/lualine.nvim")
    use({ "akinsho/bufferline.nvim", tag = "v3.*" })
    use("j-hui/fidget.nvim")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    use("rcarriga/nvim-notify")
    use({
        "lewis6991/gitsigns.nvim",
        tag = "release"
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)

