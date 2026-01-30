return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "jvgrootveld/telescope-zoxide" },
	},
	init = function()
		local telescope = require("telescope")

		telescope.load_extension("live_grep_args")
		telescope.load_extension("file_browser")
		telescope.load_extension("zoxide")
	end,
	opts = function()
		local actions = require("telescope.actions")
		local lga_actions = require("telescope-live-grep-args.actions")
		local z_utils = require("telescope._extensions.zoxide.utils")
		return {
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
				ripgrep_arguments = {
					"rg",
					"--hidden",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true,
					mappings = { -- extend mappings
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
				zoxide = {
					prompt_title = "[ Walking on the shoulders of TJ ]",
					mappings = {
						default = {
							after_action = function(selection)
								print("Update to (" .. selection.z_score .. ") " .. selection.path)
							end,
						},
						["<C-s>"] = {
							before_action = function(selection)
								print("before C-s")
							end,
							action = function(selection)
								vim.cmd.edit(selection.path)
							end,
						},
						-- Opens the selected entry in a new split
						["<C-q>"] = { action = z_utils.create_basic_command("split") },
					},
				},
			},
			file_browser = {
				theme = "tokyonight",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		}
	end,
	keys = {
		{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep_args<cr>", desc = "Live Grep Args" },
		{ "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
		{ "<leader>fbb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File Browser (cwd)" },
		{ "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide" },
	},
}
