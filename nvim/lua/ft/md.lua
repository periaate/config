local key = require("lib.key")
local str = require("lib.str")

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

local md = {}

md.get = function() return vim.fn.getline('.') end
md.set = function(inp) vim.fn.setline('.', vim.split(inp, '\n')[1]) end

md.todo_on = function()
	md.set(str.ReplacePrefix("- [ ]", "- [x]", "- [x]", "- [ ]", "- ", "- [ ]")(md.get()))
end

md.todo_off = function()
	md.set(str.ReplacePrefix("- [ ]", "- ", "- [x]", "- ")(md.get()))
end

-- md
key.set('n', 'mt', md.todo_on)  -- toggle todo
key.set('n', 'md', md.todo_off) -- remove todo
-- key.set('n', 'a', "lua print('hi')")

-- key.abbrev('ab', 'hiiiii!!!')
-- key.abbrev('h', 'hiiiii!!!')
