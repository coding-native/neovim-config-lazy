return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	init = function()
		vim.treesitter.language.register("templ", "templ")
		vim.treesitter.language.register("twig", "tera")
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { "*" },
			callback = function()
				if
					not string.find(vim.bo.filetype, "blink-cmp-menu")
					and not string.find(vim.bo.filetype, "snacks")
				then
					vim.treesitter.start()
				end
			end,
		})
	end,
	config = {
		modules = {},
		ignore_install = {},
		sync_install = false,
		auto_install = true,
		ensure_installed = {
			"bicep",
			"bash",
			"c",
			"css",
			"c_sharp",
			"cmake",
			"cpp",
			"diff",
			"dockerfile",
			"go",
			"graphql",
			"html",
			"jsdoc",
			"json",
			"json5",
			"latex",
			"lua",
			"make",
			"markdown",
			"python",
			"regex",
			"rust",
			"scss",
			"sql",
			"templ",
			"terraform",
			"toml",
			"tsx",
			"twig",
			"vim",
			"yaml",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
			disable = {},
		},
		autotag = {
			enable = true,
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},
	},
}
