require("setup.options")
require("core.lazy")
require("setup.load")

if #vim.fn.argv() == 0 then
	require("lib.sessions").load_session()
end

require("maps.basic")
require("maps.abbrev")

-- require("ft.go")
-- require("ft.md")
-- require("ft.lua")

require("lib.buf").setup()

