-- Core plugins module focused on the UI.
--
-- akinsho/bufferline.nvim     >  Buffer bar, kinda like vscode's tab bar
-- gbprod/nord.nvim            >  Nord theme
-- nvim-lualine/lualine.nvim   >  Status line
-- nvim-mini/mini.cursorword   >  Highlights current and matching words under the cursor
-- nvim-mini/mini.icons        >  Provides extra icons, some plugins depend on this
-- nvim-mini/mini.indentscope  >  Shows the current indent level
-- nvim-mini/mini.notify       >  Saner notifications
-- nvim-mini/mini.trailspace   >  Trailing space indicator

return {
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({})
			vim.cmd.colorscheme("nord")
		end,
	},

	{ "nvim-mini/mini.cursorword", version = false, opts = {} },
	{
		"nvim-mini/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons() -- needed for a bunch of plugins that does not yet support mini.icons
		end,
	},
	{ "nvim-mini/mini.indentscope", version = false, opts = {} },
	{ "nvim-mini/mini.notify", version = false, opts = {} },
	{ "nvim-mini/mini.trailspace", version = false, opts = {} },

	{ "akinsho/bufferline.nvim", version = false, dependencies = { "nvim-mini/mini.icons" }, opts = {} },

	{
		"nvim-lualine/lualine.nvim",
		version = false,
		dependencies = { "nvim-mini/mini.icons" },
		opts = {
			sections = {
				lualine_x = { "filetype" },
			},
		},
	},
}
