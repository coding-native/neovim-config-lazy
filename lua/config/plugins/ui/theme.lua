return {
	"folke/tokyonight.nvim",
	lazy = false,
	init = function()
		vim.cmd([[ colorscheme tokyonight-night ]])
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ec5f67" })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#c678dd" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#008080" })
	end,
	opts = {
		transparent = true,
		hide_inactive_statusline = true,
		dim_inactive = true,
	},
}
