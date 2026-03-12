require("glance").setup({
	border = {
		enable = true,
	},
	theme = {
		enable = true,
		mode = "auto",
	},
})

vim.keymap.set("n", "gpd", "<Cmd>Glance definitions<CR>", { desc = "Glance definitions" })
vim.keymap.set("n", "gpr", "<Cmd>Glance references<CR>", { desc = "Glance references" })
vim.keymap.set("n", "gpi", "<Cmd>Glance implementations<CR>", { desc = "Glance implementations" })
vim.keymap.set("n", "gpt", "<Cmd>Glance type_definitions<CR>", { desc = "Glance type definitions" })