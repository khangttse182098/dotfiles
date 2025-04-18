return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				highlights = {
					fill = {
						bg = "#303030",
					},
				},
				options = {
					show_buffer_icons = true,
					separator_style = { "", "" },
					tab_size = 8,
					show_buffer_close_icons = false,
					diagnostics = "nvim_lsp", -- Enable LSP diagnostics
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local icons = {
							error = "",
							warning = "",
							info = "",
							hint = "󰌵",
						}

						if diagnostics_dict.error then
							return " " .. icons.error--[[  .. " " .. diagnostics_dict.error ]]
						elseif diagnostics_dict.warning then
							return " " .. icons.warning--[[ .. " " .. diagnostics_dict.warning ]]
						elseif diagnostics_dict.info then
							return " " .. icons.info--[[ .. " " .. diagnostics_dict.info ]]
						elseif diagnostics_dict.hint then
							return " " .. icons.hint--[[ .. " " .. diagnostics_dict.hint ]]
						end

						return ""
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
		end,
	},
}
