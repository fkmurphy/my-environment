vim.o.termguicolors = true
-- Thems: https://github.com/rockerBOO/awesome-neovim

-- vim.cmd [[ colorscheme dracula ]]

-- material
--vim.g.material_style = "deep ocean"
--vim.cmd [[ colorscheme material ]]

-- tokyonight https://github.com/folke/tokyonight.nvim
--vim.cmd [[ colorscheme tokyonight-storm ]]
vim.cmd [[ colorscheme tokyonight-night ]]


-- telescope config tokyonight
require("tokyonight").setup({
    style = "night",
    transparent = true,
    styles = {
        comments = { italic = true },
        functions = {},
    },
    -- on_highlights = function(hl, c)
    --     local prompt = "#2d3149"
    --     hl.TelescopeNormal = {
    --         bg = "transparent", -- c.bg_dark
    --         fg = c.fg_dark,
    --     }
    --     hl.TelescopeBorder = {
    --         bg = c.bg_dark,
    --         fg = c.bg_dark,
    --     }
    --     hl.TelescopePromptNormal = {
    --         bg = prompt,
    --     }
    --     hl.TelescopePromptBorder = {
    --         bg = prompt,
    --         fg = prompt,
    --     }
    --     hl.TelescopePromptTitle = {
    --         bg = prompt,
    --         fg = prompt,
    --     }
    --     hl.TelescopePreviewTitle = {
    --         bg = c.bg_dark,
    --         fg = c.bg_dark,
    --     }
    --     hl.TelescopeResultsTitle = {
    --         bg = c.bg_dark,
    --         fg = c.bg_dark,
    --     }
    -- end,
})

--vim.cmd [[ colorscheme gruvbox ]]
--vim.cmd [[ colorscheme kanagawa ]]
