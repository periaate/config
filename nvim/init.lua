require("setup.options")
require("core.lazy")
require("setup.load")

require("ft.maps").setup()

if #vim.fn.argv() == 0 then
	require("lib.sessions").load_session()
end

vim.cmd([[1TermExec cmd="" open=0]])

require("lib.abbrev").recheck()