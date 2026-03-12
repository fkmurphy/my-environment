require("trouble").setup({
	icons = false,
	fold_open = "v",
	fold_closed = ">",
	indent_lines = true,
	signs = {
		error = "E",
		warning = "W",
		hint = "H",
		information = "I",
	},
	use_diagnostic_signs = true,
})

vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end, { desc = "Toggle Trouble" })

vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end, { desc = "Trouble document diagnostics" })

vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end, { desc = "Trouble workspace diagnostics" })

vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end, { desc = "Trouble loclist" })

vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end, { desc = "Trouble quickfix" })