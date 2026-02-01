return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- NOTE: The log_level is in `opts.opts`
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
		display = {
			action_palette = {
				width = 95,
				height = 10,
				prompt = "Prompt ", -- Prompt used for interactive LLM calls
				provider = "snacks", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
				opts = {
					show_preset_actions = true, -- Show the preset actions in the action palette?
					show_preset_prompts = true, -- Show the preset prompts in the action palette?
					title = "CodeCompanion actions", -- The title of the action palette
				},
			},
		},
		interactions = {
			background = {
				adapter = {
					name = "copilot",
					model = "gpt-4.1",
				},
			},
			chat = {
				adapter = {
					name = "copilot",
					model = "gpt-4.1",
				},
				keymaps = {
					send = {
						modes = { n = "<C-l>", i = "<C-l>" },
						opts = {},
					},
					close = {
						modes = { n = "<C-x>", i = "<C-x>" },
						opts = {},
					},
				},
			},
			cmd = {
				adapter = {
					name = "copilot",
					model = "gpt-4.1",
				},
			},
			inline = {
				adapter = {
					name = "copilot",
					model = "gpt-4.1",
				},
			},
		},
	},
	keys = {
		{
			"<C-a>",
			"<cmd>CodeCompanionActions<cr>",
			desc = "Code Companion Actions",
			mode = { "n", "v" },
		},
		{
			"<leader>ai",
			"<cmd>CodeCompanionChat Toggle<cr>",
			desc = "Code Companion Chat",
			mode = { "n", "v" },
		},
		{
			"<leader>ca",
			"<cmd>CodeCompanionChat Add<cr>",
			desc = "Code Companion Chat",
			mode = "v",
		},
	},
}
