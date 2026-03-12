-- Use lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},
	-- pack manager
	-- 'wbthomason/packer.nvim', -- use lazy.nvim
	-- visual
	"ellisonleao/gruvbox.nvim",
	"bluz71/vim-nightfly-colors",
	"rebelot/kanagawa.nvim",
	-- {
	--   'dracula/vim',
	--   lazy = false,
	-- },
	-- {
	--   'marko-cerovac/material.nvim',
	--   lazy = false,
	-- },
	-- 'ryanoasis/vim-devicons',
	-- 'mortepau/codicons.nvim',
	-- 'yamatsum/nvim-nonicons',
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	"nvim-neotest/nvim-nio",

	-- dir tree
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",

	-- status line
	"nvim-lualine/lualine.nvim",

	-- improvement highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/nvim-treesitter-textobjects",

	-- Testing (neotest reemplaza vim-test)
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
		},
	},

	-- git decorations and use into the vim
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	-- not use "github/copilot.vim",
	--
	-- tmux interact
	"preservim/vimux",
	"christoomey/vim-tmux-navigator",

	-- Easy comments
	"tpope/vim-commentary",

	-- rust tools
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"simrat39/rust-tools.nvim",

	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	-- prettier for typescript projects (lara wrong format after save)
	-- "prettier/vim-prettier",
	-- replace vim-prettier with prettierd mason
	"mhartington/formatter.nvim",
	-- rules typescript eslint, rename files
	-- archived 'jose-elias-alvarez/nvim-lsp-ts-utils',
	-- deprecated "glepnir/lspsaga.nvim", use native
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- surround quotes, parent, etc
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},
	-- code outline / structure tree
	{
		"stevearc/aerial.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	"mfussenegger/nvim-lint",

	-- AI
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
			{ "folke/snacks.nvim", opts = { input = {}, picker = {} } },
			-- {
			-- 	"e-cal/opencode-tmux.nvim",
			-- 	opts = {
			-- 		options = "-h",
			-- 		focus = false,
			-- 		auto_close = true,
			-- 		allow_passthrough = true,
			-- 		find_sibling = true,
			-- 	},
			-- },
		},
	},

	-- Session Manager
	{
		"Shatur/neovim-session-manager",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Productividad: navegación y keymaps
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"gbprod/yanky.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- UI/UX
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {},
	},

	-- LSP/Desarrollo
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		opts = {},
	},
	{
		"smjonas/inc-rename.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"dnlhc/glance.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Git mejorado
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		opts = {},
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Markdown preview (renderizado dentro de Neovim)
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "md" },
		opts = {},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
