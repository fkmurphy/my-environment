require("flash").setup({
	modes = {
		char = {
			enabled = false,
		},
	},
})

vim.keymap.set({ "n", "x", "o" }, "ss", function()
	require("flash").jump()
end, { desc = "Flash jump" })

vim.keymap.set({ "n", "x", "o" }, "st", function()
	require("flash").treesitter()
end, { desc = "Flash treesitter" })