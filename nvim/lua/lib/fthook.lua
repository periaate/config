-- lib.sessions breaks lib.fthook upon loading a session
local fthook = {}

-- Table to store registered hooks
fthook.load = {}
fthook.unload = {}
fthook.last = ""

-- Register a hook for a specific filetype
function fthook.register(filetype, load, unload)
	unload = unload or function() print("default unload fn") end
	if not filetype or type(load) ~= "function" or type(unload) ~= "function" then
		vim.api.nvim_err_writeln("Invalid arguments for fthook.register")
		return
	end

	fthook.load[filetype] = fthook.load[filetype] or {}
	table.insert(fthook.load[filetype], load)

	fthook.unload[filetype] = fthook.unload[filetype] or {}
	table.insert(fthook.unload[filetype], unload)
end

vim.api.nvim_create_autocmd("BufEnter", {
	group = group,
	callback = function()
		local filetype = vim.bo.filetype
		local unload = fthook.unload[fthook.last]
		if unload then
			-- print('unloading', filetype)
			for _, callback in ipairs(unload) do
				pcall(callback) -- Use pcall to avoid crashing if a callback errors
			end
		end
	end
})


-- Trigger hooks for a filetype
function fthook.trigger(filetype)
	local load = fthook.load[filetype]
	if load then
		-- print("triggering", filetype)
		fthook.last = filetype
		for _, callback in ipairs(load) do
			pcall(callback) -- Use pcall to avoid crashing if a callback errors
		end
	end
end

-- Set up the autocommand for FileType
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local filetype = args.match
		fthook.trigger(filetype)
	end,
})

return fthook
