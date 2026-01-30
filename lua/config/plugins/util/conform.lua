return {
	"stevearc/conform.nvim",
	init = function()
		local conform = require("conform")
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})
	end,
	opts = {
		formatters_by_ft = {
			go = { "gofmt", "goimports", "golines" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			python = { "ruff_format", "ruff_organize_imports" },
			rust = { "rustfmt" },
			typescript = { "prettierd" },
			templ = { "templ" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
