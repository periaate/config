
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

local key = require("maps.mapping")

local md = {
	todo = {
		on = function() f.curr.set(f.invoke(string.format([[
			echo %s |
			js "a => {for (const i of [ ['- [ ] ', '- [x] '], ['- ', '- [ ] ', '- ['], ['- [x] ', '- [ ] ' ], ['', '- [ ] '] ]) { const t = a.trim(); if (t.startsWith(i[0]) && !(i[2] && t.startsWith(i[2]))) { a = a.replace(i[0], i[1]); break; } } return a.trimRight();}"]], f.curr.get()))) end,
		off = function() f.curr.set(f.invoke(string.format([[echo %s | js "a => a = (a.replace(/^\s*-\s*\[\s*.\s*\]\s*/, '- ')).trimRight()]], f.curr.get()))) end,
	},
}

# -- toggles md todo status, or adds it if absent
key.map('n', 'mt', md.todo.on)
-- removes todo from line
key.map('n', 'md', function()
	md.todo.off()
	vim.cmd('normal! ==')
end)
