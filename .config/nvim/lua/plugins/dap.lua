return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",

		-- Debuggers
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		require("dap-go").setup()
		require("dapui").setup()

		vim.keymap.set('n', '<leader>c', function() dap.continue() end)
		vim.keymap.set('n', '<leader>so', function() dap.step_over() end)
		vim.keymap.set('n', '<leader>si', function() dap.step_into() end)
		vim.keymap.set('n', '<leader>su', function() dap.step_out() end)
		vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
		vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
		vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
		vim.keymap.set('n', '<leader>st', function() dapui.close() end)

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
	end
}
