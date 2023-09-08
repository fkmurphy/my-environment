vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<leader>nt', ':NERDTreeFind<CR>')
-- save
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')

-- fast access fzf.vim search
vim.keymap.set('n', '<leader>f', ':Files<CR>')
vim.keymap.set('n', '<leader>b', ':Buffers<CR>')
vim.keymap.set('n', '<leader>ag', ':Ag<CR>')
vim.keymap.set('n', '<leader>fb', ':History<CR>')


--- search easymotion temp. disabled
-- vim.keymap.set('n', '<leader>s', '<Plug>(easymotion-s2)')

-- vertical disabled not found
vim.keymap.set('n', '<leader>vr', ':vertical res')

vim.keymap.set('i', '(', '()<left>', { noremap = true })
vim.keymap.set('i', '[', '[]<left>', { noremap = true })
vim.keymap.set('i', '{', '{}<left>', { noremap = true })
vim.keymap.set('i', '{', '{}<left>', { noremap = true })
vim.keymap.set('i', '{<CR>', '{<CR>}<ESC>0', { noremap = true })
vim.keymap.set('i', '{;<CR>', '{<CR>};<ESC>0', { noremap = true })
