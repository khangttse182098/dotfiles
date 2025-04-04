return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = 'soft'
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_statusline_style = 'default'
    vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted'
    vim.cmd.colorscheme('gruvbox-material')
  end,
}
