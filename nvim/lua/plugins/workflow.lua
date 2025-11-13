-- Core plugins module focused on general workflow.
--
-- christoomey/vim-tmux-navigator  >  Navigate between tmux windows seamlessly (it just works)
-- folke/trouble.nvim              >  Diagnostics list
-- folke/which-key.nvim            >  Helps to remember keymaps, also improves leader key behaviour
-- ibhagwan/fzf-lua                >  Fuzzy find stuff
-- lewis6991/gitsigns.nvim         >  Git signs in the sign column and hunk actions
-- nvim-mini/mini.files            >  File explorer that works like a buffer
-- rmagatti/auto-session           >  Session manager
-- tpope/vim-fugitive              >  Better git commands

return {
	{ "nvim-mini/mini.files", version = false, opts = {} },

	{
		"ibhagwan/fzf-lua",
		lazy = false,
		dependencies = { "nvim-mini/mini.icons" },
		keys = {
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
				desc = "FZF Files",
			},
			{
				"<leader>fg",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "FZF Live Grep",
			},
			{
				"<leader>fb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "FZF Buffers",
			},
			{
				"<leader>fh",
				function()
					require("fzf-lua").help_tags()
				end,
				desc = "FZF Help Tags",
			},
			{
				"<leader>fx",
				function()
					require("fzf-lua").diagnostics_document()
				end,
				desc = "FZF Diagnostics Document",
			},
			{
				"<leader>fX",
				function()
					require("fzf-lua").diagnostics_workspace()
				end,
				desc = "FZF Diagnostics Workspace",
			},
			{
				"<leader>fs",
				function()
					require("fzf-lua").lsp_document_symbols()
				end,
				desc = "FZF Document Symbols",
			},
		},
		opts = {},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
      spec = {
        { "<leader>f", group = "fuzzy find" },
        { "<leader>w", group = "windows" },
        { "<leader>x", group = "trouble and diagnostics" },
        { "<leader>b", group = "buffers" },
      }
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"rmagatti/auto-session",
		lazy = false,

		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~/", "~/Downloads", "/" },
			-- log_level = 'debug',
		},
	},
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  }
}
