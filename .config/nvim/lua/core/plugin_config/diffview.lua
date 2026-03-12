require("diffview").setup({
	diff_binaries = false,
	enhanced_diff_hl = false,
	use_icons = true,
	icons = {
		folder_closed = "",
		folder_open = "",
	},
	signs = {
		fold_closed = "",
		fold_open = "",
		done = "",
	},
	view = {
		default = {
			layout = "diff2_horizontal",
		},
	},
	file_history_panel = {
		log_options = {
			git = {
				single_file = {
					diff_merges = "combined",
				},
				multi_file = {
					diff_merges = "first-parent",
				},
			},
		},
	},
})

vim.keymap.set("n", "<leader>gdo", "<Cmd>DiffviewOpen<CR>", { desc = "Diffview open" })
vim.keymap.set("n", "<leader>gdc", "<Cmd>DiffviewClose<CR>", { desc = "Diffview close" })
vim.keymap.set("n", "<leader>gdr", "<Cmd>DiffviewRefresh<CR>", { desc = "Diffview refresh" })
vim.keymap.set("n", "<leader>gdh", "<Cmd>DiffviewFileHistory %<CR>", { desc = "Diffview file history" })
vim.keymap.set("n", "<leader>gdH", "<Cmd>DiffviewFileHistory<CR>", { desc = "Diffview branch history" })