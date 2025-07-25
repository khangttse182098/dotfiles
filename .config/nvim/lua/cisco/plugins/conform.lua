return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "djlint" },
				css = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
				-- 🔥 Only format lines that changed in the current buffer
				format_opts = {
					-- Set this to true if the formatter supports range formatting
					-- biome, prettier, stylua, etc. do NOT, so this will silently fall back to full file
					only_modified = true,
				},
			},
		})
	end,
}
