local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("cisco.plugins.colorscheme"),
	require("cisco.plugins.lsp"),
	require("cisco.plugins.completion"),
	require("cisco.plugins.telescope"),
	require("cisco.plugins.devicons"),
	require("cisco.plugins.mini"),
	require("cisco.plugins.treesitter"),
	require("cisco.plugins.session"),
	require("cisco.plugins.lazygit"),
	require("cisco.plugins.bufferline"),
	require("cisco.plugins.marks"),
	require("cisco.plugins.ts-autotag"),
	require("cisco.plugins.autopairs"),
	require("cisco.plugins.conform"),
	require("cisco.plugins.colorizer"),
	require("cisco.plugins.comment"),
	require("cisco.plugins.render-markdown"),
	require("cisco.plugins.markdown-preview"),
	-- require("cisco.plugins.flash"),
	require("cisco.plugins.vim-visual-multi"),
	require("cisco.plugins.gitsigns"),
	require("cisco.plugins.processing"),
})
