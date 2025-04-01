require("cisco.keymap")
require("cisco.set")
require("cisco.plugins.init")


vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#ddc7a1' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#bcbcbc' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#ddc7a1' })
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "#bcbcbc", fg = "#303030" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#bcbcbc", fg = "#303030" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#bcbcbc" })

-- nerd font
vim.g.have_nerd_font = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- add cursor line
vim.opt.cursorline = true
