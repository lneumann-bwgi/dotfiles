local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.diagnostics.ruff,
		require("null-ls").builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "tsql" },
		}),
		require("null-ls").builtins.formatting.clang_format,
		require("null-ls").builtins.formatting.cljstyle,
		require("null-ls").builtins.formatting.csharpier,
		require("null-ls").builtins.diagnostics.cspell,
		require("null-ls").builtins.code_actions.cspell,
		require("null-ls").builtins.formatting.gofmt,
		require("null-ls").builtins.formatting.json_tool,
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.isort,
		require("null-ls").builtins.formatting.shfmt,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "tsql" },
		}),
		require("null-ls").builtins.formatting.stylish_haskell,
	},
	on_attach = on_attach,
})
