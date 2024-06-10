-- from: github.com/tjdevries/config.nvim
local dap, dapui = require("dap"), require("dapui")

-- setup
dapui.setup()
require("dap-python").setup("python")
require("gopher.dap").setup()

-- require("nvim-dap-virtual-text").setup {
-- -- this just tries to mitigate the chance that i leak tokens here. probably won't stop it from happening...
-- display_callback = function(variable)
--     local name = string.lower(variable.name)
--     local value = string.lower(variable.value)
--     if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
--     return "*****"
--     end
--
--     if #variable.value > 15 then
--     return " " .. string.sub(variable.value, 1, 15) .. "... "
--     end
--
--     return " " .. variable.value
-- end,

-- use nvim-dap events to open and close the windows automatically
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- mappings
local function nmap(shortcut, command)
	vim.keymap.set("n", shortcut, command, { noremap = true, silent = true })
end

nmap("<F1>", dap.continue)
nmap("<F2>", dap.step_into)
nmap("<F3>", dap.step_over)
nmap("<F4>", dap.step_out)
nmap("<F5>", dap.step_back)
nmap("<F13>", dap.restart)
nmap("<leader>b", dap.toggle_breakpoint)
nmap("<space>gb", dap.run_to_cursor)
-- eval var under cursor
nmap("<space>?", function()
	require("dapui").eval(nil, { enter = true })
end)
