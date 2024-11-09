local Actions = require("maps.base")
local map = require("maps.map")

local l = Actions.literals
local m = Actions.movement
local mod = Actions.modes
local g = Actions.g_based
local op = Actions.operations


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

print(o.delete .. m.line)

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
		map.set(key.all, value, '')
	end
end

-- clear()

local line = {
    -- Sets the content of the line at the given index. If index is 0, sets the current line.
    set = function(ind, new)
        local line_num = ind == 0 and vim.fn.line('.') or ind
        vim.fn.setline(line_num, new)
    end,

    -- Gets the content of the line at the given index. If index is 0, gets the current line.
    get = function(ind)
        local line_num = ind == 0 and vim.fn.line('.') or ind
        return vim.fn.getline(line_num)
    end,
}




map.o('(', mov.inner .. '(')
map.o(')', mov.outer .. ')')
map.o('[', mov.inner .. '[')
map.o(']', mov.outer .. ']')
map.o('{', mov.inner .. '{')
map.o('}', mov.outer .. '}')
map.o('"', mov.inner .. '"')

map.o(l.DELETE, mov.right) -- this motion selects the current char.

map.all(up,    mov.up)
map.all(down,  mov.down)
map.all(UP,    mov.paragraph_up)
map.all(DOWN,  mov.paragraph_down)

map.all(left,  mov.left_match)
map.all(right, mov.right_match)
map.all(LEFT,  mov.left_match_before)
map.all(RIGHT, mov.right_match_before)


map.n('(', op.undo)
map.n(')', op.redo)

-- map.n(
