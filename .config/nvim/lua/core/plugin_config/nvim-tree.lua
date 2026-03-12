vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	view = {
		adaptive_size = true,
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 2000,
	},
	filters = {
		dotfiles = false,
		custom = { ".git", "node_modules" },
	},
})

-- default vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<Leader>nt', ':NvimTreeFindFileToggle<CR>')
