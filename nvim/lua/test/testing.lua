local key = require("lib.key")
local str = require("lib.str")

local edit = require("lib.std").edit

key.set("ia", "hee", function()
	print("hello world!!! :3")
	vim.api.nvim_input("<BS>")
end)

function snip(fn)
	return function()
		fn()
		vim.api.nvim_input("<BS>")
	end
end

function patswap(pat, rep)
	return snip(edit.swap(str.gsub(pat, rep)))
end

key.set("ia", "alo", patswap([[%)(.*) $]], [[,%1)]]))

local a = [[func Meow(hello string) world int ]]
print(str.gsub([[%)(.*) $]], [[,%1)]])(a))

-- func Meow(hello string) world int 
