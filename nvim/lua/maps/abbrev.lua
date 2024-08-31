
vim.cmd([[
function! Eatchar(pat)
let c = nr2char(getchar(0))
return (c =~ a:pat) ? '' : c
endfunction
]])

local r = "<right>"
local l = "<left>"
local clean = "<BS>"
local cmdmode = "<C-d>"
local cmd = "<enter>"
local eatchar = cmdmode .. "=Eatchar('\\s')<CR>"
local esc = "<esc>"
local enter = "<enter>"

local BEG = '<esc><home>}{nn'
local END = '<esc><end>tt'

local function iabbrev(inp, str)
	if #inp <= 0 and #str <= 0 then
		return
	end

	vim.cmd("iabbrev " .. inp .. " " .. str)
end

local function isnip(inp, str)
	if #inp <= 0 and #str <= 0 then
		return
	end

	vim.cmd("iabbrev " .. inp .. " " .. str .. eatchar)
end

local function repm(str)
	return esc .. "v" .. cmd .. [[s/\s*\zs.*\s*$/]] .. str .. "<cr>tt<end>"
end

local function delim(str)
	return esc .. "v" .. cmd .. [[s/\v\s*(\S*)\s*(\S*)\s*(\S*)\s*(\S*)/]] .. str .. "<cr>tt<end>"
end

local function last(cnt, str)
	return esc .. "v" .. cmd .. [[s/\v\s*\zs]] .. string.rep([[\s*(\S*)]], cnt) .. [[\s*$/]] .. str .. "<cr>tt<end>"
end

local function sub(from, to)
	return esc .. "v" .. cmd .. [[s/\v]] .. from .. "/" .. to .. "/g" .. "<cr>tt<end>"
end


local function reloadBase()
	vim.cmd(":abclear")

	iabbrev("ret", "return")
	isnip("newl", "<esc>rl")

	iabbrev("lte", "<=")
	iabbrev("gte", ">=")
	iabbrev("lt", "<")
	iabbrev("gt", ">")

	iabbrev("iso", "== 0")
	iabbrev("ino", "!= 0")
end




reloadBase()

function css() 
	isnip("def", clean .. esc .. "<home>}tt:<end>;")
end

function go()
	local lermsg = 'clog.Error("", "err", err)'
	iabbrev("len", esc .. " xWnnlen()<BS>" .. esc .. " iWtt)")

	isnip("iff", clean .. repm([[if \0]]) .. " {" .. enter)

	isnip("lerr", lermsg .. string.rep(l, #'", "err", err)'))

	isnip("sw", "switch {<enter>case:<enter>default:<esc>ua:nn")
	isnip("swi", "switch{<enter><esc>u<end>nn")

	isnip("pl", clean .. sub([["]], [[\\"]]) .. repm([[fmt.Println("\0")]]))


	iabbrev("nnil", "!= nil")

	iabbrev("iert", "if err != nil {<enter>return<esc>ele")

	isnip("lert", "if err != nil {<enter>" .. lermsg .. "<enter>return<esc>ele<enter>")

	isnip("ecfat", clean .. BEG .. 'clog.Fatal("' .. END .. '")')
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

	iabbrev("rer", "(err error)")
	iabbrev("rea", last(1, [[(res \1, err error)]]))
	isnip("con", "continue")
	isnip("brk", "break")


	isnip("eri", clean .. [[err = fmt.Errorf("]])

	isnip("tob", clean .. repm[[type \0 struct]] .. " {" .. enter)
	isnip("tif", clean .. repm[[type \0 interface]] .. " {" .. enter)

	iabbrev("met", "<esc><home>}{c<delete><home>nnfunc ()<bs> <esc>{w}}tt)<end>{<enter>")

	iabbrev("rete", "<esc>{nn()<bs>res <esc>}tt, err error)")

	iabbrev("afn", "<esc>{ <bs>*<home>nnfunc <esc>o nn()<bs><esc>w<esc>2o nn)<end>{<enter>")

	iabbrev("okmap", "<bs>]<esc>{nn<bs>[]<bs><esc>{nnif ok, val := <end>; ok {<enter>")
	iabbrev("okm", "<bs>]<esc>{nn<bs>[]<bs><esc>{nnif ok, _ := <end>; ok {<enter>")

	iabbrev("ise", clean .. ", err :=")

	isnip("aend", clean .. last(2, [[\1 = append(\1, \2)]]))

	isnip("prl", clean .. last(1, [[fmt.Println(\1)]]))

	isnip("pint", clean .. repm([[num, err := strconv.Atoi(\0)]]) .. enter .. "if err != nil {" .. enter)


	-- stdlib
	-- http.HandlerFunc def
	-- json?
	-- os file opretaions
	-- more logging ops
	-- strings
	-- bytes
	-- buffers
	-- readers and writers
	-- make, make with len, make with cap
	-- working with channels
	-- http response codes, headers, etc.
	-- 
	

end


local function lua()
	iabbrev("af", "function")
	iabbrev("al", "local")

	iabbrev("alf", "local function")
	iabbrev("alam", "local function()" .. enter .. "end" .. esc .. "u" .. END .. enter .. eatchar)

	iabbrev("aend", clean .. enter .. "end" .. esc .. "u" .. END)
end


local buff = {
	groups = {}
}


local function bufgroup(ft, loadfunc)
	local group = vim.api.nvim_create_augroup(ft .. "group", { clear = true })

	vim.api.nvim_create_autocmd("BufEnter", {
		group = group,
		pattern = ft,
		callback = function()
			print("entering group" .. ft)
			loadfunc()
		end
	})

	vim.api.nvim_create_autocmd("BufLeave", {
		group = group,
		pattern = ft,
		callback = function()
			print("leaving group" .. ft)
			reloadBase()
		end
	})
end

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
        -- local buf = args.buf
        -- local filetype = vim.bo[buf].filetype
		print("hi hey hello")
    end
})

local function nul() end

bufgroup("*.css", css)
bufgroup("*.go", go)
bufgroup("*.lua", lua)
bufgroup("*.txt", nul)






