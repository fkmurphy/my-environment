-- configuration https://nvimdev.github.io/lspsaga/

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'html',
        'cssls',
    },
    handlers = {
        function(server)
        lspconfig[server].setup({})
        end,
        ['tsserver'] = function()
        lspconfig.tsserver.setup({
            settings = {
            completions = {
                completeFunctionCalls = true
            }
            }
        })
        end
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspsaga').setup({
  lightbulb = {
    sign = false,
  },
  ui = {
    code_action = "📈",
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

vim.keymap.set("n", "<Leader>gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
vim.keymap.set("n", "<Leader>pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "<Leader>gr", "<cmd>Lspsaga finder<CR>", { silent = true })
vim.keymap.set("n", "<Leader>lo", "<cmd>Lspsaga outline<CR>", { silent = true })
-- vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

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
    },
  }
}

lspconfig.solargraph.setup {
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  capabilities = capabilities,
}
