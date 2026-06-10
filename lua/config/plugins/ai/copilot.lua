return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		filetypes = {
			dockerfile = true,
			markdown = true,
			terraform = true,
			javascript = true,
			typescript = true,
			proto = true,
			python = true,
			cpp = true,
			csharp = true,
			go = true,
			lua = true,
			rust = true,
			sh = function()
				if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
					return false
				end
				return true
			end,
			["*"] = false,
		},
		suggestion = { enabled = false },
		panel = { enabled = false },
		nes = {
			enabled = false,
		},
	},
}
