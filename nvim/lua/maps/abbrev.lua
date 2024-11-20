local abbrev = {}
vim.cmd([[
function! Eatchar(pat)
let c = nr2char(getchar(0))
return (c =~ a:pat) ? '' : c
endfunction
]])

abbrev.r = "<right>"
abbrev.l = "<left>"
abbrev.clean = "<BS>"
abbrev.cmdmode = "<C-d>"
abbrev.cmd = "<enter>"
abbrev.eatchar = abbrev.cmdmode .. "=Eatchar('\\s')<CR>"
abbrev.esc = "<esc>"
abbrev.enter = "<enter>"

abbrev.BEG = '<esc><home>}{nn'
abbrev.END = '<esc><end>tt'

function abbrev.iabbrev(inp, str)
	if #inp <= 0 and #str <= 0 then return end
	vim.cmd("iabbrev " .. inp .. " " .. str)
end

function abbrev.isnip(inp, str) abbrev.iabbrev(inp, str .. abbrev.eatchar) end

function abbrev.repm(str)
	return abbrev.esc .. "v" .. abbrev.cmd .. [[s/\s*\zs.*\s*$/]] .. str .. "<cr>tt<end>"
end

function abbrev.delim(str)
	return abbrev.esc .. "v" .. abbrev.cmd .. [[s/\v\s*(\S*)\s*(\S*)\s*(\S*)\s*(\S*)/]] .. str .. "<cr>tt<end>"
end

function abbrev.last(cnt, str)
	return abbrev.esc .. "v" .. abbrev.cmd .. [[s/\v\s*\zs]] .. string.rep([[\s*(\S*)]], cnt) .. [[\s*$/]] .. str .. "<cr>tt<end>"
end

function abbrev.sub(from, to)
	return abbrev.esc .. "v" .. abbrev.cmd .. [[s/\v]] .. from .. "/" .. to .. "/g" .. "<cr>tt<end>"
end

local function bufgroup(ft, loadfunc)
	local group = vim.api.nvim_create_augroup(ft .. "group", { clear = true })

	vim.api.nvim_create_autocmd("BufEnter", {
		group = group,
		pattern = ft,
		callback = function()
			print("entering group" .. ft)
			-- loadfunc()
		end
	})

	vim.api.nvim_create_autocmd("BufLeave", {
		group = group,
		pattern = ft,
		callback = function()
			print("leaving group" .. ft)
			-- reloadBase()
		end
	})
end

local function reloadBase()
	vim.cmd(":abclear")

	abbrev.iabbrev("ret", "return")
	abbrev.isnip("newl", "<esc>rl")

	abbrev.iabbrev("lte", "<=")
	abbrev.iabbrev("gte", ">=")
	abbrev.iabbrev("lt", "<")
	abbrev.iabbrev("gt", ">")

	abbrev.iabbrev("iso", "== 0")
	abbrev.iabbrev("ino", "!= 0")
end

-- reloadBase()

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
        -- print filetype
        print(vim.bo.filetype)
    end
})

return abbrev
