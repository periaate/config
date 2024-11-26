local key = require("lib.key")
local abbrev = {}
abbrev.def = function() end

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


local function reloadBase()
    vim.cmd(":abclear")
	key.clear()
	abbrev.def()
end

abbrev.fthooks = {}

function abbrev.recheck()
		reloadBase()
        local has = false
        if abbrev.fthooks[vim.bo.filetype] then has = true end

        if has then
            print("Running hooks for filetype: ", vim.bo.filetype)
            for _, func in ipairs(abbrev.fthooks[vim.bo.filetype]) do
				if type(func) == "function" then func() end
            end
        else 
            print("No hooks for filetype: ", vim.bo.filetype)
        end
end

function abbrev.ft(pat)
    if not pat then return end

    abbrev.fthooks[pat] = abbrev.fthooks[pat] or {}
    return function(func)
        table.insert(abbrev.fthooks[pat], func)
    end
end

function abbrev.set_default(base)
	if not base then error("Base function not provided") end
	if type(base) ~= "function" then error("Base function must be a function") end
	abbrev.def = base
end
--
-- abbrev.ft("lua")(function()
--     vim.o.expandtab = false
--     abbrev.iabbrev("af", "function")
-- end)




vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
		abbrev.recheck()
    end
})

return abbrev
