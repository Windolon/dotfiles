-- Core plugins module for general language support such as linting, formatting, autocompletion and more.
--
-- hrsh7th/nvim-cmp                         >  Main autocompletion plugin
-- ├── hrsh7th/cmp-buffer                   >  Completion source for buffer words
-- ├── hrsh7th/cmp-nvim-lsp                 >  Completion source for the LSP client
-- ├── hrsh7th/cmp-nvim-lsp-signature-help  >  Function signature completion as you type
-- ├── hrsh7th/cmp-path                     >  Completion source for filesystem paths
-- └── nvim-mini/mini.snippets              >  Main snippets plugin
--     └── rafamadriz/friendly-snippets     >  Provides a curated collection of snippets
-- mason-org/mason.nvim                     >  Package manager for LSP & DAP servers, linters and formatters
-- └── creativenull/efmls-configs-nvim      >  Config provider for the efm language server
-- nvim-treesitter/nvim-treesitter          >  Parser manager

return {
	{
		-- This can be done natively via a bunch of luarocks tinkering, but it is a lot of
		-- unnecessary work for me when I can manage parsers directly and easily via this plugin
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main", -- navigating docs can be confusing. make sure you're looking at the "main" branch when you tinker
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({ -- language parsers that MUST be installed on launch
				"bash",
				"cpp",
				"json",
				"python",
				"rust",
				"squirrel",
        "tmux",
				"toml",
				"yaml",
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
			require("utils.better_diagnostics").setup()
			vim.lsp.enable({
				"efm",
				"lua_ls",
        "pyright",
			})
		end,
		dependencies = {
			{ "creativenull/efmls-configs-nvim", version = "v1.x.x" },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"nvim-mini/mini.snippets",
				version = false,
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					local gen_loader = require("mini.snippets").gen_loader
					require("mini.snippets").setup({
						snippets = {
							gen_loader.from_file("~/.config/nvim/snippets/global.json"),
							gen_loader.from_lang(),
						},
						mappings = {
							expand = "<C-Enter>",
						},
					})
				end,
			},
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				-- Specifying the mini.snippets snippet engine
				snippet = {
					expand = function(args)
						local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
						insert({ body = args.body }) -- Insert at cursor
						cmp.resubscribe({ "TextChangedI", "TextChangedP" })
						require("cmp.config").set_onetime({ sources = {} })
					end,
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				formatting = {
					format = require("utils.better_lspkind").format,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "mini_snippets" },
					{ name = "nvim_lsp_signature_help" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
