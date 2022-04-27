-- bootstrap
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use("neovim/nvim-lspconfig") -- basic lsp
    use("williamboman/nvim-lsp-installer") -- provides LspInstall

    -- nvim-cmp
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use('L3MON4D3/LuaSnip')

    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("p00f/nvim-ts-rainbow")

    -- misc
    use("junegunn/goyo.vim")
    use("junegunn/limelight.vim")

    use("lewis6991/gitsigns.nvim")
    use("numToStr/Comment.nvim")
    use("nvim-telescope/telescope.nvim")
    use("windwp/nvim-autopairs")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })

    use("karb94/neoscroll.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use({ "nvim-lualine/lualine.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })
    use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })

    -- colorshemes
    use("ellisonleao/gruvbox.nvim")
end)
