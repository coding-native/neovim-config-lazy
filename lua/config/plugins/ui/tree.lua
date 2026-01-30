return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		sort_by = "case_sensitive",
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			custom = { "^.git" },
			exclude = { ".gitignore" },
		},
	},
	keys = {
		{ "<leader>nt", [[:NvimTreeOpen<CR>]], desc = "Nvim Tree Open" },
		{ "<leader>ntf", [[:NvimTreeFocus<CR>]], desc = "Nvim Tree Focus" },
		{ "<leader>ntt", [[:NvimTreeToggle<CR>]], desc = "Nvim Tree Toggle" },
	},
}
