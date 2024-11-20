local key = require("lib.key")
local std = require("lib.std")
local sessions = require("lib.sessions")
local get = std.get
local str = std.str
local edit = std.edit

local up    = "u"
local left  = "a"
local right = "o"
local down  = "e"

local UP    = "U"
local DOWN  = "E"

function setup()
	vim.o.expandtab = false
	key.set('n', 'fn', function() edit.paste(get.name(false), false) end)

	key.set('i', '<C-d>', '<C-R>') -- required for abbrevations

	key.set('o', '<delete>', 'l') -- character
	key.set('o', '*', 'iw')       -- current word
	key.set(key.all, 'l', '_')    -- current line

	key.set(key.all, 'b', 'm')  -- set marker
	key.set(key.all, "'", '`')  -- go to pos marker
	key.set(key.all, '"', '``') -- go to pos marker
	key.set(key.all, '`', "'")  -- go to pos marker
	key.set(key.all, '{', 'b')  -- go to previous word
	key.set(key.all, '}', 'e')  -- go to next word

	key.set('o', '(', 'i(') -- inner (
	key.set('o', ')', 'a)') -- outer )
	key.set('o', '[', 'i[') -- inner [
	key.set('o', ']', 'a]') -- outer ]
	key.set('o', '{', 'i{') -- inner {
	key.set('o', '}', 'a}') -- outer }
	key.set('o', '"', 'i"') -- inner quotes

	key.set(key.all, "tt", "mma", key.opts)  -- insert before; with marker
	key.set(key.all, "nn", "mmi", key.opts)  -- insert after; with marker
	key.set(key.all, "v", "v", key.opts)     -- visual
	key.set(key.all, "V", "V", key.opts)     -- visual line
	key.set(key.all, "z", "<C-v>", key.opts) -- visual block
	key.set(key.all, '<CR>', ':', key.opts)  -- command mode

	key.set(key.all, left, 'F', key.opts)  -- find left
	key.set(key.all, right, 'f', key.opts) -- find right
	key.set(key.all, 'A', 'T', key.opts)   -- find before left
	key.set(key.all, 'O', 't', key.opts)   -- find before right
	key.set(key.all, up, "k", key.opts)    -- up
	key.set(key.all, down, "j", key.opts)  -- down
	key.set(key.all, UP, '{', key.opts)    -- paragraph up
	key.set(key.all, DOWN, '}', key.opts)  -- paragraph down

	key.set('n', "(", 'u', key.opts)     -- undo
	key.set('n', ")", '<C-r>', key.opts) -- repeat

	key.set(key.modes, 'r', 'c', key.opts)        -- replace
	key.set({ "n", "v" }, "<leader><BS>", "d")    -- remove; register
	key.set(key.modes, "<BS>", [["_d]], key.opts) -- remove; no register

	key.set(key.modes, 'c', 'y', key.opts)   -- copy
	key.set(key.all, "<C-v>", "p", key.opts) -- paste
	key.set(key.modes, 'w', 'p', key.opts)   -- paste after
	key.set(key.modes, 'W', 'P', key.opts)   -- paste before
	key.set('i', '<C-v>', [[<ESC>pi]])       -- paste in insert mode

	key.set('n', 'rw', require('substitute').operator, key.opts) -- replace with paste
	key.set('x', 'rw', require('substitute').visual, key.opts)   -- replace with paste

	key.set('v', 'R', ":s/", key.opts) -- replace

	key.set(key.all, '<Tab>', '>', key.opts)   -- indent
	key.set(key.all, '<S-Tab>', '<', key.opts) -- unindent

	key.set('o', 't', 'a')  -- outer
	key.set('o', 'n', 'i')  -- inner
	key.set('v', 'nn', 'I') -- block visual insert after
	key.set('v', 'tt', 'A') -- block visual insert before

	key.set('n', 'B', str.modify_word)     -- wrap current word
	key.set('i', '<C-B>', str.modify_word) -- wrap current word

	key.set('n', '/', require('vim._comment').operator, { expr = true, noremap = true, silent = true }) -- comment operator

	key.set('n', 'lu', "I<CR><Esc>ki") -- newline above
	key.set('n', 'le', 'A<CR>')        -- newline below

	key.set(key.all, 'ne', 'q') -- record macro
	key.set(key.all, 'he', '@') -- play macro

	key.set('n', '<leader>=', [[mlgg=G`l]]) -- format file

	key.set("v", "<C-u>", ":m '<-2<CR>gv=gv") -- move selection up
	key.set("v", "<C-e>", ":m '>+1<CR>gv=gv") -- move selection down

	key.set('n', '<C-r>', function() vim.lsp.buf.rename() end) 				  -- rename; lsp
	key.set('v', '<C-r>', '\"fy<Esc>:%s/<C-r>f/', key.opts) 				  -- rename selection
	key.set("n", "R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- rename current word

	key.set("n", "<leader>so", ":w<cr>:so<cr>")      -- shoutout; source current lua file
	key.set(key.all, '<C-s>', ':w<CR>', key.opts)    -- save file
	key.set('i', '<C-s>', '<Esc>:w<CR>', key.opts)   -- save file from insert mode
	key.set(key.all, '<leader><C-w>', ':close<CR>')  -- close 

	key.set(key.modes, '<leader>WW', function()
		sessions.save_session()
		vim.cmd('normal! ZF')
	end, key.opts)      -- save and exit all files

	key.set(key.modes, '<C-q>', function()
		sessions.save_session()
		vim.cmd('normal! ZQ')
	end, key.opts)      -- exit all files

	key.set('n', ' ~', sessions.load_session)
	key.set('n', ' <C-s>', sessions.save_session)

	key.set(key.all, '<', 'n', key.opts) -- find previous pattern
	key.set(key.all, '>', 'N', key.opts) -- find next pattern

	key.set("n", "{", vim.diagnostic.goto_prev) -- diagnostic prev
	key.set("n", "}", vim.diagnostic.goto_next) -- diagnostic next

	key.set("n", "_", "za") -- toggle folding

	key.set('n', 'tc', 'g~')  -- toggle case
	key.set('n', 'tuc', 'gU') -- toggle upper case
	key.set('n', 'tlc', 'gu') -- toggle lower case

	key.set('n', 'hac', function()
		local w = get.word()
		if w:match('%u') then w = w:lower() else w = w:gsub("^%l", string.upper) end
		vim.cmd('normal! maviwc' .. w)
		vim.cmd('normal! `a')
	end)

	key.set("n", "-", "<CMD>Oil<CR>", key.opts) -- access oil

	key.set('n', 'dt', require("maps.notes").todo)  -- open todays todo
	-- key.set('n', 'dl', require("maps.notes").daily) -- open todays daily
	
	key.set('n', "<C-a>", "<cmd>BufferPrevious<CR>")
	key.set('n', "<C-o>", "<cmd>BufferNext<CR>")
	key.set('n', '<esc>', '<esc>')
	key.set("n", "<ESC>", ":lua require('notify').dismiss()<CR>", { silent = true })
end


return { setup = setup }
