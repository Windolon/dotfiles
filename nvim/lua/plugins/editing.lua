-- Core plugins module focused on text editing.
--
-- nvim-mini/mini.ai        >  Extend and create `a`/`i` textobjects
-- nvim-mini/mini.move      >  Alt + navigation keys to move lines around
-- nvim-mini/mini.pairs     >  Auto insert closing pairs such as ) ] }
-- nvim-mini/mini.surround  >  Surround actions

return {
	{ "nvim-mini/mini.ai", version = false, opts = {} },
	{ "nvim-mini/mini.move", version = false, opts = {} },
	{ "nvim-mini/mini.pairs", version = false, opts = {} },
	{ "nvim-mini/mini.surround", version = false, opts = {} },
}
