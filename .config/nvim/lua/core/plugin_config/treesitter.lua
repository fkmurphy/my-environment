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
})
