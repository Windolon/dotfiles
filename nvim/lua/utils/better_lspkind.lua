-- Make our own lspkind behaviour for less dependencies and stopping icon overlaps.

local M = {}

-- taken from nvim-cmp wiki
local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

M.format = function(entry, vim_item)
	-- Kind icons
	vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
	-- Source
	vim_item.menu = ({
		path = "󰉋 ",
		buffer = "󰈔 ",
		mini_snippets = " ",
		nvim_lsp = "󰬓 ",
	})[entry.source.name]
	return vim_item
end

return M
