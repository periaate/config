-- imports


local up = "u"
local left = "a"
local right = "o"
local down = "e"

local UP = "U"
local LEFT = "a"
local RIGHT = "o"
local DOWN = "E"


local toggle = "t"
local leader = "@"
local GO = "g"
-- local Do = "d"


local keymap = vim.keymap.set

local function nrmap(mode, key, action, optss)
	local options = { noremap = true, silent = true }
	if optss then
		options = optss
	end
	keymap(mode, key, action, options)
end

local opts = { noremap = true }
local all = { 'n', 'v', 'x', 'o' }
local almost = { 'n', 'v', 'x' }

local key = {
	map = nrmap,
	opts = opts,
	all = all,
	modes = almost,
	almost = almost,
}



-- description
--
--

-- categories
--


-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings -- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings-- mappings
-- mappings

-- unmap
key.map(key.all, 'a', '')
key.map(key.all, 'b', '')
key.map(key.all, 'c', '')
key.map(key.all, 'd', '')
key.map(key.all, 'e', '')
key.map(key.all, 'f', '')
-- key.map(key.all, 'g', '') useful as default
key.map(key.all, 'h', '')
key.map(key.all, 'i', '')
key.map(key.all, 'j', '')
key.map(key.all, 'k', '')
key.map(key.all, 'l', '')
key.map(key.all, 'm', '')
key.map(key.all, 'n', '')
key.map(key.all, 'o', '')
key.map(key.all, 'p', '')
key.map(key.all, 'q', '')
key.map(key.all, 'r', '')
key.map(key.all, 's', '')
key.map(key.all, 't', '')
key.map(key.all, 'u', '')
key.map(key.all, 'v', '')
key.map(key.all, 'w', '')
key.map(key.all, 'x', '')
key.map(key.all, 'y', '')
key.map(key.all, 'z', '')

key.map(key.all, 'A', '')
key.map(key.all, 'B', '')
key.map(key.all, 'C', '')
key.map(key.all, 'D', '')
key.map(key.all, 'E', '')
key.map(key.all, 'F', '')
key.map(key.all, 'G', '')
key.map(key.all, 'H', '')
key.map(key.all, 'I', '')
key.map(key.all, 'J', '')
key.map(key.all, 'K', '')
key.map(key.all, 'L', '')
key.map(key.all, 'M', '')
key.map(key.all, 'N', '')
key.map(key.all, 'O', '')
key.map(key.all, 'P', '')
key.map(key.all, 'Q', '')
key.map(key.all, 'R', '')
key.map(key.all, 'S', '')
key.map(key.all, 'T', '')
key.map(key.all, 'U', '')
key.map(key.all, 'V', '')
key.map(key.all, 'W', '')
key.map(key.all, 'X', '')
key.map(key.all, 'Y', '')
key.map(key.all, 'Z', '')

key.map(key.all, '<C-a>', '')
key.map(key.all, '<C-b>', '')
key.map(key.all, '<C-c>', '')
key.map(key.all, '<C-d>', '')
key.map(key.all, '<C-e>', '')
key.map(key.all, '<C-f>', '')
key.map(key.all, '<C-g>', '')
key.map(key.all, '<C-h>', '')
key.map(key.all, '<C-i>', '')
key.map(key.all, '<C-j>', '')
key.map(key.all, '<C-k>', '')
key.map(key.all, '<C-l>', '')
key.map(key.all, '<C-m>', '')
key.map(key.all, '<C-n>', '')
key.map(key.all, '<C-o>', '')
key.map(key.all, '<C-p>', '')
key.map(key.all, '<C-q>', '')
key.map(key.all, '<C-r>', '')
key.map(key.all, '<C-s>', '')
key.map(key.all, '<C-t>', '')
key.map(key.all, '<C-u>', '')
key.map(key.all, '<C-v>', '')
key.map(key.all, '<C-w>', '')
key.map(key.all, '<C-x>', '')
key.map(key.all, '<C-y>', '')
key.map(key.all, '<C-z>', '')

