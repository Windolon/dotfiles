-- Use the lualine default glyphs and virtual text (cf vscode error lens) for diagnostics.

local M = {}

-- taken from lualine
local diagnostic_signs = {
	Error = "󰅚 ", -- f015a
	Warn = "󰀪 ", -- f002a
	Info = "󰋽 ", -- f02fd
	Hint = "󰌶 ", -- f0336
}

M.setup = function()
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
				[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
				[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
				[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
			},
		},
		virtual_text = true,
		underline = true,
	})
end

return M
