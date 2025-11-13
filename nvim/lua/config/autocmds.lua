-- Event callbacks.

-- Highlight the yanked text for 200ms
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

-- Format on save using efm langserver and configured formatters
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {}),
	callback = function()
		local efm = vim.lsp.get_clients({ name = "efm" })
		if vim.tbl_isempty(efm) then
			return
		end
		vim.lsp.buf.format({ name = "efm" })
	end,
})

-- Treesitter features are not automatically enabled
-- Start treesitter on most supported filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "bash",
    "c",
    "cpp",
    "json",
    "lua",
    "markdown",
    "python",
    "query",
    "rust",
    "squirrel",
    "tmux",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
  },
  callback = function()
    vim.treesitter.start()
  end
})
