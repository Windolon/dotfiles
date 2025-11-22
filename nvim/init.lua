-- This is it. One file to rule them all.

-- {{{ options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- reenable if any plugins are written in these languages
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.spelllang = { "en", "de" }

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
-- \Cquery to force case-sensitive search regardless
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false

vim.opt.diffopt:append("vertical")
vim.opt.diffopt:append("algorithm:patience")
vim.opt.diffopt:append("linematch:60")

vim.opt.undofile = true
local undodir = "~/.local/share/nvim/undodir"
vim.opt.undodir = vim.fn.expand(undodir)
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p")
end

vim.opt.path:append("**")
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignorecase = true

vim.opt.guicursor = {
	"n-v-c-sm:block",
	"i-ci-ve:ver25",
	"r-cr-o:hor20",
	"t:block-blinkon0-TermCursor",
	"a:blinkon0-Cursor/lCursor",
}

vim.opt.splitbelow = true
vim.opt.splitright = true
-- }}}

-- {{{ native keymaps
vim.keymap.set("n", "<leader>rc", "<Cmd>e $MYVIMRC<CR>", { desc = "Edit init.lua / vimRC" })
vim.keymap.set("n", "<leader>rr", "<Cmd>restart<CR>", { desc = "Restart Neovim" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>wr", "<Cmd>vsplit<CR>", { desc = "Split window vertically to the Right" })
vim.keymap.set("n", "<leader>wb", "<Cmd>split<CR>", { desc = "Split window horizontally Below" })
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>wd", "<Cmd>q<CR>", { desc = "Close window" })

vim.keymap.set("n", "<F2>", "<Cmd>noh<CR>", { desc = "Turns off highlighting until the next search" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- }}}

-- {{{ plugins
-- {{{ plenary.nvim
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})
-- }}}
-- {{{ promise-async
vim.pack.add({
	{ src = "https://github.com/kevinhwang91/promise-async" },
})
-- }}}

-- {{{ nord.nvim
vim.pack.add({
	{ src = "https://github.com/gbprod/nord.nvim" },
})
require("nord").setup({})
vim.cmd.colorscheme("nord")
-- }}}
-- {{{ mini.icons
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.icons" },
})
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
-- }}}
-- {{{ lualine.nvim <- mini.icons | nord.nvim
vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})
require("lualine").setup({
	sections = {
		lualine_a = {
			{
				"mode",
				color = { gui = "bold" },
			},
		},
		lualine_z = {
			{
				"location",
				color = { gui = "bold" },
			},
		},
		lualine_x = {
			{
				"lsp_status",
				ignore_lsp = { "efm" },
			},
			{ "filetype" },
		},
	},
})
-- }}}
-- {{{ bufferline.nvim <- mini.icons | nord.nvim
vim.pack.add({
	{
		src = "https://github.com/akinsho/bufferline.nvim",
		version = "v4.9.1",
	},
})
vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		separator_style = "thin",
	},
	highlights = require("nord.plugins.bufferline").akinsho(),
})
-- }}}
-- {{{ mini.cursorword
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.cursorword" },
})
require("mini.cursorword").setup()
-- }}}
-- {{{ indent-blankline.nvim
vim.pack.add({
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})
require("ibl").setup()
-- }}}
-- {{{ mini.notify
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.notify" },
})
require("mini.notify").setup()
-- }}}
-- {{{ mini.trailspace
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.trailspace" },
})
require("mini.trailspace").setup()
-- }}}

-- {{{ mini.ai
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.ai" },
})
require("mini.ai").setup()
-- }}}
-- {{{ mini.move
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.move" },
})
require("mini.move").setup()
-- }}}
-- {{{ mini.pairs
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.pairs" },
})
require("mini.pairs").setup()
-- }}}
-- {{{ mini.surround
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.surround" },
})
require("mini.surround").setup()
-- }}}

