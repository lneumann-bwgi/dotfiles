local function nmap(shortcut, command)
	vim.keymap.set("n", shortcut, command, { noremap = true, silent = true })
end

-- Mapping
nmap("<leader>b", ":DapToggleBreakpoint<CR>")
nmap("<leader>B", ":DapToggleRepl<CR>")
nmap("<F5>", ":DapStepInto<CR>")
nmap("<F6>", ":DapStepOut<CR>")
nmap("<F7>", ":DapStepOver<CR>")
nmap("<F8>", ":DapContinue<CR>")
nmap("<F9>", ':lua require("dapui").toggle()')

require("dapui").setup()
require("dap-python").setup("python")
require("gopher.dap").setup()
