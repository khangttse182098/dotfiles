return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	{
		"kdheepak/cmp-latex-symbols",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			local cmp = require("cmp")

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lsp_signature_help" }, -- function arg popups while typing
				},
				{
					{ name = "buffer", keyword_length = 5 },
					{ name = "latex_symbols" },
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({
							mode = "symbol_text",
							-- symbol_map = kind_icons, -- Override default symbols
						})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    " .. (strings[2] or "") .. ""

						return kind
					end,
				},
				window = {
					documentation = cmp.config.window.bordered(),
					completion = cmp.config.window.bordered(),
				},
				enabled = function()
					local context = require("cmp.config.context")

					-- Disable in prompt or nofile buffers
					local buftype = vim.api.nvim_buf_get_option(0, "buftype")
					if buftype == "prompt" or buftype == "nofile" then
						return false
					end

					-- Disable in specific filetypes (like mini.files)
					local filetype = vim.bo.filetype
					local disabled_filetypes = { "TelescopePrompt", "neo-tree", "NvimTree", "Outline", "minifiles" }
					for _, ft in ipairs(disabled_filetypes) do
						if filetype == ft then
							return false
						end
					end

					return true
				end,
			})

			-- disble default padding
			vim.cmd([[
        highlight! CmpPmenu        guibg=NONE guifg=#d4be98
        highlight! CmpPmenuBorder  guibg=NONE guifg=#7c6f64
        highlight! CmpPmenuSel     guibg=#7c6f64 guifg=#fbf1c7 gui=bold
        highlight! NormalFloat     guibg=NONE
        highlight! FloatBorder     guibg=NONE guifg=#7c6f64
      ]])
		end,
	},
}
