require("nvim-treesitter.configs").setup({
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"bash",
		"c",
		"clojure",
		"go",
		"haskell",
		"html",
		"javascript",
		"json",
		"julia",
		"lua",
		"python",
		"vim",
	},
	highlight = { enable = true, additional_vim_regex_highlightimg = false },
	incremental_selection = { enable = false },
	indent = { enable = true },
	-- See: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["il"] = "@loop.inner",
			},
			selection_modes = {
				["@function.outer"] = "V",
				["@function.inner"] = "V",
				["@class.outer"] = "V",
				["@class.inner"] = "V",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]]"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_next_end = {
				["]["] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[["] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_previous_end = {
				["[]"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},
	},
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"typescriptreact",
		},
	},
})

local rainbow_delimiters = require("rainbow-delimiters")

vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		vim = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
}
