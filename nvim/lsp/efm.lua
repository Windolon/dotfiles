-- We use the efm language server for integrating linters and formatters.
-- For the actual LSPs, they are defined separately in the lsp/ directory.

-- Call the appropriate configs for the desired linters and formatters
local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")
local flake8 = require("efmls-configs.linters.flake8")
local black = require("efmls-configs.formatters.black")

-- To add support to a new language, simply create a new entry in this table
-- after calling the configs above
local languages = {
	lua = { luacheck, stylua },
  python = { flake8, black },
}

-- Don't mess with the following script
---@type vim.lsp.Config
return {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	cmd = { "efm-langserver" },
  filetypes = vim.tbl_keys(languages),
	root_markers = { ".git/" },
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
		hover = true,
		documentSymbol = true,
		codeAction = true,
		completion = true,
	},
	settings = { languages = languages },
}
