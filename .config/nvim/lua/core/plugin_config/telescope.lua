require('telescope').setup {
    defaults = {
        layout_strategy = "horizontal",
        set_env = { COLORTERM = 'truecolor' },
        file_ignore_patterns = {
            'vendor',
            'node_modules',
        },
        history = {
            path = vim.fn.stdpath('data') .. '/databases/telescope_history.sqlite3',
            limit = 100,
        },
    },
    -- pickers = {
    --     git_files = {
    --         hidden = true,
    --     },
    --     live_grep = {
    --         hidden = true,
    --     },
    -- },
}
-- require('telescope').load_extension('fzf')
-- require('telescope').load_extension('lsp_handlers')
-- require('telescope').load_extension('dap')
-- require('telescope').load_extension('session-lens')
-- require('telescope').load_extension('file_browser')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
-- vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
--


-- local TelescopePrompt = {
--     TelescopePromptNormal = {
--         bg = 'none',
--     },
--     TelescopePromptBorder = {
--         bg = '#2d3149',
--     },
--     TelescopePromptTitle = {
--         fg = '#2d3149',
--         bg = '#2d3149',
--     },
--     TelescopePreviewTitle = {
--         fg = '#1F2335',
--         bg = '#1F2335',
--     },
--     TelescopeResultsTitle = {
--         fg = '#1F2335',
--         bg = '#1F2335',
--     },
-- }
-- for hl, col in pairs(TelescopePrompt) do
--     vim.api.nvim_set_hl(0, hl, col)
-- end


-- config
-- local highlights = {
--     -- Sets the highlight for selected items within the picker.
--     TelescopeSelection = { default = true, link = "Visual" },
--     TelescopeSelectionCaret = { default = true, link = "TelescopeSelection" },
--     TelescopeMultiSelection = { default = true, link = "Type" },
--     TelescopeMultiIcon = { default = true, link = "Identifier" },
--
--     -- "Normal" in the floating windows created by telescope.
--     TelescopeNormal = { default = true, link = "TelescopeNormal" },
--     TelescopePreviewNormal = { default = true, link = "TelescopeNormal" },
--     TelescopePromptNormal = { default = true, link = "TelescopeNormal" },
--     TelescopeResultsNormal = { default = true, link = "TelescopeNormal" },
--
--     -- Border highlight groups.
--     --   Use TelescopeBorder to override the default.
--     --   Otherwise set them specifically
--     TelescopeBorder = { default = true, link = "TelescopeNormal" },
--     TelescopePromptBorder = { default = true, link = "TelescopeBorder" },
--     TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
--     TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },
--
--     -- Title highlight groups.
--     --   Use TelescopeTitle to override the default.
--     --   Otherwise set them specifically
--     TelescopeTitle = { default = true, link = "TelescopeBorder" },
--     TelescopePromptTitle = { default = true, link = "TelescopeTitle" },
--     TelescopeResultsTitle = { default = true, link = "TelescopeTitle" },
--     TelescopePreviewTitle = { default = true, link = "TelescopeTitle" },
--
--     TelescopePromptCounter = { default = true, link = "NonText" },
--
--     -- Used for highlighting characters that you match.
--     TelescopeMatching = { default = true, link = "Special" },
--
--     -- Used for the prompt prefix
--     TelescopePromptPrefix = { default = true, link = "Identifier" },
--
--     -- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer)
--     TelescopePreviewLine = { default = true, link = "Visual" },
--     TelescopePreviewMatch = { default = true, link = "Search" },
--
--     TelescopePreviewPipe = { default = true, link = "Constant" },
--     TelescopePreviewCharDev = { default = true, link = "Constant" },
--     TelescopePreviewDirectory = { default = true, link = "Directory" },
--     TelescopePreviewBlock = { default = true, link = "Constant" },
--     TelescopePreviewLink = { default = true, link = "Special" },
--     TelescopePreviewSocket = { default = true, link = "Statement" },
--     TelescopePreviewRead = { default = true, link = "Constant" },
--     TelescopePreviewWrite = { default = true, link = "Statement" },
--     TelescopePreviewExecute = { default = true, link = "String" },
--     TelescopePreviewHyphen = { default = true, link = "NonText" },
--     TelescopePreviewSticky = { default = true, link = "Keyword" },
--     TelescopePreviewSize = { default = true, link = "String" },
--     TelescopePreviewUser = { default = true, link = "Constant" },
--     TelescopePreviewGroup = { default = true, link = "Constant" },
--     TelescopePreviewDate = { default = true, link = "Directory" },
--     TelescopePreviewMessage = { default = true, link = "TelescopePreviewNormal" },
--     TelescopePreviewMessageFillchar = { default = true, link = "TelescopePreviewMessage" },
--
--     -- Used for Picker specific Results highlighting
--     TelescopeResultsClass = { default = true, link = "Function" },
--     TelescopeResultsConstant = { default = true, link = "Constant" },
--     TelescopeResultsField = { default = true, link = "Function" },
--     TelescopeResultsFunction = { default = true, link = "Function" },
--     TelescopeResultsMethod = { default = true, link = "Method" },
--     TelescopeResultsOperator = { default = true, link = "Operator" },
--     TelescopeResultsStruct = { default = true, link = "Struct" },
--     TelescopeResultsVariable = { default = true, link = "SpecialChar" },
--
--     TelescopeResultsLineNr = { default = true, link = "LineNr" },
--     TelescopeResultsIdentifier = { default = true, link = "Identifier" },
--     TelescopeResultsNumber = { default = true, link = "Number" },
--     TelescopeResultsComment = { default = true, link = "Comment" },
--     TelescopeResultsSpecialComment = { default = true, link = "SpecialComment" },
--     TelescopeResultsFileIcon = { default = true, link = "Normal" },
--
--     -- Used for git status Results highlighting
--     TelescopeResultsDiffChange = { default = true, link = "DiffChange" },
--     TelescopeResultsDiffAdd = { default = true, link = "DiffAdd" },
--     TelescopeResultsDiffDelete = { default = true, link = "DiffDelete" },
--     TelescopeResultsDiffUntracked = { default = true, link = "NonText" },
-- }
--
-- for k, v in pairs(highlights) do
--     vim.api.nvim_set_hl(0, k, v)
-- end
--
-- require('telescope.themes').get_dropdown({
--     borderchars = {
--         { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
--         prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
--         results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
--         preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
--     },
--     width = 0.8,
--     previewer = false,
--     prompt_title = false
-- })
