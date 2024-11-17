local M = {}

--scans the specified directory while ignoring any file matching the ignore pattern.
--returns a table containing the contents of the directory
---@param directory string
---@param ignore? string this is optional
---@return table
M.scandir = function(directory, ignore)
	local i, t = 0, {}
	ignore = ignore or ""
	local pfile = io.popen("ls " .. directory .. " --ignore=" .. ignore)
	for filename in pfile:lines() do
		i = i + 1
		t[i] = filename
	end
	pfile:close()
	return t
end



M.IsTruthy = function(v)
	if v == nil then return false end
	if v == false then return false end
	if v == 0 then return false end
	if v == "" then return false end
	if v == {} then return false end
	return true
end

M.Or = function(a, b) 
	if not M.IsTruthy(b) then b = "" end
	if M.IsTruthy(a) == false then return b end
	return a
end

-- local keymaps = vim.api.nvim_get_keymap("n")
--
-- -- Iterate through and print each key mapping
-- for _, k in ipairs(keymaps) do
-- 	print("lhs: " .. M.Or(k.lhs) .. " -> rhs: " .. M.Or(k.rhs))
-- end
--



return M
