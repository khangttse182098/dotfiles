return {
  {
    'voldikss/vim-floaterm',
    config = function()
      -- Map Escape + Escape to :FloatermToggle
      vim.api.nvim_set_keymap('n', '<leader>o', ':FloatermToggle<CR>', { noremap = true, silent = true })

      -- Ensure that <Esc><Esc> works in terminal mode as well
      vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, silent = true })
    end
  }
}
