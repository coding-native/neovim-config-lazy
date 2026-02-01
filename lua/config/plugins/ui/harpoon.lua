return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/snacks.nvim",
	},
	opts = {},
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon Add File",
		},
		{
			"<leader>r",
			function()
				require("harpoon"):list():remove()
			end,
			desc = "Harpoon Remove File",
		},
		{
			"<C-h>",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon Go to File 1",
		},
		{
			"<C-t>",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon Go to File 2",
		},
		{
			"<C-n>",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon Go to File 3",
		},
		{
			"<C-s>",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon Go to File 4",
		},
		{
			"<C-S-P>",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Harpoon Previous File",
		},
		{
			"<C-S-N>",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Harpoon Next File",
		},
	},
}
