-- imports
local file_window = require("maps.windows")


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


local ALL = { 'n', 'v', 'x', 'o', 'i' }
key.set('o', '<delete>', 'l')

key.set(key.all, " jW", "W")
key.set(key.all, " iW", "E")
key.set(key.all, " xW", "B")


key.set(key.all, 'l', '_')

key.set(key.all, "'", '`')
key.set(key.all, "f", '`')
key.set(key.all, '"', '``')
key.set(key.all, '`', "'")


-- key.set({'n'}, DELETE..'o', insert_after..DELETE..ESC)
-- key.set({'n'}, DELETE..'a', insert..'<BS>'..ESC)



key.set(key.all, '{', 'b')
key.set(key.all, '}', 'e')

key.set(key.all, 'b', 'm')

key.set('o', '(', 'i(')
key.set('o', ')', 'a)')
key.set('o', '[', 'i[')
key.set('o', ']', 'a]')
key.set('o', '{', 'i{')
key.set('o', '}', 'a}')
key.set('o', '"', 'i"')
-- key.set('o', '<', 'i<')
-- key.set('o', '>', 'a>')



key.set('i', '<C-d>', '<C-R>')

-- mode controls
key.set(key.all, "tt", "mma", key.opts)
key.set(key.all, "nn", "mmi", key.opts)

key.set(key.all, "v", "v", key.opts)
key.set(key.all, "V", "V", key.opts)
key.set(key.all, "z", "<C-v>", key.opts)
key.set(key.all, "<C-v>", "p", key.opts)
key.set('i', "<C-n>", "<ESC>`m", key.opts)

-- base movement
-- base LR based on discovery
key.set(key.all, left, 'F', key.opts)
key.set(key.all, right, 'f', key.opts)
key.set(key.all, 'A', 'T', key.opts)
key.set(key.all, 'O', 't', key.opts)

-- key.set(key.modes, ':', ';', key.opts)
-- key.set(key.modes, '=', ',', key.opts)

-- vertical movement remaps
key.set(key.all, up, "k", key.opts)
key.set(key.all, down, "j", key.opts)
key.set(key.all, UP, '{', key.opts)
key.set(key.all, DOWN, '}', key.opts)

-- key.set(key.all, "gu", "gk", key.opts)
-- key.set(key.all, "ge", "gj", key.opts)

-- undo & redo _ ( & )
key.set('n', "(", 'u', key.opts)
key.set('n', ")", '<C-r>', key.opts)

-- copy-paste-replace
key.set(key.modes, 'r', 'c', key.opts)
key.set(key.modes, 'r<Delete>', 'cl', key.opts)

local sub = require('substitute')
key.set('n', 'rw', sub.operator, key.opts)
key.set('x', 'rw', sub.visual, key.opts)

-- cw next to one another, cv layer on keyboard, mapped to mirror global usage
key.set(key.modes, 'c', 'y', key.opts)
key.set(key.modes, 'w', 'p', key.opts)
key.set(key.modes, 'C', 'Y', key.opts)
key.set(key.modes, 'W', 'P', key.opts)

key.set('o', 'w', 'iw')

-- tabulation
key.set(key.all, '<Tab>', '>', key.opts)
key.set(key.all, '<S-Tab>', '<', key.opts)
key.set(key.all, '<S-Tab>L', '<_', key.opts)

key.set('v', '<Tab>', '>', key.opts)
key.set('v', '<S-Tab>', '<', key.opts)


key.set(key.all, '<CR>', ':', key.opts)

-- commenting
key.set('n', '/', require('vim._comment').operator, { expr = true, noremap = true, silent = true })

-- newlines
-- edit
key.set('n', 'lu',     "I<CR><Esc>ki")
key.set('n', 'le',     'A<CR>')
-- editless
key.set('n', '<A-u>',  "mlI<CR><Esc>k")
key.set('n', '<A-e>',  "mlA<CR><Esc>")
-- delete
key.set('n', 'l<C-e>', "mlj0i<BS><Esc>`l")
key.set('n', 'l<C-u>', "mlk0i<BS><Esc>`l")


-- key.set('n', '~', '~h')
key.set('n', 'tc', 'g~')
key.set('n', 'tuc', 'gU')
key.set('n', 'tlc', 'gu')

-- macros
key.set(key.all, 'ne', 'q')
key.set(key.all, 'he', '@')



