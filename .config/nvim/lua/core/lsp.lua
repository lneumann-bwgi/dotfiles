-- FROM: https://github.com/neovim/nvim-lspconfig

local api = vim.api
local opts = { noremap = true, silent = true }
api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
api.nvim_set_keymap("n", "<space>D", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

	if client.server_capabilities.documentHighlightProvider then
		api.nvim_command("autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()")
		api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
		api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()")
	end
end

-- from : https://github.com/williamboman/nvim-lsp-installer/issues/537
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	local server_opts = {
		on_attach = on_attach,
	}
	server:setup(server_opts)
end)

-- from: https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration#automatically-install-lsp-servers
local servers = {
	"bashls",
	"clojure_lsp",
	"dockerls",
	"gopls",
	"html",
	"jsonls",
	"julials",
	"pyright",
	-- "hls",
	"slangd",
	"sqlls",
	"sumneko_lua",
	"tsserver",
	"vimls",
}
for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end
