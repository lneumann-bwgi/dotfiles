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

null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.cspell,
		null_ls.builtins.diagnostics.cspell,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "tsql" },
		}),
		-- null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.cljstyle,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.json_tool,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.ruff,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "tsql" },
		}),
	},
	on_attach = on_attach,
})