-- indent entire file
key.set('n', '<leader>=', [[mlgg=G`l]])

-- move selection up or down in visual mode
key.set("v", "<C-u>", ":m '<-2<CR>gv=gv")
key.set("v", "<C-e>", ":m '>+1<CR>gv=gv")

-- remove and add to register
key.set({ "n", "v" }, "<leader><BS>", "d")

-- remove without register
key.set(key.modes, "<BS>", [["_d]], key.opts)

--rename
key.set('n', '<C-r>', function() vim.lsp.buf.rename() end, { noremap = true, silent = true })
key.set('v', '<C-r>', '\"fy<Esc>:%s/<C-r>f/', key.opts)
key.set("n", "r<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})



-- shoutout (load current file as lua or something)ts
key.set("n", "<leader>so", function()
	vim.cmd("w")
	vim.cmd("so")
end)



-- Map Ctrl+s to :w in normal mode
key.set(key.all, '<C-s>', ':w<CR>', key.opts)

-- Map Ctrl+s to :w in insert mode
key.set('i', '<C-s>', '<Esc>:w<CR>', key.opts)

-- file closing
key.set(key.almost, '<leader>WW', 'ZZ', key.opts)
-- key.set(key.almost, '<leader>WF', ':qa!<CR>', key.opts)
key.set(key.almost, '<C-q>', 'ZQ', key.opts)

-- key.set(key.almost, 'WW', ':w!<CR>:bd!<CR>', key.opts)
-- key.set(key.almost, 'WF', ':bd!<CR>', key.opts)

-- key.set(key.almost, '<C-w>', ':bd<CR>', key.opts)
-- key.set(key.almost, '<leader><C-w>', '<C-w>c', key.opts)


key.set("n", "-", "<CMD>Oil<CR>", key.opts)



-- search
key.set(key.all, '<', 'n', key.opts)
key.set(key.all, '>', 'N', key.opts)

-- ================= --
-- Splits management --

-- Movement
key.set(key.all, '<A-a>', '<C-w>h', key.opts) -- Move left
key.set(key.all, '<A-e>', '<C-w>j', key.opts) -- Move down
key.set(key.all, '<A-u>', '<C-w>k', key.opts) -- Move up
key.set(key.all, '<A-o>', '<C-w>l', key.opts) -- Move right

-- Resizing
key.set(key.all, leader .. 'A', '<C-w><', key.opts) -- Resize left
key.set(key.all, leader .. 'E', '<C-w>+', key.opts) -- Resize down
key.set(key.all, leader .. 'U', '<C-w>-', key.opts) -- Resize up
key.set(key.all, leader .. 'O', '<C-w>>', key.opts) -- Resize right

-- New splits
key.set(key.all, leader .. '<C-a>', ':vsp<CR>', key.opts)       -- Vertical split right
key.set(key.all, leader .. '<C-o>', ':vsp<CR><C-w>l', key.opts) -- Vertical split left
key.set(key.all, leader .. '<C-u>', ':sp<CR>', key.opts)        -- Horizontal split up
key.set(key.all, leader .. '<C-e>', ':sp<CR><C-w>j', key.opts)  -- Horizontal split down

-- Moving splits
key.set(key.all, leader .. 'tr', '<C-w>r', key.opts) -- Rotate windows
key.set(key.all, leader .. 'te', '<C-w>J', key.opts) -- Move window down
key.set(key.all, leader .. 'tu', '<C-w>K', key.opts) -- Move window up
key.set(key.all, leader .. 'to', '<C-w>H', key.opts) -- Move window left
key.set(key.all, leader .. 'ta', '<C-w>L', key.opts) -- Move window right

key.set(key.all, '<leader><C-w>', ':close<CR>', key.opts)
-- ================= --

-- diagnostic
-- key.set("n", "{", vim.diagnostic.goto_prev)
-- key.set("n", "}", vim.diagnostic.goto_next)

-- show floating preview of the word currently under the cursor in normal mode
key.set("n", "th", function() vim.lsp.buf.hover() end)


key.set('i', '<C-Delete>', '<Esc>wdwi')
key.set('i', '<C-v>', [[<ESC>pi]])

-- get current word
function cw()
	local line = vim.fn.getline('.')
	local col = vim.fn.col('.')
	local start = col
	local finish = col

	while start > 0 and line:sub(start, start):match('%w') do
		start = start - 1
	end

	while finish < #line and line:sub(finish, finish):match('%w') do
		finish = finish + 1
	end

	return line:sub(start + 1, finish)
end

function split(str)
	local result = {};
	for line in string.gmatch(str .. "\n", "(.-)\n") do
		table.insert(result, line);
	end

	return result
end

local str = {
	nthSplit = function(str, sep, n)
		local t = {}
		local i = 1
		local escaped_sep = string.gsub(sep, "([^%w])", "%%%1")

		for s in string.gmatch(str, "([^" .. escaped_sep .. "]+)") do
			if i == n then
				return s
			end

			table.insert(t, s)
			i = i + 1
		end

		-- n is negative or overflows the length of the table
		if n > #t then return '' end

		return t[#t + n + 1]
	end
}


local get = {
	word = function()
		return vim.fn.expand('<cword>')
	end,
	name = function(with_ext)
		if with_ext == false then
			return vim.fn.expand('%:t:r')
		end
		return vim.fn.expand('%:t')
	end,
	path = function()
		return vim.fn.expand('%:p')
	end,
	base = function()
		path = vim.fn.expand('%:p')
		name = vim.fn.expand('%:t')
		path = string.gsub(path, "\\", "/")
		res = string.sub(path, 1, #path - #name)
		return str.nthSplit(res, '/', -1)
	end,
	position = function()
		local pos = vim.api.nvim_win_get_cursor(0)
		return { row = pos[1], col = pos[2] }
	end,
	file = function()
		return vim.fn.expand('%')
	end
}

-- cword motion
key.set('o', '*', 'iw')

local edit = {
	paste = function(val, before_cursor)
		if before_cursor then
			vim.cmd('normal! i' .. val)
		else
			vim.cmd('normal! a' .. val)
		end
	end,
}

key.set('n', 'fn', function()
	local w = get.name(false)
	edit.paste(w, false)
end)

key.set('n', 'gop', function()
	edit.paste("package " .. get.base(), false)
end
)

key.set('n', 'hac', function()
	local w = get.word()
	-- toggle capitalization on first letter

	if w:match('%u') then
		w = w:lower()
	else
		w = w:gsub("^%l", string.upper)
	end

	vim.cmd('normal! maviwc' .. w)
	vim.cmd('normal! `a')
end)

-- key.set('n', toggle .. "nt", function() vim.o.expandtab = false end)
-- key.set('n', toggle .. "ot", function()	vim.o.expandtab = true end)

-- replace
key.set('v', 'R', ":s/", { silent = false })

-- inner and outer movements
key.set('o', 't', 'a')
key.set('o', 'n', 'i')


-- block visual mode line insert
key.set('v', 'nn', 'I')
key.set('v', 'tt', 'A')



-- new movement
--
key.set({ "n", "x", "o" }, " " .. "o",
function()
	require("flash").jump({
		search = { 
			forward = true, wrap = false,
			mode = "search", max_length = 0,
		},
		highlight = { backdrop = false, matches = false, },
		labels = "pgkaeo'ud",
		label = { uppercase = false, after = { 0, 0 } },
		pattern = [[\s]],
	})
end
)

key.set({ "n", "x", "o" }, " " .. "a",
function()
	require("flash").jump({
		search = { 
			forward = false, wrap = false,
			mode = "search", max_length = 0
		},
		highlight = { backdrop = false, matches = false, },
		labels = "pgkaeo'ud",
		label = { uppercase = false, after = { 0, 0 } },
		pattern = [[\s]],
	})
end
)

key.set({ "n", "x", "o" }, "K", function() require("flash").treesitter() end)
key.set({ "n", "x", "o" }, "k", function() require("flash").treesitter_search() end)

key.set({ "n", "x", "o" }, "p",
function()
	require("flash").jump({
		search = {
			mode = function(str)
				return "\\<" .. str
			end,
		},
	})
end
)

key.set({ "n", "x", "o" }, " " .. "e",
function()
	require("flash").jump({
		search = { 
			forward = true, wrap = false,
			mode = "search", max_length = 0
		},
		label = { after = { 0, 0 } },
		pattern = [[^\(\s*$\|$\)]],
	})
end
)

key.set({ "n", "x", "o" }, " " .. "u",
function()
	require("flash").jump({
		search = { 
			forward = false, wrap = false,
			mode = "search", max_length = 0
		},
		label = { after = { 0, 0 } },
		pattern = [[^\(\s*$\|$\)]],
	})
end
)


-- op @ dst ; as opposed to, do op to dst.
-- e.g., `rw Eg` would paste on the 2nd free line down.
key.set({ "n", "x", "o" }, " " .. "E",
function()
	require("flash").jump({
		search = { 
			forward = true, wrap = false,
			mode = "search", max_length = 0
		},
		label = { after = { 0, 0 } },
		pattern = [[^\(\s*$\|$\)]],
		jump = { pos = "range" },
	})
end
)

-- op @ dst
key.set({ "n", "x", "o" }, " " .. "U",
function()
	require("flash").jump({
		search = { 
			forward = false, wrap = false,
			mode = "search", max_length = 0
		},
		label = { after = { 0, 0 } },
		pattern = [[^\(\s*$\|$\)]],
		jump = { pos = "range" },
	})
end
)

key.set({ "n", "x", "o", }, "y",
function()
	require("flash").jump({
		pattern = ".", -- initialize pattern with any char
		search = {
			mode = function(pattern)
				-- remove leading dot
				if pattern:sub(1, 1) == "." then
					pattern = pattern:sub(2)
				end
				-- return word pattern and proper skip pattern
				return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
			end,
		},
		-- select the range
		jump = { pos = "range" },
	})
end
)

key.set({ "n", "x", "o", }, "P",
function()
	local Flash = require("flash")

	Flash.jump({
		search = { mode = "search" },
		label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
		pattern = [[\<]],
		action = function(match, state)
			state:hide()
			Flash.jump({
				search = { max_length = 0 },
				highlight = { matches = false },
				label = { format = format },
				matcher = function(win)
					-- limit matches to the current label
					return vim.tbl_filter(function(m)
						return m.label == match.label and m.win == win
					end, state.results)
				end,
				labeler = function(matches)
					for _, m in ipairs(matches) do
						m.label = m.label2 -- use the second label
					end
				end,
			})
		end,

		labeler = function(matches, state)
			local labels = state:labels()
			for m, match in ipairs(matches) do
				match.label1 = labels[math.floor((m - 1) / #labels) + 1]
				match.label2 = labels[(m - 1) % #labels + 1]
				match.label = match.label1
			end
		end,
	})
end
)


function line_hof(fn)
	return function()
		line = vim.fn.getline('.')
		res = fn(line)
		if res == line then
			return
		end
		vim.fn.setline('.', res)

		line = vim.fn.getline('.')
		local leading_spaces = line:match("^%s*")
		line = line:sub(#leading_spaces + 1)
		vim.cmd('normal! 0f l')
	end
end

key.set('n', '#', line_hof(function(line)
	local lead = line:match("^#*%s*")
	if #lead ~= 0 then
		return line:sub(#lead + 1)
	end
	return '# ' .. line
end), key.opts)


key.set('i', '<C-u>', '<esc>ko')
key.set('i', '<C-e>', '<esc>o')

key.set('n', ' sab', function()
	dofile(vim.fn.stdpath('config') .. '/lua/maps/abbrev.lua')
end)

key.set('n', ' sba', function()
	dofile(vim.fn.stdpath('config') .. '/lua/maps/basic.lua')
end)

key.set('n', ' geab', function()
	vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/lua/maps/abbrev.lua')
end)

key.set('n', ' geba', function()
	vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/lua/maps/basic.lua')
end)


-- Thanks ChatGPT
function split(input, sep)
	local result = {}

	-- Handle the case where sep is an empty string
	if sep == "" then
		for i = 1, #input do
			table.insert(result, input:sub(i, i))
		end
		return result
	end

	local pattern = "(.-)" .. sep
	local last_end = 1
	local s, e, cap = input:find(pattern, 1)

	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(result, cap)
		end
		last_end = e + 1
		s, e, cap = input:find(pattern, last_end)
	end

	if last_end <= #input then
		table.insert(result, input:sub(last_end))
	end

	return result
end

local function modify_word()
	-- This will store the captured characters
	local chars = ""

	-- Listen for 2 characters
	for i = 1, 2 do
		-- Get a single character input
		local char = vim.fn.getcharstr()

		-- Append the character to the chars string
		chars = chars .. char

		-- Break early if user presses ESC
		if char == vim.api.nvim_replace_termcodes("<ESC>", true, true, true) then
			return
		end
	end

	-- Get the word under the cursor
	local word = vim.fn.expand("<cword>")

	-- Calculate the new word
	local new_word = split(chars, "")[1] .. word .. split(chars, "")[2]

	-- Replace the word under the cursor with the new word
	vim.api.nvim_command('normal! ciw' .. new_word)
end




key.set('n', 'mrap', modify_word)
key.set('n', 'B', modify_word)
key.set('i', '<C-B>', modify_word)




local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

-- Custom zoxide picker
key.set('n', leader .. 'cd', function()
	-- Run zoxide query -ls and get the output
	local zoxide_output = vim.fn.systemlist('gs zoxide query -l | grep "C:" | grep -v work')

	-- Create the picker
	pickers.new({}, {
		prompt_title = 'Zoxide',
		finder = finders.new_table {
			results = zoxide_output,
		},
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = require('telescope.actions.state').get_selected_entry()
				print(selection[1])
				vim.cmd("Oil ".. selection[1])
			end)
			return true
		end,
	}):find()
end)

-- a = bb
-- bb = a

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


local function thunk()

end

local f = {
	invoke = function(inp)
		local handle = io.popen(inp)
		local result = handle:read("*a")
		handle:close()
		return result
	end,
	curr = {
		get = function() return vim.fn.getline('.') end,
		set = function(inp) vim.fn.setline('.', vim.split(inp, '\n')[1]) end,
	},
}

local md = {
	todo = {
		on = function() f.curr.set(f.invoke(string.format([[echo %s | js "a => {for (const i of [ ['- [ ] ', '- [x] '], ['- ', '- [ ] ', '- ['], ['- [x] ', '- [ ] ' ], ['', '- [ ] '] ]) { const t = a.trim(); if (t.startsWith(i[0]) && !(i[2] && t.startsWith(i[2]))) { a = a.replace(i[0], i[1]); break; } } return a.trimRight();}"]], f.curr.get()))) end,
		off = function() f.curr.set(f.invoke(string.format([[echo %s | js "a => a = (a.replace(/^\s*-\s*\[\s*.\s*\]\s*/, '- ')).trimRight()]], f.curr.get()))) end,
	},
}

-- toggles md todo status, or adds it if absent
key.set('n', 'mt', md.todo.on)
-- removes todo from line
key.set('n', 'md', function()
	md.todo.off()
	vim.cmd('normal! ==')
end)


-- key.set('i', '<S-<CR>>', '<CR><CR><up>')

local gcIsOn = true

function I(cond)
    return function(a, b)
        if cond then
            return a
        end
        return b
    end
end

-- toggle github copilot
key.set('n', 'q', function()
    local comd = I(gcIsOn)(":Copilot disable", ":Copilot enable")
    vim.cmd(comd)
    gcIsOn = not gcIsOn
    print("Github Copilot is now " .. (gcIsOn and "enabled" or "disabled"))
end)



function open_path(path) vim.cmd("e " .. path) end

function clean(str) return str:gsub("\n", "") end

function isTruthy(v)
	if v == nil then return false end
	if v == false then return false end
	if v == 0 then return false end
	if v == "" then return false end
	if v == {} then return false end
	return true
end

function Or(a, b) 
	if isTruthy(a) == false then return b end
	return a
end

function td(v)
	v = Or(v, "")
	v = vim.fn.system("td " .. v .. "d")
	v = clean(v)
	return v
end

local notes = "C:/Users/Daniel/notes/"
function todo(d)
	local v = td(d) 
	return notes .. "todo/" .. v .. ".md"
end

function daily(d)
	local v = td(d)
	return notes .. "daily/" .. v .. ".md"
end

key.set('n', 'dt', function()
	local fp = todo()
	vim.fn.system("touch " .. fp)
	file_window(fp)
end)

key.set('n', 'dl', function()
	local fp = daily()
	vim.fn.system("touch " .. fp)
	file_window(fp)
end)


key.set('n', leader .. "<C-c>", ":close!<CR>")
key.set('n', leader .. "W", ":w!<CR>:close!<CR>")
key.set('n', leader .. "<A-w>", ":close!<CR>")


vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.cmd(":set foldexpr=getline(v:lnum)[0]==\"\\t\"")
key.set("n", "_", "za")



