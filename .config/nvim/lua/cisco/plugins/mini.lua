return {
	{
		"echasnovski/mini.files",
		lazy = true,
		keys = {
			{
				"<leader>e",
				function()
					require("mini.files").open()
				end,
				desc = "Open mini.files",
			},
		},
		opts = {
			mappings = {
				synchronize = "s",
				close = "<leader>e",
			},
			windows = {
				preview = false,
			},
		},
	},
}
