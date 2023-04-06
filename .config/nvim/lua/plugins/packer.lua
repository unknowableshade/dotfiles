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
    use("nvim-tree/nvim-web-devicons")

    -- styling
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("lukas-reineke/indent-blankline.nvim")
    use("xiyaowong/nvim-transparent")

    -- exploring 
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.1"
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        after = "telescope.nvim"
    })
    use({
        "nvim-telescope/telescope-file-browser.nvim"
    })

    -- assistance
    -- -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    -- -- snippets
    use({
        "L3MON4D3/LuaSnip",
	    tag = "v1.2.*",
    })
    use("saadparwaiz1/cmp_luasnip")

    -- -- lsp
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use({ "glepnir/lspsaga.nvim", branch = "main" })

    use("jose-elias-alvarez/null-ls.nvim")

    use("p00f/clangd_extensions.nvim")

    -- utilities
    use("nvim-lualine/lualine.nvim")
    use({ "akinsho/bufferline.nvim", tag = "v3.*" })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
    use({
        "lewis6991/gitsigns.nvim",
        tag = "v0.6"
    })
    use({
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)

