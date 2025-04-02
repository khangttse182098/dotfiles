return {
  {
    'echasnovski/mini.pairs',
    config = function()
      require('mini.pairs').setup()
    end,
  },
  {
    'echasnovski/mini.comment',
    config = function()
      require('mini.comment').setup()
    end,
  },
  {
    'echasnovski/mini.icons',
    config = function()
      require('mini.icons').setup()
    end,

  },
  {
    'echasnovski/mini.files',
    config = function()
      require('mini.files').setup({
        mappings = {
          go_in_plus = "<CR>",
          synchronize = "s"
        }
      })
      vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open(nil, false)<CR>',
        { noremap = true, silent = true })
    end,
  },
}
