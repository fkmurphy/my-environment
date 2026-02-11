local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-t>"] = actions.select_tab,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
			},
			n = {
				["<C-t>"] = actions.select_tab,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["t"] = actions.select_tab,
				["s"] = actions.select_horizontal,
				["v"] = actions.select_vertical,
			},
		},
		layout_strategy = "vertical",
		layout_config = {
			vertical = {
				width = 0.9,
				height = 0.9,
				preview_height = 0.5,
			},
		},
		set_env = { COLORTERM = "truecolor" },
		file_ignore_patterns = {
			"vendor",
			"node_modules",
		},
		history = {
			path = vim.fn.stdpath("data") .. "/databases/telescope_history.sqlite3",
			limit = 100,
		},
	},
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- pickers LSP
vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "LSP References" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "LSP References" })
vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "LSP Definitions" })

-- otros pickers
vim.keymap.set("n", "<leader>lo", builtin.treesitter, { desc = "Document Symbols (Tree)" })
vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>gI", builtin.lsp_implementations, { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions, { desc = "Type Definitions" })
