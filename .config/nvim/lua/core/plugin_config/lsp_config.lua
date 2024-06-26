-- configuration https://nvimdev.github.io/lspsaga/

local lspconfig = require("lspconfig")

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'html',
        'diagnosticls',
        'cssls',
        'astro',
        'solidity'
    },
    handlers = {
        function(server, opts)
            lspconfig[server].setup({})
        end,
        ['eslint'] = function()
            lspconfig.eslint.setup({
                capabilities = capabilities,
                format = { enable = true },
                autoFixOnSave = false,
                codeActionsOnSave = {
                    mode = "all",
                    rules = { "!debugger", "!no-only-tests/*" },
                },
                lintTask = {
                    enable = true,
                },
            })
        end,
        ['tsserver'] = function()
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "literal",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = false,
                            includeInlayVariableTypeHints = false,
                            includeInlayPropertyDeclarationTypeHints = false,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                    completions = {
                        completeFunctionCalls = true
                    }
                }
            })
        end
    }
})


vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    virtual_text = false,
    --virtual_text = {
    --    spacing = 4,
    --    source = "if_many",
    --},
    severity_sort = true,
    float = {
        format = function(diagnostic)
          if diagnostic.source == 'eslint' then
            return string.format(
              '%s [%s]',
              diagnostic.message,
              -- shows the name of the rule
              diagnostic.user_data.lsp.code
            )
          end
          return string.format('%s [%s]', diagnostic.message, diagnostic.source)
        end,
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

require('lspsaga').setup({
    lightbulb = {
        sign = false,
       -- autocmd = {
       --     enabled = false
       -- }
    },
    ui = {
        code_action = "🤔",
        -- border = 'none',
    },
    symbol_in_winbar = {
        in_custom = false,
        enable = true,
        separator = ' ',
        show_file = true,
        file_formatter = ""
    },
})

local opts = { noremap= true, silent = true }

vim.keymap.set("n", "<Leader>gd", "<cmd>Lspsaga goto_definition<CR>", opts)
vim.keymap.set("n", "<Leader>pd", "<cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "<Leader>gr", "<cmd>Lspsaga finder<CR>", opts)
vim.keymap.set("n", "<Leader>lo", "<cmd>Lspsaga outline<CR>", opts)
-- vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
-- vim.keymap.set('i', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<Leader>ge', "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set('n', '<Leader>gp', "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set('n', '<Leader>ke', vim.diagnostic.setloclist, opts) -- https://www.reddit.com/r/neovim/comments/vkugqr/new_plugin_to_show_diagnostics_in_a_split_window/


lspconfig.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
            telemetry = {
                enable = false
            }
        },
    }
}

-- lspconfig.solargraph.setup {
--   capabilities = capabilities,
-- }

lspconfig.pyright.setup {
    capabilities = capabilities,
}

lspconfig.tflint.setup {
    capabilities = capabilities,
}

-- lspconfig.eslint.setup {
--     enable = false
-- }
-- lspconfig.tsserver.setup {
--     enable = false
-- }



-- review in the future, cpu 100% usage
-- i wrote console.log and cpu ->>>> rokcet
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
--     vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--         underline = true,
--         update_in_insert = false,
--     })(...)
--     pcall(vim.diagnostic.setloclist, { open = false })
-- end
--
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--     border = vim.g.floating_window_border_dark,
-- })
--
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--     border = vim.g.floating_window_border_dark,
-- })
