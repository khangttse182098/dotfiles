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
    'echasnovski/mini.files',
    lazy = true,
    keys = {
      { '<leader>e', function() require('mini.files').open() end, desc = 'Open mini.files' }
    },
    config = function()
      require('mini.files').setup({
        mappings = {
          synchronize = "s",
          close       = "<leader>e",
        },
        windows = {
          preview = true
        }
      })
    end,
  },
}
