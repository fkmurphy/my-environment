local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

ts_configs.setup({
	ensure_installed = {
		"c",
		"lua",
		"rust",
		"ruby",
		"vim",
		"php",
		"html",
		"typescript",
		"tsx",
		"javascript",
		"json",
		"terraform",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	fold = { enable = true },
	sync_install = false,
	auto_install = false,
	textobjects = {
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
