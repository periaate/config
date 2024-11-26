local key = require("lib.key")
local edit = require("lib.std").edit
local get = require("lib.std").get
local a = require("lib.abbrev")

local b = [[
prl


$ ??
$
if err != nil {
	.
}




$ ecerr
clog.Error($, "err", err) .

$ ecinf
clog.Info($) .


(_) $ alo
(_, "$", $) .


$ $ ener
er.Net($, $) .


$ _ apn
_ := $ .


$ _ ape
_ = $ .

$ _ aer
_, err := $ .


$ gem
gen.Must($) .


$ com _
// call function `_` with `$` as its argument(s) _($)
// can be any
// access to any lua functionality


]]


return function()
	-- if file is empty, add package definition
	-- if filename is `main`, use `package main` instead
	vim.o.expandtab = false
	key.set('n', 'gop', function() edit.paste("package " .. get.base(), false) end)

	key.set('n', 'k', 'mk')
    
	a.iabbrev("len", a.last(1, [[len(\1)]]))

	a.isnip("iff", a.clean .. a.repm([[if \0]]) .. " {" .. a.enter)


	a.isnip("sw", "switch {<enter>case:<enter>default:<esc>ua:nn")
	a.isnip("swi", "switch{<enter><esc>u<end>nn")

	a.isnip("pl", a.clean .. a.sub([["]], [[\\"]]) .. a.repm([[fmt.Println("\0")]]))


	a.isnip("ecef", a.clean .. a.repm([[clog.Fatal("\0", "err", err)]]))
	a.isnip("ecfat", a.clean .. a.repm([[clog.Fatal("\0")]]))
	a.isnip("ecinf", a.clean .. a.repm([[clog.Info("\0")]]))
	a.isnip("ecerr", a.clean .. a.repm([[clog.Error("\0", "err", err)]]))
	a.isnip("ecdeb", a.clean .. a.repm([[clog.Debug("\0")]]))


	a.isnip('testfn', 'func Test(t *testing.T) {<enter><esc><up><home>o(nn')

	a.isnip("ien", "if err != nil {<enter>")
    a.isnip("iert", "if err != nil {<enter>return<esc>ele")
	a.iabbrev("nnil", "!= nil")

	a.isnip("forr", a.clean .. a.repm([[for range \0]]) .. " {" .. a.enter)
	a.isnip("fori", a.clean .. a.repm([[for i := range \0]]) .. " {" .. a.enter)
	a.isnip("fork", a.clean .. a.repm([[for k := range \0]]) .. " {" .. a.enter)
	a.isnip("forv", a.clean .. a.repm([[for _, v := range \0]]) .. " {" .. a.enter)
	a.isnip("forb", a.clean .. a.repm([[for i, v := range \0]]) .. " {" .. a.enter)
	a.isnip("forkv", a.clean .. a.repm([[for k, v := range \0]]) .. " {" .. a.enter)
	
	a.isnip("aend", a.clean .. a.last(2, [[\1 = append(\1, \2)]]))

	a.isnip("prl", a.clean .. a.repm([[fmt.Println("\0")]]))

	a.isnip("h400", "w.WriteHeader(http.StatusBadRequest)")
	a.isnip("h401", "w.WriteHeader(http.StatusUnauthorized)")
	a.isnip("h404", "w.WriteHeader(http.StatusNotFound)")
	a.isnip("h500", "w.WriteHeader(http.StatusInternalServerError)")

	a.isnip("hh", [[w http.ResponseWriter, r *http.Request]])

    a.iabbrev("iso", "== 0")
    a.iabbrev("ino", "!= 0")

    a.iabbrev("ret", "return")
end
