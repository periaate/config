--[[
	Changes:
	Structured the file to make it more glanceable.
	Added local variables for common colors.

	Strings:	#cc9393 -> #d78787 : Differentiates it from booleans.

	Background changes: Unified background for less distractions.
	Match paren background: darker paren background to account for darker background.
--]]

local bgNormal   = "none"
local textNormal = "#d7d7d7"
local textDark   = "#858586"


return {
	
	Normal         = { fg=textNormal, bg=bgNormal, }, -- bg:#313633 fg:#3f3f3f
	FloatBorder    = { fg="#9f9f9f", bg="#353535", }, -- bg:#353535

	-- Neovim
	Cursor         = { fg="#000d18", bg="#8faf9f", bold=true, },
	CursorColumn   = { bg="#4f4f4f", },
	CursorLine     = { bg="#434443", },
	CursorLineNr   = { fg="#d2d39b", bg="#2f2f2f" },
	LineNr         = { fg=textDark, bg=bgNormal }, -- bg:#353535
	
	DiffAdd        = { fg="#709080", bg="#313c36", bold=true, },
	DiffChange     = { bg="#333333", },
	DiffDelete     = { fg="#333333", bg="#464646", },
	DiffText       = { fg="#ecbcbc", bg="#41363c", bold=true, },
	
	ModeMsg        = { fg="#ffcfaf", },
	MoreMsg        = { fg="#ffffff", bold=true, },
	
	PmenuSel       = { fg="#d0d0a0", bg="#242424", bold=true, },
	PmenuThumb     = { fg="#040404", bg="#a0afa0", },
	Pmenu          = { fg="#9f9f9f", bg="#2c2e2e", },
	PmenuSbar      = { fg="#000000", bg="#2e3330", },

	-- Status
	StatusLine     = { fg=textDark, bg=bgNormal, }, -- fg:#313633 bg:#ccdc90
	StatusLineNC   = { fg="#2e3330", bg="#88b090", },
	
	Visual         = { bg="#233323" },
	VisualNOS      = { bg="#233323" },
	WarningMsg     = { fg="#ffffff", bg="#333333", bold=true, },
	WildMenu       = { fg="#cbecd0", bg="#2c302d", underline=true, },

	-- Tabs
	Title          = { fg="#efefef", bold=true, },
	VertSplit      = { fg="#dfaf8f", bg=bgNormal, },
	TabLine        = { fg="#b6bf98", bg=bgNormal, bold=true, }, -- bg:#353535
	TabLineFill    = { fg="#cfcfaf", bg=bgNormal, bold=true, }, -- bg:#353535
	TabLineSel     = { fg="#efefef", bg="#3a3a39", bold=true, },

	-- Syntax related
	Underlined     = { fg="#dcdccc", underline=true, },
	Todo           = { fg="#dfdfdf", bold=true, },
	MatchParen     = { fg="#b2b2a0", bg="#2a2a2a", bold=true, }, -- bg:#2e2e2e

	-- Syntax
	
	Keyword        = { fg="#ffd7af", bold=true, }, -- fg:#f0dfaf
	Include        = { fg="#ffd7af" ,bold=true, }, -- import/package for some reason
	Conditional    = { fg="#f0dfaf", bold=true, },
	Operator       = { fg="#f0efd0", },

	Structure      = { fg=textNormal, bold=true, }, -- Braces, etc.
	Delimiter      = { fg="#8f8f8f", },
	Repeat         = { fg="#ffd7a7", bold=true, }, -- For loops
	
	Identifier     = { fg=textNormal, },
	Expression     = { fg=textDark, },
	Constant       = { fg=textNormal, bold=true, },
	
	Function       = { fg="#d7d7af", },
	
	Type           = { fg="#d7d7af", },
	Character      = { fg="#dca3a3", bold=true, },
	String         = { fg="#d78787", }, -- fg:#cc9393
	Number         = { fg="#8cd0d3", },
	Float          = { fg="#c0bed1", },
	Comment        = { fg="#7f9f7f", },
	
	Typedef        = { fg=textNormal, bold=true, },
	
	Boolean        = { fg="#d7afaf", }, -- fg:#dca3a3
	Special        = { fg="#d7afaf", }, -- nil fg:#cfbfaf



	--- ???
	Tag            = { fg="#e89393", bold=true, },
	Statement      = { fg="#e3ceab", },


	-- ???
	ColorColumn    = { bg="#484848", },
	Debug          = { fg="#bca3a3", bold=true, },
	Define         = { fg="#ffcfaf", bold=true, },
	Directory      = { fg=textNormal, bold=true, },
	ErrorMsg       = { fg="#80d4aa", bg="#2f2f2f", bold=true, },
	Exception      = { fg="#c3bf9f", bold=true, },
	FoldColumn     = { fg="#93b3a3", bg="#3f4040", },
	Folded         = { fg="#93b3a3", bg="#3f4040", },
	IncSearch      = { fg="#385f38", bg="#f8f893", },
	Label          = { fg="#dfcfaf", underline=true, },
	Macro          = { fg="#ffcfaf", bold=true, },

	NonText        = { fg="#5b605e", bold=true, },
	NormalFloat    = { fg="#9f9f9f", bg=bgNormal,  }, -- bg:#353535

	-- ???
	PreCondit      = { fg="#dfaf8f", bold=true, },
	PreProc        = { fg="#ffcfaf", bold=true, },
	Question       = { fg="#ffffff", bold=true, },
	Search         = { fg="#ffffe0", bg="#284f28", },
	SignColumn     = { fg="#3f3f3f", bold=true, },
	
	-- ???
	SpecialChar    = { fg="#dca3a3", bold=true, },
	SpecialComment = { fg="#82a282", bold=true, },
	SpecialKey     = { fg="#9ece9e", },

	-- ???
	SpellBad       = { fg="#dc8c6c", sp="#bc6c4c", },
	SpellCap       = { fg="#8c8cbc", sp="#6c6c9c", },
	SpellLocal     = { fg="#9ccc9c", sp="#7cac7c", },
	SpellRare      = { fg="#bc8cbc", sp="#bc6c9c", },

	-- ???
	StorageClass   = { fg="#c3bf9f", bold=true, },


}

