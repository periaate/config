
local function C(str) return "<C-" .. str .. ">" end
local function A(str) return "<A-" .. str .. ">" end


local ln = line
local w = word

local CW = char_wise
local LW = line_wise

local u = up
local d = down
local R = right
local L = left

local N = next
local P = previous
local S = start
local E = end
local B = before
local A = after

local Defaults = {
	CMD          = "<CMD>",
	TAB          = "<TAB>",
	BS           = "<BS>",
	SPACE        = "<SPACE>",
	CR           = "<CR>",
	CMD          = "<CMD>",
	ENTER        = "<ENTER>",
	ESC          = "<ESC>",
	LEADER       = "<LEADER>",
	END          = "<END>",
	HOME         = "<HOME>",
	ARROW_LEFT   = "<LEFT>",
	ARROW_RIGHT  = "<RIGHT>",
	ARROW_UP     = "<UP>",
	ARROW_DOWN   = "<DOWN>",
	DELETE       = "<DELETE>",

	left  = "h",
	right = "l",
	up    = "k",
	down  = "j",
	
	match = '%',

	find_R        = 'f',
	find_RB       = 't',
	find_L        = 'F',
	find_LB       = 'T',
	find_repeat_R = ";",
	find_repeat_L = ",",

	word_R  = "w",
	WORD_R  = "W",
	word_L  = "b",
	WORD_L  = "B",
	word_RE = "e",
	WORD_RE = "E",
	word_LE = "ge",
	WORD_LE = "gE",

	mark    = "m",
	jump_LW = "'",
	jump_CW = "`",
	jump_last = '``',
	jump_newer = C"i",
	jump_older = C"o",
	jump_change_newer = "g,",
	jump_change_older = "g;",


	reg_default      = '"',
	reg_sys          = '"+',
	reg_sys_x11      = '*',
	reg_filename     = '%',
	reg_filename_alt = '#',
	reg_pattern      = '/',
	reg_cmd          = ':',
	reg_insert       = '.',
	reg_delete       = '-',
	reg_expr         = '=',
	reg_null         = '_',

	paragraph_up   = "{",
	paragraph_down = "}",

	page_up   = C"b",
	page_down = C"f",

	screen_top = "H",
	screen_mid = "M",
	screen_bot = "L",

	inner = 'i',
	outer = 'a',

	line       = "_",
	line_start = "0",
	line_char  = "^",
	line_end   = "$",
	line_first = C"HOME",
	line_last  = C"END",

	insert_B = "i",
	insert_A = "a"
	insert_S = "I"
	insert_E = "A"
	insert_line_A = "o"
	insert_line_B = "O"


	visual       = "v",
	visual_line  = "V",
	visual_block = C"v",
	ex_mode      = "Q",

	replace = "R",
	cut = "x",
	case_switch = "~",
	case_lower = "u",
	case_upper = "U",

	insert_after = "a",
	insert_end   = "A",
	insert_above = "O",
	insert_below = "o",

	delete       = "d",
	yank         = "y",
	change       = "c",
	paste_after  = "p",
	paste_before = "P",

	undo = "u",
	redo = C"r",

	indent_right = ">",
	indent_left = "<",
	substitute = "s",

	replace    = "r",
	join_lines = "gJ",

	increment   = C"a",
	decrement   = C"x",
	search      = "/",
	search_last = "?",

	undo_line = "g-",
	redo_line = "g+",

	cmd_force = "!",
	cmd_buf_save = "w",
	cmd_vim_exit = "q",
	cmd_mod_all = "a",
	cmd_

}


return Defaults
