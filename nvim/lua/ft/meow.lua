local std = require("lib.std")
local get = std.get
local str = require("lib.str")

return function()
	if str.HasSuffix(".meow")(get.path()) then
		vim.cmd(":setfiletype markdown")
	end
end
