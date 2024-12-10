local key = require("lib.key")
local str = require("lib.str")

local inp = vim.fn.getline('.')
-- inp = string.gsub(inp, "%a", "- [ ] %0", 1)

function on(inp) return string.gsub(inp, "%a", "- [ ] %0", 1) end
function tog(inp)
	if string.match(inp, "- %[ %]") then
		return string.gsub(inp, "- %[ %] ", "- [x] ", 1)
	end
	if string.match(inp, "- %[x%]") then
		return string.gsub(inp, "- %[x%] ", "- [ ] ", 1)
	end
	return on(inp)
end

inp = tog(inp)

vim.fn.setline('.', vim.split(inp, '\n')[1])




local a = [[
- [ ] abc
	 - [ ] cde



]]
