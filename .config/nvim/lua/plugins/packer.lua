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

	-- lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")

	-- external lsps
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- snips
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- nvim-cmp
	use("f3fora/cmp-spell")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("petertriho/cmp-git")
	use("saadparwaiz1/cmp_luasnip")

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdateSync" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")

	-- telescope
	use("nvim-telescope/telescope.nvim")

	-- misc
	use("akinsho/toggleterm.nvim")
	use("chentoast/marks.nvim")
	use("karb94/neoscroll.nvim")
	use("lewis6991/gitsigns.nvim")
	use("machakann/vim-sandwich")
	use("numToStr/Comment.nvim")
	use("preservim/tagbar")
	use("rhysd/clever-f.vim")
	use("windwp/nvim-autopairs")
	-- use("gbprod/yanky.nvim")
	-- use("Olical/conjure")
	--
	use({
		"folke/noice.nvim",
		requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	})

	-- colorshemes
	use("ellisonleao/gruvbox.nvim")
	use("shaunsingh/nord.nvim")

	-- cosmetic
	use("shortcuts/no-neck-pain.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"goolord/alpha-nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
end)
