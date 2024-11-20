

function go()
	vim.o.expandtab = false
	local lermsg = 'clog.Error("", "err", err)'

    iabbrev("len", esc .. " xWnnlen()<BS>" .. esc .. " iWtt)") -- broken

	isnip("iff", clean .. repm([[if \0]]) .. " {" .. enter)

	isnip("lerr", lermsg .. string.rep(l, #'", "err", err)'))

	isnip("sw", "switch {<enter>case:<enter>default:<esc>ua:nn")
	isnip("swi", "switch{<enter><esc>u<end>nn")

	isnip("pl", clean .. sub([["]], [[\\"]]) .. repm([[fmt.Println("\0")]]))

	iabbrev("nnil", "!= nil")
	
    iabbrev("iert", "if err != nil {<enter>return<esc>ele")

	isnip("lert", "if err != nil {<enter>" .. lermsg .. "<enter>return<esc>ele<enter>")

	isnip("ecfat", clean .. BEG .. 'clog.Fatal("' .. END .. '")')
	isnip("ecef", clean .. BEG .. 'clog.Fatal("' .. END .. '", "err", err)')
	isnip("ecinf", clean .. BEG .. 'clog.Info("' .. END .. '")')
	isnip("ecerr", clean .. BEG .. 'clog.Error("' .. END .. '", "err", err)')
	isnip("ecdeb", clean .. BEG .. 'clog.Debug("' .. END .. '")')

	isnip('testfn', 'func Test(t *testing.T) {<enter><esc><up><home>o(nn')

	isnip("ien", "if err != nil {<enter>")

	isnip("forr", clean .. repm([[for range \0]]) .. " {" .. enter)
	isnip("fori", clean .. repm([[for i := range \0]]) .. " {" .. enter)
	isnip("fork", clean .. repm([[for k := range \0]]) .. " {" .. enter)
	isnip("forv", clean .. repm([[for _, v := range \0]]) .. " {" .. enter)
	isnip("forb", clean .. repm([[for i, v := range \0]]) .. " {" .. enter)
	isnip("forkv", clean .. repm([[for k, v := range \0]]) .. " {" .. enter)
	
	-- isnip("aend", clean .. last(2, [[\1 = append(\1, \2)]]))

	isnip("prl", clean .. last(1, [[fmt.Println(\1)]]))

	isnip("h400", "w.WriteHeader(http.StatusBadRequest)")
	isnip("h401", "w.WriteHeader(http.StatusUnauthorized)")
	isnip("h404", "w.WriteHeader(http.StatusNotFound)")
	isnip("h500", "w.WriteHeader(http.StatusInternalServerError)")
end


local function lua()
	vim.o.expandtab = false
	iabbrev("af", "function")
	iabbrev("al", "local")

	iabbrev("alf", "local function")
	isnip("alam", "local function()" .. enter .. "end" .. esc .. "u" .. END .. enter)

	iabbrev("aend", clean .. enter .. "end" .. esc .. "u" .. END)
end

local function svelte()
	-- Use spaces instead of tabs
	vim.o.expandtab = true

	isnip("scr", "<script>" .. enter .. "</script>" .. BEG .. enter)
	isnip("stl", "<style>" .. enter .. "</style>" .. BEG .. enter)
end



-- bufgroup("*.css", css)
-- bufgroup("*.go", go)
-- bufgroup("*.lua", lua)
bufgroup("*.txt", nul)
bufgroup("*.svelte", svelte)
-- bufgroup("*.md", function() vim.o.expandtab = false end)


