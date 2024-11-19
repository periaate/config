-- on opening neovim, check if the current directory is in a git repo
-- check assigned directory for the session for this git repo (or use blob service like a chad)
-- if found, load the session
-- when closing neovim, always write current session to a file (or blob)
-- do this by remapping all ways to quit to include a synchronous session write
-- 
-- everytime `cd` is used to change directory, check if the current git repo is changed
-- if repo is changed, write current session to file/blob
-- load that git repos session from file/blob


local M = {}
M.root = "C:/blume/etc/nvim/"

function invoke(inp)
	local handle = io.popen(inp)
	local result = handle:read("*a")
	handle:close()
	return result
end

function M.clean(input)
	input = string.gsub(input, [[/]], "")
	input = string.gsub(input, [[:]], "")
	input = string.gsub(input, [[\]], "")
	input = string.gsub(input, "\n", "")
	input = string.gsub(input, "\r", "")
	input = string.gsub(input, "\t", "")
	return input
end

function M.get_repo()
	-- M.clean(invoke("git rev-parse --show-toplevel"))
	return M.clean(invoke("pwd"))
end

function M.as_sess()
	local res = M.get_repo()
	print(res)
	res = string.gsub(res, "\n", "")
	if res and res ~= "" then
		res = M.root .. res .. ".vim"
	end
	return res
end

function M.save_session(input)
	input = input or M.as_sess()
	if input and input ~= '' and input ~= ".vim" then
		local f = vim.fn.expand(input)
		vim.cmd('mksession! ' .. f)
		print('Session saved as: ' .. f)
		return true
	else
		print('Session creation canceled or invalid name given.')
	end
	return false
end

function M.exists(name)
	local f=io.open(name,"r")
	if f~=nil then io.close(f) return true else return false end
end

function M.load_session(input)
	input = input or M.as_sess()
	print(input)
	if input and input ~= '' and input ~= ".vim" then
		if not M.exists(input) then
			print('Session not found: ' .. input)
			return
		end

		-- local f = vim.fn.expand(input)
		vim.cmd(":source " .. input)
	end
end


return M
