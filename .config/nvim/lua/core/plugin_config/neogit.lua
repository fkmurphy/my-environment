require("neogit").setup({
	kind = "tab",
	signs = {
		section = { "", "" },
		item = { "", "" },
		hunk = { "", "" },
	},
	integrations = {
		diffview = true,
	},
	sections = {
		untracked = {
			folded = false,
		},
		unstaged = {
			folded = false,
		},
		staged = {
			folded = false,
		},
	},
})

vim.keymap.set("n", "<leader>gs", function()
	require("neogit").open()
end, { desc = "Neogit status" })

vim.keymap.set("n", "<leader>gc", function()
	require("neogit").open({ "commit" })
end, { desc = "Neogit commit" })

vim.keymap.set("n", "<leader>gp", function()
	require("neogit").open({ "push" })
end, { desc = "Neogit push" })

vim.keymap.set("n", "<leader>gl", function()
	require("neogit").open({ "log" })
end, { desc = "Neogit log" })