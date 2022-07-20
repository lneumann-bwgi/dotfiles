-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
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
		}),
		require("null-ls").builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "mysql" }, -- change to your dialect
		}),
	},
	on_attach = function(client, bufnr)
		--       -- from: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts#neovim-08
		-- local lsp_formatting = function(bufnr)
		-- 	vim.lsp.buf.format({
		-- 		filter = function(client)
		-- 			-- apply whatever logic you want (in this example, we'll only use null-ls)
		-- 			return client.name == "null-ls"
		-- 		end,
		-- 		bufnr = bufnr,
		-- 	})
		-- end
		--       -- if you want to set up formatting on save, you can use this as a callback
		--       local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		--
		--       -- add to your shared on_attach callback
		-- if client.supports_method("textDocument/formatting") then
		-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		-- 	vim.api.nvim_create_autocmd("BufWritePre", {
		-- 		group = augroup,
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			lsp_formatting(bufnr)
		-- 		end,
		-- 	})
		-- end
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
