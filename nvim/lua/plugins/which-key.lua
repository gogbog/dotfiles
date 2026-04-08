return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = 300,
		spec = {
			{ "<leader>f", group = "find/file" },
			{ "<leader>g", group = "git" },
			{ "<leader>t", group = "test" },
			{ "<leader>d", group = "diagnostics/debug" },
			{ "<leader>c", group = "code" },
			{ "<leader>r", group = "rename/replace" },
			{ "<leader>w", group = "save" },
			{ "<leader>x", group = "trouble" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer keymaps",
		},
	},
}
