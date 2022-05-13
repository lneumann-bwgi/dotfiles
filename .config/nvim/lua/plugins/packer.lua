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
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- snips
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- nvim-cmp
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("f3fora/cmp-spell")
	use("petertriho/cmp-git")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/nvim-cmp")

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- use("nvim-treesitter/nvim-treesitter-refactor")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	})
	-- telescope
	use("nvim-telescope/telescope.nvim")

	-- misc
	use("lewis6991/impatient.nvim")
	use("machakann/vim-sandwich")
	use("rhysd/clever-f.vim")
	use("lewis6991/gitsigns.nvim")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-autopairs")
	use("karb94/neoscroll.nvim")
	use("chentau/marks.nvim")

	-- cosmetic
	use("ellisonleao/gruvbox.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"nvim-lualine/lualine.nvim",
		tag = "*",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({})
		end,
	})
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
end)
