-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- gruvbox-material
require("lazy").setup({
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
  -- Optionally configure and load the colorscheme
  -- directly inside the plugin declaration.  
  vim.g.gruvbox_material_background = 'soft'
  vim.g.gruvbox_material_better_performance = 1      
  vim.g.gruvbox_material_statusline_style = 'default'
  vim.cmd.colorscheme('gruvbox-material')
  end
})
