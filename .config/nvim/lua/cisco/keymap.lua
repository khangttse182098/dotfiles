-- Set leader to Space
vim.g.mapleader = " "

--move line
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })

--paste without losing buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Center screen when ctrl+d and ctrl+u
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

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
