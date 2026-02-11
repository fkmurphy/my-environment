local Path = require('plenary.path')
local config = require('session_manager.config')

require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),
  autoload_mode = config.AutoloadMode.CurrentDir,
  autosave_last_session = true,
  autosave_ignore_not_normal = true,
  autosave_ignore_dirs = {},
  autosave_ignore_filetypes = {
    'gitcommit',
    'gitrebase',
  },
  autosave_ignore_buftypes = {},
  autosave_only_in_session = false,
  max_path_length = 80,
})

-- Keymaps
vim.keymap.set('n', '<leader>sl', ':SessionManager load_session<CR>', { desc = 'Load session' })
vim.keymap.set('n', '<leader>ss', ':SessionManager save_current_session<CR>', { desc = 'Save session' })
vim.keymap.set('n', '<leader>sd', ':SessionManager delete_session<CR>', { desc = 'Delete session' })
vim.keymap.set('n', '<leader>sf', ':SessionManager load_current_dir_session<CR>', { desc = 'Load current dir session' })

-- Save and quit
vim.keymap.set('n', '<leader>ll', function()
  vim.cmd('SessionManager save_current_session')
  vim.cmd('qa')
end, { desc = 'Save session and quit all' })

-- Auto-comandos para cerrar nvim-tree antes de guardar sesión
local config_group = vim.api.nvim_create_augroup('SessionManagerConfig', {})

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionLoadPost",
  group = config_group,
  callback = function()
    require('nvim-tree.api').tree.toggle(false, true)
  end,
})
