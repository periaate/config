local file_window = require("maps.windows")

function open_path(path) vim.cmd("e " .. path) end
function clean(str) return str:gsub("\n", "") end

function td(v)
	v = v or ""
	v = vim.fn.system("td " .. v .. "d")
	v = clean(v)
	return v
end

return {
	daily = function()
		local fp = "C:/Users/Daniel/notes/daily/" .. td() .. ".md"
		vim.fn.system("touch " .. fp)
		file_window(fp)
	end,
	todo = function()
		local fp = "C:/Users/Daniel/notes/todo/" .. td() .. ".md"
		vim.fn.system("touch " .. fp)
		file_window(fp)
	end,
}
