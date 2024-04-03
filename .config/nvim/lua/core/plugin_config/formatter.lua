-- local prettier = {
--   formatCommand = 'prettierd "${INPUT}"',
--   formatStdin = true,
--   env = {
--     string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
--   },
-- }

-- local prettierrc = {
--     function ()
--         return {
--             exe = "prettierd",
--             args = {vim.api.nvim_buf_get_name(0)},
--             stdin = true
--         }
--     end
-- }

local util = require "formatter.util"
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.DEBUG,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },
    typescript = { require('formatter.defaults.prettierd')},
    javascript = { require('formatter.defaults.prettierd')},
    json = { require('formatter.defaults.prettierd')},
    css = { require('formatter.defaults.prettierd')},
    scss = { require('formatter.defaults.prettierd')},
    less = { require('formatter.defaults.prettierd')},
    html = { require('formatter.defaults.prettierd')},
    yaml = { require('formatter.defaults.prettierd')},
    mjs = { require('formatter.defaults.prettierd')},
    tsx = { require('formatter.defaults.prettierd')},
    -- njk = { require('formatter.default.djlint')},

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.cmd [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]]

-- autosave all
-- vim.cmd[[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- OLD configuration wiht prettier npm prettier
-- vim.cmd [[
-- augroup fmt
--     autocmd!
--     autocmd BufWritePre *.mjs,*.css,*.less,*.scss,*.json,*.yaml,*.html,*.tsx,*.jsx,*.ts,*.js PrettierAsync
--     autocmd BufWritePre *.py,*.php lua vim.lsp.buf.format({ async: true })
-- augroup END
-- ]]

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     buffer = buffer,
--     callback = function()
--         vim.lsp.buf.format { async = false }
--     end
--
-- })
