-- Set leader to Space
vim.g.mapleader = " "

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true, silent = true })

-- Center screen when ctrl+d and ctrl+u
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Save with ctrl + s and format
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<Esc><cmd>w<CR><cmd>lua vim.lsp.buf.format()<CR>',
  { noremap = true, silent = true })