key.map(key.all, ':', '')
key.map(key.all, '/', '')
key.map(key.all, '\\', '')
key.map(key.all, '(', '')
key.map(key.all, ')', '')
key.map(key.all, '[', '')
key.map(key.all, ']', '')
key.map(key.all, '<', '')
key.map(key.all, '>', '')
key.map(key.all, '{', '')
key.map(key.all, '}', '')
key.map(key.all, '^', '')
key.map(key.all, '@', '')
key.map(key.all, '&', '')
key.map(key.all, '$', '')
key.map(key.all, '#', '')
key.map(key.all, '~', '')

key.map(key.all, '<CR>', '')
key.map(key.all, '<Tab>', '')
key.map(key.all, '<S-Tab>', '')
key.map(key.all, '<Space>', '')
key.map(key.all, '<BS>', '')


local ALL = { 'n', 'v', 'x', 'o', 'i' }
key.map('o', '<delete>', 'l')


key.map(key.all, 'l', '_')

key.map('o', '(', 'i(')
key.map('o', ')', 'a)')
key.map('o', '[', 'i[')
key.map('o', ']', 'a]')
key.map('o', '{', 'i{')
key.map('o', '}', 'a}')
key.map('o', '<', 'i<')
key.map('o', '>', 'a>')


-- mode controls
key.map(key.all, toggle .. "t", "mma", key.opts)
key.map(key.all, "nn", "mmi", key.opts)
key.map(key.all, toggle .. "a", "mmi", key.opts)
key.map(key.all, toggle .. "o", "mma", key.opts)
key.map(key.all, toggle .. "eA", "mmI", key.opts)
key.map(key.all, toggle .. "eO", "mmA", key.opts)
key.map(key.all, "v", "v", key.opts)
key.map(key.all, "V", "V", key.opts)
key.map(key.all, "z", "<C-v>", key.opts)
key.map(key.all, "<C-v>", "p", key.opts)
key.map('i', "<C-n>", "<ESC>`m", key.opts)

-- base movement
-- base LR based on discovery
key.map(key.all, left, 'F', key.opts)
key.map(key.all, right, 'f', key.opts)
key.map(key.all, 'A', 'T', key.opts)
key.map(key.all, 'O', 't', key.opts)

key.map(key.modes, '}', ';', key.opts)
key.map(key.modes, '{', ',', key.opts)

-- key.map(key.all, 'a<C-a>', '0', key.opts)
-- key.map(key.all, 'o<C-o>', 'g_', key.opts)

-- alternative LR based on words
-- key.map(key.all, "<C-a>", "b", key.opts)
-- key.map(key.all, "<C-o>", "w", key.opts)
-- key.map(key.all, "i", "e", key.opts)

-- vertical movement remaps
key.map(key.all, up, "k", key.opts)
key.map(key.all, down, "j", key.opts)
key.map(key.all, UP, '{', key.opts)
key.map(key.all, DOWN, '}', key.opts)

-- key.map(key.all, "gu", "gk", key.opts)
-- key.map(key.all, "ge", "gj", key.opts)

-- undo & redo _ ( & )
key.map('n', "(", 'u', key.opts)
key.map('n', ")", '<C-r>', key.opts)

-- copy-paste-replace
key.map(key.modes, 'r', 'c', key.opts)
key.map(key.modes, 'r<Delete>', 'cl', key.opts)

local sub = require('substitute')
key.map('n', 'rw', sub.operator, key.opts)
key.map('x', 'rw', sub.visual, key.opts)

-- cw next to one another, cv layer on keyboard, mapped to mirror global usage
key.map(key.modes, 'c', 'y', key.opts)
key.map(key.modes, 'w', 'p', key.opts)
key.map(key.modes, 'C', 'Y', key.opts)
key.map(key.modes, 'W', 'P', key.opts)

-- tabulation
key.map(key.all, '<Tab>', '>>', key.opts)
key.map(key.all, '<S-Tab>', '<<', key.opts)

