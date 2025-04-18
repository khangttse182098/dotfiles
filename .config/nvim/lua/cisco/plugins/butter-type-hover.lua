return {
	"Sebastian-Nielsen/better-type-hover",
	ft = { "typescript", "typescriptreact" },
	config = function()
		require("better-type-hover").setup({
			openTypeDocKeymap = "<leader>k",
			fallback_to_old_on_anything_but_interface_and_type = true,
		})
	end,
}
