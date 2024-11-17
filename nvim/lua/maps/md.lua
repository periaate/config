local key = require("lib.key")

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
		off = function()
			f.curr.set(f.invoke(string.format([[echo %s | js "a => a = (a.replace(/^\s*-\s*\[\s*.\s*\]\s*/, '- ')).trimRight()]], f.curr.get())))
			vim.cmd('normal! ==')
		end,
	},
}


return md
