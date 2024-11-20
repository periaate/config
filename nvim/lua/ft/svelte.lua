local key = require("lib.key")
local a = require("lib.abbrev")

return function()
	-- Use spaces instead of tabs
	vim.o.expandtab = true

	isnip("scr", "<script>" .. enter .. "</script>" .. BEG .. enter)
	isnip("stl", "<style>" .. enter .. "</style>" .. BEG .. enter)
end
