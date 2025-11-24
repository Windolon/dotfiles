local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<localleader>a", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { buffer = bufnr, desc = "Code action" })

vim.keymap.set(
	"n",
	"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
	function()
		vim.cmd.RustLsp({ "hover", "actions" })
	end,
	{ buffer = bufnr, desc = "Hover actions (rustaceanvim modded)" }
)

vim.keymap.set("n", "J", "<Cmd>RustLsp joinLines<CR>", { buffer = bufnr, desc = "Join lines (rustaceanvim modded)" })

vim.keymap.set("n", "<localleader>c", "<Cmd>RustLsp openCargo<CR>", { buffer = bufnr, desc = "Open Cargo.toml" })
