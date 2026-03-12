require("ibl").setup({
	indent = {
		char = "│",
	},
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
	},
	exclude = {
		filetypes = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"lazy",
			"mason",
			"notify",
			"toggleterm",
			"lazyterm",
		},
	},
})