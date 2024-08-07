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
local leader = " "
local GO = "g"
local Do = "d"


local keymap = vim.keymap.set

local function nrmap(mode, key, action, optss)
	local options = { noremap = true, silent = true }
	if optss then
		options = optss
	end
	keymap(mode, key, action, options)
end

local opts = {noremap = true}
local all = {'n', 'v', 'x', 'o'}
local almost = {'n', 'v', 'x'}

local key = {
	map = nrmap,
	opts = opts,
	all = all,
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



-- key.map(key.all, 'd', '')
-- key.map(key.all, 'D', '')
-- key.map(key.all, 'x', '')
-- key.map(key.all, 'X', '')
-- key.map(key.all, 'j', '')
-- key.map(key.all, 'J', '')
-- key.map(key.all, 'q', '')
-- key.map(key.all, 'Q', '')
-- key.map(key.all, 'f', '')
-- key.map(key.all, 'F', '')
-- key.map(key.all, '>', '')
-- key.map(key.all, '<', '')
-- key.map(key.all, '>>', '')
-- key.map(key.all, '<<', '')
-- key.map(key.all, 'n', '')
-- key.map(key.all, 't', '')
-- key.map(key.all, 'N', '')
-- key.map(key.all, 'T', '')
-- key.map(key.all, ' ', '')
-- key.map(key.all, '<CR>', '')
-- key.map(key.all, ':', '')
-- key.map(key.all, '&', '')
-- key.map(key.all, '^', '')
-- key.map(key.all, '@', '')
-- key.map(key.all, '/', '')


local ALL = {'n', 'v', 'x', 'o', 'i'}

key.map(ALL, '<left>', '<nop>')
key.map(ALL, '<right>', '<nop>')
key.map(ALL, '<up>', '<nop>')
key.map(ALL, '<down>', '<nop>')

key.map('o', '<delete>', 'l')


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

local TToggle = false

function mov(direction)
	return function()
		directions = {
			["up"] = "k",
			["down"] = "j",
			["left"] = "h",
			["right"] = "l",
		}
		toggled = {
			["up"] = "{",
			["down"] = "}",
			["left"] = "b",
			["right"] = "w",
		}
		if toggle then
			vim.cmd('normal!' .. toggled[direction])
			return
		end

		vim.cmd('normal!' .. directions[direction])
	end
end


key.map('i', "<C-e>", mov('down'), key.opts)
key.map({'i', 'v', 'n'}, "<C-a>", mov('left'), key.opts)
key.map('i', "<C-u>", mov('up'), key.opts)
key.map({'i', 'v', 'n'}, "<C-o>", mov('right'), key.opts)

key.map({'i', 'v', 'n'}, "<C-g>", function()
	TToggle = not TToggle
end, key.opts)


-- base movement
-- base LR based on discovery
key.map(key.all, left, 'F', key.opts)
key.map(key.all, right, 'f', key.opts)
key.map(key.all, 'A', 'T', key.opts)
key.map(key.all, 'O', 't', key.opts)

key.map(key.all, '}', ';', key.opts)
key.map(key.all, '{', ',', key.opts)

key.map(key.all, 'a<C-a>', '0', key.opts)
key.map(key.all, 'o<C-o>', 'g_', key.opts)

-- alternative LR based on words
-- key.map(key.all, "<C-a>", "b", key.opts)
-- key.map(key.all, "<C-o>", "w", key.opts)
key.map(key.all, "i", "e", key.opts)

-- vertical movement remaps
key.map(key.all, up, "k", key.opts)
key.map(key.all, down, "j", key.opts)
key.map(key.all, UP, '{', key.opts)
key.map(key.all, DOWN, '}', key.opts)
key.map('n', '<C-u>', '20k', key.opts)
key.map('n', '<C-e>', '20j', key.opts)

key.map(key.all, "gu", "gk", key.opts)
key.map(key.all, "ge", "gj", key.opts)

-- undo & redo _ ( & )
key.map(key.all, "(", 'u', key.opts)
key.map(key.all, ")", '<C-r>', key.opts)

-- copy-paste-replace
key.map(key.all, 'r', 'c', key.opts)
key.map(key.all, 'r<Delete>', 'cl', key.opts)

local sub = require('substitute')
key.map('n', 'rw', sub.operator, key.opts)
key.map('x', 'rw', sub.visual, key.opts)

key.map('n', 'rwl', function()
	vim.cmd('normal! V')
	sub.visual()
end)


-- cw next to one another, cv layer on keyboard, mapped to mirror global usage
key.map(key.all, 'c', 'y', key.opts)
key.map(key.all, 'ca', 'lyf', key.opts)
key.map(key.all, 'cc', 'yy', key.opts)
key.map('v', 'cc', 'y', key.opts)
key.map(key.all, 'w', 'p', key.opts)
key.map(key.all, 'C', 'Y', key.opts)
key.map(key.all, 'W', 'P', key.opts)

key.map('n', 'mm', 'm')

-- tabulation
key.map(key.all, '<Tab>', '>>', key.opts)
key.map(key.all, '<S-Tab>', '<<', key.opts)

key.map('v', '<Tab>', '>', key.opts)
key.map('v', '<S-Tab>', '<', key.opts)


key.map(key.all, ':', ':', key.opts)
key.map(key.all, '<CR>', ':', key.opts)


key.map(key.all, 's', '@', key.opts)
key.map(key.all, 'ss', '@@', key.opts)

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
-- key.map('n', 'lU', "mlI<CR><Esc>`l")
-- key.map('n', 'lE', "mlA<CR><Esc>`l")
-- delete
-- key.map('n', 'l<C-u>', "mlj0i<BS><Esc>`l")
-- key.map('n', 'l<C-e>', "mlk0i<BS><Esc>`l")


-- key.map('n', '~', '~h')
key.map('n', 'tc', 'g~')
key.map('n', 'tuc', 'gU')
key.map('n', 'tlc', 'gu')

-- macros
key.map(key.all, 'h', 'q')
key.map(key.all, 's', '@')



-- indent entire file
key.map('n', '<leader>=', [[mlgg=G`l]])

-- move selection up or down in visual mode
key.map("v", "<C-u>", ":m '<-2<CR>gv=gv")
key.map("v", "<C-e>", ":m '>+1<CR>gv=gv")

-- remove and add to register
key.map({"n", "v"}, "<leader><BS>", "d")
key.map({"n", "v"}, "<leader><BS><BS>", "dd")

-- remove without register
key.map(key.all, "<BS>", [["_d]], key.opts)
key.map(key.all, "<BS><BS>", [[0"_dg_i<BS><Esc>]], key.opts)
key.map('v', "<BS><BS>", [["_d]], key.opts)

--rename
key.map('n', '<C-r>', function()	vim.lsp.buf.rename() end, { noremap = true, silent = true })
key.map('v', '<C-r>', '\"fy<Esc>:%s/<C-r>f/',key.opts)
key.map("n", "r<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Go error snippets
key.map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn<Esc>")
key.map("n", "<leader>ef", "oif err != nil {<CR>}<Esc>Olog.Fatalln(err)<Esc>")
key.map("n", "<leader>ep", "oif err != nil {<CR>}<Esc>Opanic(err)<Esc>")
key.map("n", "<leader>el", "oif err != nil {<CR>}<Esc>Oslog.Error(\"error occurred\", \"err\", err)<Esc>")


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





key.map(key.all, 'ne', ':b#<CR>', {noremap = true, silent = true})
key.map(key.all, 'na', ':bprevious<CR>', {noremap = true, silent = true})
key.map(key.all, 'no', ':bnext<cr>', {noremap = true, silent = true})


key.map("n", "-", "<CMD>Oil<CR>" ,key.opts)



-- search
key.map(key.all, '>', 'N', key.opts)
key.map(key.all, '<', 'n', key.opts)

-- ================= --
-- Splits management --

-- Movement
key.map(key.all, leader .. 'a', '<C-w>h', key.opts)  -- Move left
key.map(key.all, leader .. 'e', '<C-w>j', key.opts)  -- Move down
key.map(key.all, leader .. 'u', '<C-w>k', key.opts)  -- Move up
key.map(key.all, leader .. 'o', '<C-w>l', key.opts)  -- Move right

-- Resizing
key.map(key.all, leader .. 'A', '<C-w><', key.opts)  -- Resize left
key.map(key.all, leader .. 'E', '<C-w>+', key.opts)  -- Resize down
key.map(key.all, leader .. 'U', '<C-w>-', key.opts)  -- Resize up
key.map(key.all, leader .. 'O', '<C-w>>', key.opts)  -- Resize right

-- New splits
key.map(key.all, leader .. '<C-a>', ':vsp<CR>', key.opts)  -- Vertical split right
key.map(key.all, leader .. '<C-o>', ':vsp<CR><C-w>l', key.opts)  -- Vertical split left
key.map(key.all, leader .. '<C-u>', ':sp<CR>', key.opts)  -- Horizontal split up
key.map(key.all, leader .. '<C-e>', ':sp<CR><C-w>j', key.opts)  -- Horizontal split down

-- Moving splits
key.map(key.all, leader .. 'tr', '<C-w>r', key.opts)  -- Rotate windows
key.map(key.all, leader .. 'te', '<C-w>J', key.opts)  -- Move window down
key.map(key.all, leader .. 'tu', '<C-w>K', key.opts)  -- Move window up
key.map(key.all, leader .. 'to', '<C-w>H', key.opts)  -- Move window left
key.map(key.all, leader .. 'ta', '<C-w>L', key.opts)  -- Move window right

key.map(key.all, '<leader><C-w>', ':close<CR>', key.opts)
-- ================= --

-- diagnostic
key.map("n", "<leader>eo", vim.diagnostic.goto_next)
key.map("n", "<leader>ea", vim.diagnostic.goto_prev)

-- show floating preview of the word currently under the cursor in normal mode
key.map("n", "dp", function() vim.lsp.buf.hover() end)

vim.g.copilot_no_tab_map = true
key.map("i", "<C-y>", 'copilot#Accept("\\<CR>")', { silent = true, expr = true, replace_keycodes = false})

-- toggle copilot enable
key.map("n", "<leader>tce", ":Copilot enable<CR>")
-- toggle copilot disable
key.map("n", "<leader>tcd", ":Copilot disable<CR>")


key.map('i', '<C-Delete>', '<Esc>wdwi')
key.map('i', '<C-v>', [[<ESC>pi]])




local function opf(fn, set, lle, s)
	s = s or false
	local function MapLines(start, finish, fun, lin, s)
		si, ei = start[1], finish[1]
		sc, ec = start[2], finish[2]

		for i = si, ei do
			line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
			inp = line

			if lin == false then
				if i == si then
					if sc ~= 0 then
						inp = string.sub(inp, sc)
					end
				end
				if i == ei then
					if ec ~= 0 then
						inp = string.sub(inp, 0, ec)
					end
				end
			end


			fun(inp, i, line)

			if s then
				break
			end
		end
	end


	function SetHOF(fun, start, finish, lin, single)
		si, ei = start[1], finish[1]
		sc, ec = start[2], finish[2]
		if single then
			if sc > ec then
				sc, ec = ec, sc
			end
		end

		return function(line, i, og)
			res = fun(line, i)
			if res == nil then
				res = ''
			end
			if lin == false then
				if i == si then
					if sc ~= 0 then 
						start_splice = string.sub(og, 0, sc)
						-- day
						res = start_splice .. res
					end
				end
				if i == ei then
					if ec ~= 0 then	
						end_splice = string.sub(og, sc+string.len(line))
						res = res .. end_splice
					end
				end
			end
			-- day

			vim.api.nvim_buf_set_lines(0, i - 1, i, false, {res})
		end
	end

	return function()
		_G.op_func_formatting = function()
			local start = vim.api.nvim_buf_get_mark(0, '[')
			local finish = vim.api.nvim_buf_get_mark(0, ']')

			if start[1] > finish[1] then
				start, finish = finish, start
			end

			if set then 
				MapLines(start, finish, SetHOF(fn, start, finish, lle), lle)
			else 
				MapLines(start, finish, fn, lle)
			end
		end

		vim.go.operatorfunc = 'v:lua.op_func_formatting'
		vim.api.nvim_feedkeys('g@', 'n', false)
	end
end

local tfun = function(line, i) 
	return i .. line
end

key.map('n', 'mep', opf(function(line, i)
	return "(" .. line .. ")"
end,
true, false, true), key.opts)


key.map('n', 'fem', opf(tfun, true, true), key.opts)
key.map('n', 'fgm', opf(print, false, false), key.opts)

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

function invoke(cmd)
	local handle = io.popen(cmd)
	local result = handle:read("*a")
	handle:close()
	return result
end

key.map('n', '!w', function()
	local word = cw()
	vim.api.nvim_feedkeys('!!' .. word, 'n', false)
end)

key.map('n', 'mote', opf(function(line, index)
	local comd = vim.fn.input('Enter command: ', line)
	print('comd', comd)
	res = invoke(comd)
	res = split(res)[1]
	return res
end, true, false, true), key.opts)

key.map('o', 'ww', 'iw')

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
-- day
local fp = {
	normalize = function(path)
		path = string.gsub(path, "\\", "/")
		return path
	end,
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


local function sw(str, prefix)
	return str:sub(1, #prefix) == prefix
end

function swapw(w)
	vim.cmd('normal! maviwc' .. w)
	vim.cmd('normal! `a')
end

-- cword motion
key.map('o', '*', 'iw')


function edit_num(i)
	word = vim.fn.expand('<cword>')
	if word:match('%d') then 
		res = word + i
		swapw(res)
	end
end

function W(fn, args)
	return function()
		fn(args)
	end
end


local num = {
	abs = function(n)
		if n < 0 then
			return -n
		end
		return n
	end,
	negIndex = function(n, len)
		if n < 0 then
			return len + n + 1
		end
		return n
	end,
	is = function(n)
		return tonumber(n) ~= nil
	end
}


-- make into a global command

function Do(cmd)
	if cmd == 'word' then
		print(get.word())
	elseif cmd == 'name' then
		print(get.name())
	elseif cmd == 'path' then
		print(get.path())
	elseif cmd == 'base' then
		print(get.base())
	elseif cmd == 'position' then
		print(get.position())
	end
end

key.map('n', 'do', function()
	local cmd = vim.fn.input('Enter command: ')
	Do(cmd)
end)


key.map('n', 'dwc', function()
	vim.cmd('.!nanika word count ' .. get.path())
end)

key.map('n', 'duc', function()
	vim.cmd('.!nanika word unique ' .. get.path())
end)

function transform_line(line, reverse)
	local w = get.word()
	local swap = false
	if w == 'true' then
		w = 'false'
		swap = true
	elseif w == 'false' then
		w = 'true'
		swap = true
	elseif w == 'True' then
		w = 'False'
		swap = true
	elseif w == 'False' then
		w = 'True'
		swap = true
	end

	if swap then
		vim.cmd('normal! maviwc' .. w)
		vim.cmd('normal! `a')
		-- true
	end


	if num.is(w) then
		if reverse then
			n = tonumber(w)
			if n > 0 then
				w = edit_num(-1)
			end
		else
			w = edit_num(1)
		end
		swap = true
	end

	-- Trim leading whitespaces and preserve the original leading spaces
	local leading_spaces = line:match("^%s*")
	line = line:sub(#leading_spaces + 1)

	if swap then
		return leading_spaces .. line
	end 

	-- hash 
	local hashes = line:match("^#*")
	if #hashes > 1 and #leading_spaces == 0 then
		if reverse then
			return line:sub(2)
		end
		return '#' .. line
	elseif sw(line, '#') and #leading_spaces == 0 then
		if reverse then
			return line
		end
		return '#' .. line
	end

	if sw(line, "- [x] ") then
		if reverse then
			return leading_spaces .. "- [ ] " .. line:sub(7)
		end
		return leading_spaces .. "- [ ] " .. line:sub(7)
	elseif sw(line, "- [ ] ") then
		if reverse then
			return leading_spaces .. "- " .. line:sub(7)
		end
		return leading_spaces .. "- [x] " .. line:sub(7)
	end


	if reverse then
		return leading_spaces:sub(2) .. line
	end
	return "\t" .. leading_spaces .. line
end


-- - [ ] test
function abbn(t)
	return function()  
		line = vim.fn.getline('.')

		res = transform_line(line, t)
		if res == line then
			return
		end

		vim.fn.setline('.', res)

		line = vim.fn.getline('.')
		local leading_spaces = line:match("^%s*")
		line = line:sub(#leading_spaces + 1)
		if sw(line, '- [x] ') or sw(line, '- [ ] ') then
			vim.cmd('normal! 0f]ll')
		else
			vim.cmd('normal! 0f l')
		end
	end
end

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
		if sw(line, '- [x] ') or sw(line, '- [ ] ') then
			vim.cmd('normal! 0f]ll')
		else
			vim.cmd('normal! 0f l')
		end
	end
end

key.map('n', 'K', abbn(false), key.opts)
key.map('n', 'P', abbn(true), key.opts)
key.map('n', '#', line_hof(function(line) 
	local lead = line:match("^#*%s*")
	if #lead ~= 0 then
		return line:sub(#lead + 2)
	end
	return '# ' .. line
end), key.opts)

key.map('n', '$', line_hof(function(line) 
	local leading_spaces = line:match("^%s*")
	line = line:sub(#leading_spaces + 1)
	if sw(line, '- [x] ') or sw(line, '- [ ] ') then
		return leading_spaces .. line:sub(7)
	end
	return leading_spaces .. '- [ ] ' .. line
end), key.opts)

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

key.map(key.all, '<C-a>', ',')
key.map(key.all, '<C-o>', ';')

-- block visual mode line insert
key.map('v', 'nn', 'I')
key.map('v', 'tt', 'I')






