-- {{{ mini.files
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.files" },
})
require("mini.files").setup()
vim.keymap.set("n", "<leader>e", "<Cmd>lua MiniFiles.open()<CR>", { desc = "Open mini.files explorer" })
-- }}}
-- {{{ fzf-lua <- mini.icons
vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})
require("fzf-lua").setup({})
vim.keymap.set("n", "<leader>ff", '<Cmd>lua require("fzf-lua").files()<CR>', { desc = "Filetree (fzf-lua)" })
vim.keymap.set("n", "<leader>fg", '<Cmd>lua require("fzf-lua").live_grep()<CR>', { desc = "Live grep (fzf-lua)" })
vim.keymap.set("n", "<leader>fb", '<Cmd>lua require("fzf-lua").buffers()<CR>', { desc = "Buffers (fzf-lua)" })
vim.keymap.set("n", "<leader>fh", '<Cmd>lua require("fzf-lua").help_tags()<CR>', { desc = "Help tags (fzf-lua)" })
vim.keymap.set(
	"n",
	"<leader>fx",
	'<Cmd>lua require("fzf-lua").diagnostics_document()<CR>',
	{ desc = "Diagnostics in buffer (fzf-lua)" }
)
vim.keymap.set(
	"n",
	"<leader>fX",
	'<Cmd>lua require("fzf-lua").diagnostics_workspace()<CR>',
	{ desc = "Diagnostics in workspace (fzf-lua)" }
)
vim.keymap.set(
	"n",
	"<leader>fs",
	'<Cmd>lua require("fzf-lua").lsp_document_symbols()<CR>',
	{ desc = "Symbols in buffer (fzf-lua)" }
)
-- }}}
-- {{{ which-key.nvim
vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
})
require("which-key").setup({
	preset = "helix",
	spec = {
		{ "<leader>f", group = "fuzzy find" },
		{ "<leader>w", group = "windows" },
		{ "<leader>x", group = "trouble and diagnostics" },
		{ "<leader>b", group = "buffers" },
		{ "<leader>g", group = "gitsigns actions" },
		{ "<leader>g", mode = "v", group = "gitsigns actions" },
		{ "<leader>t", group = "todo-comments" },
		{ "<leader>r", group = "neovim" },
	},
})
vim.keymap.set(
	"n",
	"<leader>?",
	'<Cmd>lua require("which-key").show({ global = false })<CR>',
	{ desc = "See keymaps local to current buffer (which-key)" }
)
-- }}}
-- {{{ auto-session
vim.pack.add({
	{ src = "https://github.com/rmagatti/auto-session" },
})
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
require("auto-session").setup({
	suppressed_dirs = { "~/", "~/Downloads", "/" },
})
-- }}}
-- {{{ gitsigns.nvim
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "Next hunk (gitsigns)" })

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "Previous hunk (gitsigns)" })

		-- Actions
		map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk (gitsigns)" })
		map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk (gitsigns)" })

		map("v", "<leader>gs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage hunk (gitsigns)" })

		map("v", "<leader>gr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset hunk (gitsigns)" })

		map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer (gitsigns)" })
		map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer (gitsigns)" })
		map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk (gitsigns)" })
		map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline (gitsigns)" })

		map("n", "<leader>gb", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Check full line blame (gitsigns)" })

		map("n", "<leader>gd", gitsigns.diffthis, { desc = "Show diff of this buffer (gitsigns)" })

		map("n", "<leader>gD", function()
			gitsigns.diffthis("~")
		end, { desc = "Show diff of this buffer w/ ~ (gitsigns)" })

		map("n", "<leader>gQ", function()
			gitsigns.setqflist("all")
		end, { desc = "Set qflist w/ changes for whole repo (gitsigns)" })
		map("n", "<leader>gq", gitsigns.setqflist, { desc = "Set qflist w/ changes (gitsigns)" })

		-- Toggles
		map("n", "<leader>gl", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame (gitsigns)" })
		map("n", "<leader>gw", gitsigns.toggle_word_diff, { desc = "Toggle in-line word-diff (gitsigns)" })

		-- Text object
		map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk (gitsigns)" })
	end,
})
-- }}}
-- {{{ vim-fugitive
vim.pack.add({
	{ src = "https://github.com/tpope/vim-fugitive" },
})
-- }}}
-- {{{ toggleterm.nvim <- nord.nvim
vim.pack.add({
	{
		src = "https://github.com/akinsho/toggleterm.nvim",
		version = "v2.13.1",
	},
})
require("toggleterm").setup(require("nord.plugins.toggleterm").make_opts({
	open_mapping = [[<c-t>]],
}))
-- }}}
-- {{{ todo-comments.nvim <- plenary.nvim
vim.pack.add({
	{ src = "https://github.com/folke/todo-comments.nvim" },
})
require("todo-comments").setup({})
vim.keymap.set("n", "<leader>ft", "<Cmd>TodoFzfLua<CR>", { desc = "Todo comments (fzf-lua / todo)" })
vim.keymap.set("n", "<leader>tq", "<Cmd>TodoQuickFix<CR>", { desc = "Open todo comments in qflist (todo)" })
-- }}}
-- {{{ nvim-ufo <- promise-async
vim.pack.add({
	{ src = "https://github.com/kevinhwang91/nvim-ufo" },
})
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
require("ufo").setup({
	provider_selector = function()
		-- dont fallback to treesitter because it spews errors on "weird buffers"
		-- such as the mini.files explorer
		return { "lsp", "indent" }
	end,
})
-- }}}

