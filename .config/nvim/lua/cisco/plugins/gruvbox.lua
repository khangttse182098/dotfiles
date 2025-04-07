return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = 'soft'
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_statusline_style = 'default'
    vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted'
    vim.g.gruvbox_material_enable_bold = 1
    vim.diagnostic.config({
      virtual_text = {
        prefix = '■',
        spacing = 2,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    vim.cmd.colorscheme('gruvbox-material')
  end,
}
