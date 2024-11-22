local key = require("lib.key")
local a = require("lib.abbrev")

return function()
	-- Use spaces instead of tabs
	vim.o.expandtab = true

	a.isnip("scr", "<script>" .. a.enter .. "</script>" .. a.BEG .. a.enter)
	a.isnip("stl", "<style>" .. a.enter .. "</style>" .. a.BEG .. a.enter)
end
