local key = require("lib.key")
local edit = require("lib.std").edit
local get = require("lib.std").get
local a = require("lib.abbrev")


return function()
	vim.o.expandtab = false
	key.set('n', 'gop', function() edit.paste("package " .. get.base(), false) end)

	local lermsg = 'clog.Error("", "err", err)'

    a.iabbrev("len", a.esc .. " xWnnlen()<BS>" .. a.esc .. " iWtt)") -- broken

	a.isnip("iff", a.clean .. a.repm([[if \0]]) .. " {" .. a.enter)

	-- a.isnip("lerr", lermsg .. l:rep(#'", "err", err)'))

	a.isnip("sw", "switch {<enter>case:<enter>default:<esc>ua:nn")
	a.isnip("swi", "switch{<enter><esc>u<end>nn")

	a.isnip("pl", a.clean .. a.sub([["]], [[\\"]]) .. a.repm([[fmt.Println("\0")]]))

	a.iabbrev("nnil", "!= nil")
	
    a.iabbrev("iert", "if err != nil {<enter>return<esc>ele")

	a.isnip("lert", "if err != nil {<enter>" .. lermsg .. "<enter>return<esc>ele<enter>")

	a.isnip("ecfat", a.clean .. a.BEG .. 'clog.Fatal("' .. a.END .. '")')
	a.isnip("ecef", a.clean .. a.BEG .. 'clog.Fatal("' .. a.END .. '", "err", err)')
	a.isnip("ecinf", a.clean .. a.BEG .. 'clog.Info("' .. a.END .. '")')
	a.isnip("ecerr", a.clean .. a.BEG .. 'clog.Error("' .. a.END .. '", "err", err)')
	a.isnip("ecdeb", a.clean .. a.BEG .. 'clog.Debug("' .. a.END .. '")')

	a.isnip('testfn', 'func Test(t *testing.T) {<enter><esc><up><home>o(nn')

	a.isnip("ien", "if err != nil {<enter>")

	a.isnip("forr", a.clean .. a.repm([[for range \0]]) .. " {" .. a.enter)
	a.isnip("fori", a.clean .. a.repm([[for i := range \0]]) .. " {" .. a.enter)
	a.isnip("fork", a.clean .. a.repm([[for k := range \0]]) .. " {" .. a.enter)
	a.isnip("forv", a.clean .. a.repm([[for _, v := range \0]]) .. " {" .. a.enter)
	a.isnip("forb", a.clean .. a.repm([[for i, v := range \0]]) .. " {" .. a.enter)
	a.isnip("forkv", a.clean .. a.repm([[for k, v := range \0]]) .. " {" .. a.enter)
	
	-- a.isnip("aend", a.clean .. a.last(2, [[\1 = append(\1, \2)]]))

	a.isnip("prl", a.clean .. a.last(1, [[fmt.Println(\1)]]))

	a.isnip("h400", "w.WriteHeader(http.StatusBadRequest)")
	a.isnip("h401", "w.WriteHeader(http.StatusUnauthorized)")
	a.isnip("h404", "w.WriteHeader(http.StatusNotFound)")
	a.isnip("h500", "w.WriteHeader(http.StatusInternalServerError)")
end
