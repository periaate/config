local key = {}
key.all = { 'n', 'v', 'x', 'o' }
key.modes = { 'n', 'v', 'x' }
key.leader = " "
key.opts = { noremap = true }

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

function key.set(mode, lhs, rhs, options)
	vim.keymap.set(mode, lhs, rhs, options or key.opts)
end

key.del = vim.keymap.del

function key.clear()
	for i, value in ipairs(toClear) do
		key.set(key.all, value, '')
	end
end


return key
