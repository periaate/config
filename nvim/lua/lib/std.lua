local str = {}

function str.split(input, sep)
	local result = {}

	-- Handle the case where sep is an empty string
	if sep == "" then
		for i = 1, #input do
			table.insert(result, input:sub(i, i))
		end
		return result
	end

	local pattern = "(.-)" .. sep
	local last_end = 1
	local s, e, cap = input:find(pattern, 1)

	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(result, cap)
		end
		last_end = e + 1
		s, e, cap = input:find(pattern, last_end)
	end

	if last_end <= #input then
		table.insert(result, input:sub(last_end))
	end

	return result
end

function str.modify_word()
	local chars = ""
	for i = 1, 2 do
		local char = vim.fn.getcharstr()
		chars = chars .. char
		if char == vim.api.nvim_replace_termcodes("<ESC>", true, true, true) then
			return
		end
	end

	local word = vim.fn.expand("<cword>")
	local new_word = str.split(chars, "")[1] .. word .. str.split(chars, "")[2]
	vim.api.nvim_command('normal! ciw' .. new_word)
end

function str.nthSplit(str, sep, n)
	local t = {}
	local i = 1
	local escaped_sep = string.gsub(sep, "([^%w])", "%%%1")

	for s in string.gmatch(str, "([^" .. escaped_sep .. "]+)") do
		if i == n then
			return s
		end

		table.insert(t, s)
		i = i + 1
	end

	if n > #t then return '' end
	return t[#t + n + 1]
end


local get = {
	word = function()
		return vim.fn.expand('<cword>')
	end,
	name = function(with_ext)
		if with_ext == false then
			return vim.fn.expand('%:t:r')
		end
		return vim.fn.expand('%:t')
	end,
	path = function()
		return vim.fn.expand('%:p')
	end,
	base = function()
		path = vim.fn.expand('%:p')
		name = vim.fn.expand('%:t')
		path = string.gsub(path, "\\", "/")
		res = string.sub(path, 1, #path - #name)
		return str.nthSplit(res, '/', -1)
	end,
	position = function()
		local pos = vim.api.nvim_win_get_cursor(0)
		return { row = pos[1], col = pos[2] }
	end,
	file = function()
		return vim.fn.expand('%')
	end
}

local edit = {}

function edit.paste(val, before_cursor)
	if before_cursor then
		vim.cmd('normal! i' .. val)
	else
		vim.cmd('normal! a' .. val)
	end
end

edit.setl = vim.api.nvim_set_current_line
edit.getl = vim.api.nvim_get_current_line

function edit.swap(fn)
	return function()
		edit.setl(fn(edit.getl()))
	end
end



return {
	edit = edit,
	str = str,
	get = get,
}