-- {{{ nvim-treesitter
vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main", -- Development happens on the main branch, not the default master branch
	},
})
-- NOTE: Adding support for a new language: add treesitter here
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
require("nvim-treesitter").install({
	"bash",
	"json",
	"python",
	"rust",
	"squirrel",
	"tmux",
	"toml",
	"yaml",
	"zsh",
})
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		pcall(vim.treesitter.start, ev.buf)
	end,
})
-- }}}
-- {{{ mason.nvim
-- NOTE: If you're migrating, make sure to redownload the binaries in use
vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
})
require("mason").setup()
-- }}}
-- {{{ nvim-lspconfig
-- See the quickstart configs at https://github.com/neovim/nvim-lspconfig/tree/master/lsp
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})
-- }}}
-- {{{ efmls-configs-nvim
vim.pack.add({
	{
		src = "https://github.com/creativenull/efmls-configs-nvim",
		version = "v1.10.1",
	},
})
-- }}}
-- {{{ friendly-snippets
vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})
-- }}}
-- {{{ mini.snippets <- friendly-snippets
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.snippets" },
})
local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
	snippets = {
		-- Load custom file with global snippets first (adjust for Windows)
		gen_loader.from_file("~/.config/nvim/snippets/global.json"),

		-- Load snippets based on current language by reading files from
		-- "snippets/" subdirectories from 'runtimepath' directories.
		gen_loader.from_lang(),
	},
})
-- }}}
-- {{{ blink.cmp
vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = "v1.8.0",
	},
})
require("blink.cmp").setup({
	keymap = {
		preset = "default",
		-- remaps C-space to C-d because tmux's prefix is C-space
		["<C-space>"] = false,
		["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
	},
	appearance = { nerd_font_variant = "normal" },
	completion = { documentation = { auto_show = false } },
	snippets = { preset = "mini_snippets" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
-- }}}
-- }}}

-- {{{ lsp configs, linters and formatters
-- merges both nvim-ufo and blink.cmp together
local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- {{{ efm
-- NOTE: Adding support for a new language: add linters/formatters configs to this table
local efm_languages = {
	lua = {
		require("efmls-configs.linters.luacheck"),
		require("efmls-configs.formatters.stylua"),
	},
}
vim.lsp.config("efm", {
	capabilities = capabilities,
	filetypes = vim.tbl_keys(efm_languages),
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
		hover = true,
		documentSymbol = true,
		codeAction = true,
		completion = true,
	},
	settings = { languages = efm_languages },
})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("LspFormattingGroup", {}),
	callback = function(ev)
		local efm = vim.lsp.get_clients({ name = "efm", bufnr = ev.buf })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm" })
		vim.cmd("noa w")
	end,
})
-- }}}
-- {{{ lua_ls
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Tell the language server how to find Lua modules same way as Neovim
				-- (see `:h lua-module-load`)
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths
					-- here.
					-- '${3rd}/luv/library'
					-- '${3rd}/busted/library'
				},
				-- Or pull in all of 'runtimepath'.
				-- This is a lot slower and will cause issues when working on
				-- your own configuration.
				-- See https://github.com/neovim/nvim-lspconfig/issues/3189
				-- library = {
				--   vim.api.nvim_get_runtime_file('', true),
				-- }
			},
		})
	end,
	settings = {
		Lua = {},
	},
})
-- }}}

-- NOTE: Adding support for a new language: enable lsp configs here
vim.lsp.enable({
	"efm",
	"lua_ls",
})
-- }}}

-- {{{ utils
-- {{{ better diagnostics
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
	virtual_text = true,
	underline = true,
})
-- }}}
-- {{{ highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", {}),
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})
-- }}}
-- }}}

-- vim: foldmethod=marker foldlevel=0
