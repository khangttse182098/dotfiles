return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp", -- Enable LSP diagnostics
          diagnostics_indicator = function(count, level, _, _)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
        },
      })

      local keymap = vim.keymap.set
      local opts = { desc = "Move buffer" }

      -- Move between buffers
      keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
      keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

      -- Move buffers left and right
      keymap("n", "<leader><S-h>", "<cmd>BufferLineMovePrev<CR>", opts)
      keymap("n", "<leader><S-l>", "<cmd>BufferLineMoveNext<CR>", opts)

      -- delete a buffer
      keymap("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })
    end
  }
}
