function split(input, sep)
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


local function modify_word()
	local chars = ""
	for i = 1, 2 do
		local char = vim.fn.getcharstr()
		chars = chars .. char
		if char == vim.api.nvim_replace_termcodes("<ESC>", true, true, true) then
			return
		end
	end

	local word = vim.fn.expand("<cword>")
	local new_word = split(chars, "")[1] .. word .. split(chars, "")[2]
	vim.api.nvim_command('normal! ciw' .. new_word)
end



local str = {
	nthSplit = function(str, sep, n)
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

		-- n is negative or overflows the length of the table
		if n > #t then return '' end
		return t[#t + n + 1]
	end,
	split = split,
	modify_word = modify_word,
}



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

local edit = {
	paste = function(val, before_cursor)
		if before_cursor then
			vim.cmd('normal! i' .. val)
		else
			vim.cmd('normal! a' .. val)
		end
	end,
}



return {
	edit = edit,
	str = str,
	get = get,
}