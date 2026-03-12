require("which-key").setup({
	preset = "modern",
	delay = 500,
	icons = {
		mappings = true,
		keys = {},
	},
	plugins = {
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = false,
			nav = false,
			z = true,
			g = true,
		},
	},
	spec = {
		{ "<leader>f", group = "find", icon = "" },
		{ "<leader>g", group = "git/goto", icon = "" },
		{ "<leader>x", group = "diagnostics/trouble", icon = "" },
		{ "<leader>c", group = "code", icon = "" },
		{ "<leader>h", group = "git hunk", icon = "" },
		{ "<leader>ha", group = "harpoon", icon = "" },
		{ "<leader>s", group = "search", icon = "" },
		{ "<leader>t", group = "test", icon = "" },
	},
})