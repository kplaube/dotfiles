return {
	"echasnovski/mini.files",
	keys = {
		{
			"<leader>fm",
			function()
				require("mini.files").open(LazyVim.root(), true)
			end,
			desc = "Open mini.files (root)",
		},
	},
	opts = {
		windows = {
			width_nofocus = 20,
			width_focus = 50,
			width_preview = 50,
		},
		options = {
			use_as_default_explorer = true,
		},
	},
}
