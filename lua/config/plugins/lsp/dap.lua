return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"Civitasv/cmake-tools.nvim",
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
	},
	config = function()
		local get_dependency = function(name)
			local status, dep = pcall(require, name)
			if not status then
				return nil
			end
			return dep
		end

		local dap = get_dependency("dap")
		local dapui = get_dependency("dapui")
		local dapgo = get_dependency("dap-go")
		local nvim_dap_virtual_text = get_dependency("nvim-dap-virtual-text")

		if not dap or not dapui or not dapgo or not nvim_dap_virtual_text then
			return
		end

		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "DapStopped", linehl = "DebugLineHL", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "🔶", texthl = "DapBreakpoint", linehl = "", numhl = "" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "⚠️", texthl = "DapBreakpoint", linehl = "", numhl = "" }
		)

		dapui.setup()
		dapgo.setup()
		nvim_dap_virtual_text.setup({
			display_callback = function(variable)
				local name = string.lower(variable.name)
				local value = string.lower(variable.value)
				if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
					return "(凸ಠ益ಠ)凸"
				end
				if #variable.value > 15 then
					return " " .. string.sub(variable.value, 1, 15) .. "... "
				end

				return " " .. variable.value
			end,
		})

		local dap_executables = {
			codelldb = vim.fn.exepath("codelldb"),
		}

		dap.adapters.codelldb = {
			type = "executable",
			command = dap_executables["codelldb"],
			name = "codelldb",
			detached = true,
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

		-- Eval var under cursor
		vim.keymap.set("n", "<leader>?", function()
			require("dapui").eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F2>", dap.step_into)
		vim.keymap.set("n", "<F3>", dap.step_over)
		vim.keymap.set("n", "<F4>", dap.step_out)
		vim.keymap.set("n", "<F5>", dap.step_back)
		vim.keymap.set("n", "<F13>", dap.restart)
	end,
}
