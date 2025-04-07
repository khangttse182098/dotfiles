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

--show hover
vim.keymap.set('n', '<leader>k', function()
  local float_opts = {
    focusable = true,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = "rounded",
    source = "always",
    prefix = " ",
    scope = "cursor",
  }

  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if diagnostics and #diagnostics > 0 then
    vim.diagnostic.open_float(nil, float_opts)
  else
    -- Try to use LSP hover with scroll support
    vim.lsp.buf.hover()
  end
end, { desc = "Show diagnostics or LSP hover info" })

--rename
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "LSP Rename" })
