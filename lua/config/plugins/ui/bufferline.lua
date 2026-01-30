return {
	"akinsho/bufferline.nvim",
	lazy = false,
	init = function()
		vim.keymap.set("n", "gt", [[:BufferLineCycleNext<CR>]])
		vim.keymap.set("n", "gT", [[:BufferLineCyclePrev<CR>]])
	end,
	opts = {
		highlights = {
			buffer_selected = {
				bold = true,
				italic = true,
			},
			group_label = { bg = "#1e2030" },
			separator = { fg = "#1e2030" },
			fill = { bg = "#1e2030" },
			separator_visible = { fg = "#1e2030" },
			separator_selected = { fg = "#1e2030" },
			offset_separator = {
				bg = "#1e2030",
				italic = true,
				bold = true,
			},
		},
		options = {
			mode = "tabs",
			themable = true,
			indicator = {
				style = "underline",
			},
			separator_style = "slant",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "left",
					separator = true,
				},
			},
			color_icons = true,
		},
	},
}
