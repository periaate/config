local a = require("lib.fthooks")
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

local md = {}

md.get = function() return vim.fn.getline('.') end
md.set = function(inp) vim.fn.setline('.', vim.split(inp, '\n')[1]) end

function on(inp)
	if string.match(inp, "- %[ %]") then
		return string.gsub(inp, "- %[ %] ", "- [x] ", 1)
	end
	if string.match(inp, "- %[x%]") then
		return string.gsub(inp, "- %[x%] ", "- [ ] ", 1)
	end
	return string.gsub(inp, "%S", "- [ ] %0", 1)
end
function off(inp) return string.gsub(inp, "- %[.%] ", "", 1) end

function md.todo_on() md.set(on(vim.fn.getline('.'))) end
function md.todo_off() md.set(off(vim.fn.getline('.'))) end

return function()
	vim.o.expandtab = false
	vim.o.tabstop = 4

	key.set('n', '#', line_hof(function(line)
		local lead = line:match("^#*%s*")
		if #lead ~= 0 then
			return line:sub(#lead + 1)
		end
		return '# ' .. line
	end), key.opts)

	key.set('n', 'mt', md.todo_on)  -- toggle todo
	key.set('n', 'md', md.todo_off) -- remove todo
end
