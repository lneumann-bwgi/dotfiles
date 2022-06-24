require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.clang_format,
		require("null-ls").builtins.formatting.fixjson,
		require("null-ls").builtins.formatting.gofmt,
		require("null-ls").builtins.formatting.isort,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier.with({ extra_args = { "--tab-width", "4" } }),
		require("null-ls").builtins.formatting.shfmt,
		require("null-ls").builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "mysql" }, -- change to your dialect
		-- }),
		require("null-ls").builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "mysql" }, -- change to your dialect
		}),
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
