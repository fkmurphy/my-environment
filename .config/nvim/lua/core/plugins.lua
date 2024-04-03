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
    -- pack manager
    'wbthomason/packer.nvim',
    -- visual
    'ellisonleao/gruvbox.nvim',
    'bluz71/vim-nightfly-colors',
    'rebelot/kanagawa.nvim',
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


    -- dir tree
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- status line
    'nvim-lualine/lualine.nvim',

    -- improvement highlighting
    'nvim-treesitter/nvim-treesitter',
    'vim-test/vim-test',

    -- git decorations and use into the vim
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
    -- not use "github/copilot.vim",
    --
    -- tmux interact
    'preservim/vimux',
    'christoomey/vim-tmux-navigator',

    -- Easy comments
    'tpope/vim-commentary',

    -- rust tools
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'simrat39/rust-tools.nvim',

    -- completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
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
    "glepnir/lspsaga.nvim",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    -- surround quotes, parent, etc
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy"
    },
    'mfussenegger/nvim-lint'
}

local opts = {}

require("lazy").setup(plugins, opts)