key.map('v', '<Tab>', '>', key.opts)
key.map('v', '<S-Tab>', '<', key.opts)


key.map(key.all, '<CR>', ':', key.opts)


local line_rhs = function()
	return require('vim._comment').operator() .. '_'
end

-- commenting
key.map('n', '/', require('vim._comment').operator, { expr = true, noremap = true, silent = true })
key.map(key.all, "//", line_rhs, { expr = true, noremap = true, silent = true })

-- newlines
-- edit
key.map('n', 'lu', "I<CR><Esc>ki")
key.map('n', 'le', 'A<CR>')
-- editless
key.map('n', '<A-u>', "mlI<CR><Esc>k")
key.map('n', '<A-e>', "mlA<CR><Esc>")
-- delete
key.map('n', 'l<C-e>', "mlj0i<BS><Esc>`l")
key.map('n', 'l<C-u>', "mlk0i<BS><Esc>`l")


-- key.map('n', '~', '~h')
key.map('n', 'tc', 'g~')
key.map('n', 'tuc', 'gU')
key.map('n', 'tlc', 'gu')

-- macros
key.map(key.all, 'ne', 'q')
key.map(key.all, 'he', '@')



-- indent entire file
key.map('n', '<leader>=', [[mlgg=G`l]])

-- move selection up or down in visual mode
key.map("v", "<C-u>", ":m '<-2<CR>gv=gv")
key.map("v", "<C-e>", ":m '>+1<CR>gv=gv")

-- remove and add to register
key.map({ "n", "v" }, "<leader><BS>", "d")

-- remove without register
key.map(key.modes, "<BS>", [["_d]], key.opts)

--rename
key.map('n', '<C-r>', function() vim.lsp.buf.rename() end, { noremap = true, silent = true })
key.map('v', '<C-r>', '\"fy<Esc>:%s/<C-r>f/', key.opts)
key.map("n", "r<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Go error snippets
key.map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn<Esc>")
key.map("n", "<leader>ef", "oif err != nil {<CR>}<Esc>Olog.Fatalln(err)<Esc>")
key.map("n", "<leader>ep", "oif err != nil {<CR>}<Esc>Opanic(err)<Esc>")
key.map("n", "<leader>el", "oif err != nil {<CR>}<Esc>Oslog.Error(\"error occurred\", \"err\", err)<Esc>")


key.map("n", "mi", "oif  {<CR>}<ESC><up><end><left><left>")
key.map("n", "men", "aerr != nil<ESC>o<ESC>")

key.map("n", "mer", "areturn<ESC>")
key.map("n", "mep", "apanic(err)<ESC>")
key.map("n", "mce", 'aclog.Error("error ", "err", err)<ESC>FEf f"')




-- shoutout (load current file as lua or something)ts
key.map("n", "<leader>so", function() vim.cmd("so") end)


-- Map Ctrl+s to :w in normal mode
key.map(key.all, '<C-s>', ':w<CR>', key.opts)

-- Map Ctrl+s to :w in insert mode
key.map('i', '<C-s>', '<Esc>:w<CR>', key.opts)

-- file closing
key.map(key.almost, '<leader>WW', 'ZZ', key.opts)
key.map(key.almost, '<leader>WF', ':qa!<CR>', key.opts)

key.map(key.almost, 'WW', ':w!<CR>:bd!<CR>', key.opts)
key.map(key.almost, 'WF', ':bd!<CR>', key.opts)

key.map(key.almost, '<C-w>', ':bd<CR>', key.opts)
key.map(key.almost, '<leader><C-w>', '<C-w>c', key.opts)


key.map("n", "-", "<CMD>Oil<CR>", key.opts)



-- search
key.map(key.all, '<', 'n', key.opts)
key.map(key.all, '>', 'N', key.opts)

-- ================= --
-- Splits management --

-- Movement
key.map(key.all, leader .. 'a', '<C-w>h', key.opts) -- Move left
key.map(key.all, leader .. 'e', '<C-w>j', key.opts) -- Move down
key.map(key.all, leader .. 'u', '<C-w>k', key.opts) -- Move up
key.map(key.all, leader .. 'o', '<C-w>l', key.opts) -- Move right

-- Resizing
key.map(key.all, leader .. 'A', '<C-w><', key.opts) -- Resize left
key.map(key.all, leader .. 'E', '<C-w>+', key.opts) -- Resize down
key.map(key.all, leader .. 'U', '<C-w>-', key.opts) -- Resize up
key.map(key.all, leader .. 'O', '<C-w>>', key.opts) -- Resize right

-- New splits
key.map(key.all, leader .. '<C-a>', ':vsp<CR>', key.opts)       -- Vertical split right
key.map(key.all, leader .. '<C-o>', ':vsp<CR><C-w>l', key.opts) -- Vertical split left
key.map(key.all, leader .. '<C-u>', ':sp<CR>', key.opts)        -- Horizontal split up
key.map(key.all, leader .. '<C-e>', ':sp<CR><C-w>j', key.opts)  -- Horizontal split down

-- Moving splits
key.map(key.all, leader .. 'tr', '<C-w>r', key.opts) -- Rotate windows
key.map(key.all, leader .. 'te', '<C-w>J', key.opts) -- Move window down
key.map(key.all, leader .. 'tu', '<C-w>K', key.opts) -- Move window up
key.map(key.all, leader .. 'to', '<C-w>H', key.opts) -- Move window left
key.map(key.all, leader .. 'ta', '<C-w>L', key.opts) -- Move window right

key.map(key.all, '<leader><C-w>', ':close<CR>', key.opts)
-- ================= --

-- diagnostic
key.map("n", "<leader>eo", vim.diagnostic.goto_next)
key.map("n", "<leader>ea", vim.diagnostic.goto_prev)

-- show floating preview of the word currently under the cursor in normal mode
key.map("n", "th", function() vim.lsp.buf.hover() end)


key.map('i', '<C-Delete>', '<Esc>wdwi')
key.map('i', '<C-v>', [[<ESC>pi]])

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

key.map('n', '!w', function()
	local word = cw()
	vim.api.nvim_feedkeys('!!' .. word, 'n', false)
end)


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
		path = fp.normalize(path)
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
key.map('o', '*', 'iw')

local edit = {
	paste = function(val, before_cursor)
		if before_cursor then
			vim.cmd('normal! i' .. val)
		else
			vim.cmd('normal! a' .. val)
		end
	end,
}

key.map('n', 'fn', function()
	local w = get.name(false)
	edit.paste(w, false)
end)

key.map('n', 'gop', function()
	edit.paste("package " .. get.base(), false)
end
)

key.map('n', 'hac', function()
	local w = get.word()
	-- toggle capitalization on first letter

	if w:match('%u') then
		w = w:lower()
	else
		w = w:gsub("^%l", string.upper)
	end

	swapw(w)
end)

key.map('n', toggle .. "nt", function()
	vim.o.expandtab = false
end)

key.map('n', toggle .. "ot", function()
	vim.o.expandtab = true
end)

key.map('n', 'b', 'za')


key.map('v', 'R', ":s/", { silent = false })

-- inner and outer movements
key.map('o', 't', 'a')
key.map('o', 'n', 'i')


-- block visual mode line insert
key.map('v', 'nn', 'I')
key.map('v', 'tt', 'I')



-- new movement

-- key.map('o', "[", "0")
-- key.map(key.all, "]", "$")



key.map({ "n", "x", "o" }, "i", function() require("flash").treesitter() end)
key.map({ "n", "x", "o" }, "k", function() require("flash").treesitter_search() end)

key.map({ "n", "x", "o" }, "P",
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

key.map({ "n", "x", "o" }, " e",
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

key.map({ "n", "x", "o" }, " u",
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


key.map({ "n", "x", "o" }, " E",
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

key.map({ "n", "x", "o" }, " U",
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

key.map({ "n", "x", "o", }, "y",
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

key.map({ "n", "x", "o", }, "p",
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






