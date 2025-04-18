return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		-- Set up Telescope (optional, if you want additional configuration)
		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.45,
					},
					width = 0.99,
					height = 0.99,
					preview_cutoff = 100,
				},
				selection_caret = "➤ ",
				prompt_prefix = " 🔍  ",
				file_ignore_patterns = {
					"node_modules",
					"%.git/",
					"dist",
					"build",
					"package%-lock%.json",
				},
			},
		})

		-- Keymaps
		vim.keymap.set(
			"n",
			"<leader><leader>",
			':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
			{ desc = "Telescope find files" }
		)
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Telescope document symbol" })
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope LSP references" })
	end,
}
