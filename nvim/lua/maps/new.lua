local up    = "u"
local left  = "a"
local right = "o"
local down  = "e"

local UP    = "U"
local LEFT  = "a"
local RIGHT = "o"
local DOWN  = "E"


local toggle = "t"
local leader = " "
local GO     = "g"

local keymap = vim.keymap.set

local function nrmap(mode, key, action, optss)
	local options = { noremap = true, silent = true }
	if optss then
		options = optss
	end
	vim.keymap.set(mode, key, action, options)
end

local opts   = { noremap = true }
local all    = { 'n', 'v', 'x', 'o' }
local almost = { 'n', 'v', 'x' }

local key  = {
	set    = nrmap,
	del    = vim.keymap.del,
	opts   = opts,
	all    = all,
	modes  = almost,
	almost = almost,
}

local function C(str) return "<C-" .. str .. ">" end
local function A(str) return "<A-" .. str .. ">" end

local CMD    = "<CMD>"
local TAB    = "<TAB>"
local BS     = "<BS>"
local SPACE  = "<SPACE>"
local CR     = "<CR>"
local CMD    = "<CMD>"
local ENTER  = "<ENTER>"
local ESC    = "<ESC>"
local LEADER = "<LEADER>"
local END    = "<END>"
local HOME   = "<HOME>"
-- local LEFT   = "<LEFT>"
-- local RIGHT  = "<RIGHT>"
-- local UP     = "<UP>"
-- local DOWN   = "<DOWN>"
local DELETE = "<DELETE>"

-- Movement keys
local Left               = "h"
local Right              = "l"
local Up                 = "k"
local Down               = "j"
local match              = '%'
local right_match        = 'f'
local right_match_before = 't'
local left_match         = 'F'
local left_match_before  = 'T'
local next_word          = "w"
local next_WORD          = "W"
local prev_word          = "b"
local prev_WORD          = "B"
local end_of_word        = "e"
local end_of_WORD        = "E"
local go_mark_line       = "'"
local go_mark_char       = "`"
local line               = "_"
local paragraph_up       = "{"
local paragraph_down     = "}"
local first_non_blank    = "^"
local end_of_line        = "$"
local page_up            = C"b"
local page_down          = C"f"
local top_of_screen      = "H"
local middle_of_screen   = "M"
local bottom_of_screen   = "L"

-- Modes keys
local insert       = "i"
local visual       = "v"
local visual_line  = "V"
local visual_block = C"v"
local command      = CMD
local normal       = "n"
local replace      = "R"
local insert_after = "a"
local insert_end   = "A"
local insert_above = "O"
local insert_below = "o"
local ex_mode      = "Q"

-- Operations keys
local delete        = "d"
local yank          = "y"
local change        = "c"
local undo          = "u"
local redo          = C"r"
local paste_after   = "p"
local paste_before  = "P"
local indent_right  = ">"
local indent_left   = "<"
local substitute    = "s"
local replace_op    = "r"
local join_lines    = "J"
local increment     = C"a"
local decrement     = C"x"
local find          = "/"
local find_backward = "?"

-- g-based commands
local go_to_first_line     = "gg"
local go_to_last_line      = "G"
local go_to_line           = "G"
local go_to_first_column   = "g0"
local go_to_last_column    = "g$"
local go_to_column         = "gm"
local move_to_next_search  = "gn"
local move_to_prev_search  = "gN"
local visual_select_line   = "V"
local replace_all          = "g&"
local undo_line            = "g-"
local redo_line            = "g+"

-- Refactored Actions table
local Actions = {
    movement = {
        left               = Left,
        right              = Right,
        up                 = Up,
        down               = Down,
        match              = match,
        right_match        = right_match,
        right_match_before = right_match_before,
        left_match         = left_match,
        left_match_before  = left_match_before,
        next_word          = next_word,
        next_WORD          = next_WORD,
        prev_word          = prev_word,
        prev_WORD          = prev_WORD,
        end_of_word        = end_of_word,
        end_of_WORD        = end_of_WORD,
        go_mark_line       = go_mark_line,
        go_mark_char       = go_mark_char,
        line               = line,
        paragraph_up       = paragraph_up,
        paragraph_down     = paragraph_down,
        first_non_blank    = first_non_blank,
        end_of_line        = end_of_line,
        page_up            = page_up,
        page_down          = page_down,
        top_of_screen      = top_of_screen,
        middle_of_screen   = middle_of_screen,
        bottom_of_screen   = bottom_of_screen,
    },
    modes = {
        insert       = insert,
        visual       = visual,
        visual_line  = visual_line,
        visual_block = visual_block,
        command      = command,
        normal       = normal,
        replace      = replace,
        insert_after = insert_after,
        insert_end   = insert_end,
        insert_above = insert_above,
        insert_below = insert_below,
        ex_mode      = ex_mode,
    },
    operations = {
        delete        = delete,
        yank          = yank,
        change        = change,
        undo          = undo,
        redo          = redo,
        paste_after   = paste_after,
        paste_before  = paste_before,
        indent_right  = indent_right,
        indent_left   = indent_left,
        substitute    = substitute,
        replace       = replace_op,
        join_lines    = join_lines,
        increment     = increment,
        decrement     = decrement,
        find          = find,
        find_backward = find_backward,
    },
    g_based = {
        go_to_first_line     = go_to_first_line,
        go_to_last_line      = go_to_last_line,
        go_to_line           = go_to_line,
        go_to_first_column   = go_to_first_column,
        go_to_last_column    = go_to_last_column,
        go_to_column         = go_to_column,
        move_to_next_search  = move_to_next_search,
        move_to_prev_search  = move_to_prev_search,
        visual_select_line   = visual_select_line,
        replace_all          = replace_all,
        undo_line            = undo_line,
        redo_line            = redo_line,
    }
}

local toClear = {
	'a',     'b',     'c',     'd',     'e',     'f',     'h',     'i',     'j',       'k',       'l',
	'm',     'n',     'o',     'p',     'q',     'r',     's',     't',     'u',       'v',       'w',
	'x',     'y',     'z',     'A',     'B',     'C',     'D',     'E',     'F',       'G',       'H',
	'I',     'J',     'K',     'L',     'M',     'N',     'O',     'P',     'Q',       'R',       'S',
	'T',     'U',     'V',     'W',     'X',     'Y',     'Z',     '<C-b>', '<C-c>',   '<C-d>',
	'<C-e>', '<C-f>', '<C-g>', '<C-h>', '<C-i>', '<C-j>', '<C-k>', '<C-l>', '<C-m>',   '<C-n>',  
	'<C-p>', '<C-q>', '<C-r>', '<C-s>', '<C-t>', '<C-u>', '<C-v>', '<C-w>', '<C-x>',   '<C-y>',   '<C-z>',
	':',     '/',     '\\',    '(',     ')',     '[',     ']',     '<',     '>',       '{',       '}',
	'^',     '@',     '&',     '$',     '#',     '~',     '<CR>',  '<Tab>', '<S-Tab>', '<Space>', '<BS>',
}


local function clear()
	for i, value in ipairs(toClear) do
		key.set(key.all, value, '')
	end
end

clear()


