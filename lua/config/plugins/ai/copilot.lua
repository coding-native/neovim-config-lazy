return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"copilotlsp-nvim/copilot-lsp",
	},
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		filetypes = {
			dockerfile = true,
			markdown = true, -- overrides default
			terraform = true, -- disallow specific filetype
			javascript = true,
			typescript = true,
			proto = true,
			python = true,
			cpp = true,
			csharp = true,
			go = true,
			lua = true,
			sh = function()
				if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
					-- disable for .env files
					return false
				end
				return true
			end,
			["*"] = false, -- disable for all other filetypes
		},
		suggestion = { enabled = false },
		panel = { enabled = false },
	},
}
