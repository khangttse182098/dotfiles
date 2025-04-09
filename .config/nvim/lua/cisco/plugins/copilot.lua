return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    keys = {
      { '<leader>cc', function() require('CopilotChat').open() end,       desc = 'Open Copilot Chat' },
      { '<leader>cf', function() require('CopilotChat').close() end,      desc = 'Close Copilot Chat' },
      { '<leader>ci', function() require('CopilotChat').insert() end,     desc = 'Insert Copilot Chat' },
      { '<leader>cI', function() require('CopilotChat').insert(true) end, desc = 'Insert Copilot Chat (with input)' },
      {
        '<leader>cv',
        function()
          local start_pos = vim.fn.getpos("'<")
          local end_pos = vim.fn.getpos("'>")

          local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
          local selected_text = table.concat(lines, "\n")

          require("CopilotChat").open({
            prompt = selected_text,
          })
        end,
        mode = 'x',
        desc = 'Copilot Chat on Visual Selection'
      },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
    },
    config = function()
      local width = 80
      local height = 20
      require("CopilotChat").setup({
        window = {
          layout = 'float',
          relative = 'editor',
          border = 'rounded',
          width = width,
          height = height,
        },
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
      })
    end
  },
}
