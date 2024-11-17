local key = require('lib.key')
local fthook = require('lib.fthook')


local buf = {}
buf.defaults = {
	opts = {},
}
buf.groups = {}
buf.setters = {}
buf._registered_patterns = {}

-- Function to set default key mappings
function buf.set(mode, lhs, rhs, opts)
	opts = opts or buf.defaults.opts or {}
	if not buf.defaults.keymaps then
		buf.defaults.keymaps = {}
	end
	if not buf.defaults.keymaps[mode] then
		buf.defaults.keymaps[mode] = {}
	end
	buf.defaults.keymaps[mode][lhs] = { rhs = rhs, opts = opts }
	-- Set the global mapping
	key.set(mode, lhs, rhs, opts)
end

-- Function to set default abbreviations
function buf.abbrev(lhs, rhs)
	if not buf.defaults.abbrevs then
		buf.defaults.abbrevs = {}
	end
	buf.defaults.abbrevs[lhs] = rhs
	-- Set the abbreviation
	-- vim.cmd('iabbrev ' .. lhs .. ' ' .. rhs)
end

function buf.reload_abbrev()
	vim.cmd(":abclear")
	for lhs, rhs in pairs(buf.defaults.abbrevs) do
		vim.cmd('iabbrev ' .. lhs .. ' ' .. rhs)
	end
end

-- Function to create a setter for a pattern
function buf.setter(pattern, ft)
	if buf.setters[pattern] then
		return buf.setters[pattern]
	end

	local setter = {}
	setter.pattern = pattern
	setter.keymaps = {}
	setter.abbrevs = {}
	setter.groups = {}
	setter.is_ft = ft or false

	function setter.set(mode, lhs, rhs, opts)
		opts = opts or buf.defaults.map_opts or {}
		if not setter.keymaps[mode] then
			setter.keymaps[mode] = {}
		end
		setter.keymaps[mode][lhs] = { rhs = rhs, opts = opts }
	end

	function setter.abbrev(lhs, rhs)
		setter.abbrevs[lhs] = rhs
	end

	function setter.join(groupName)
		buf.groups[groupName] = buf.groups[groupName] or {}
		if not vim.tbl_contains(buf.groups[groupName], pattern) then
			table.insert(buf.groups[groupName], pattern)
		end
		setter.groups[groupName] = true
	end

	buf.setters[pattern] = setter
	return setter
end

-- Function to setup the autocmds and mappings
function buf.setup()
	-- For each registered pattern, create autocmds
	for pattern, setter in pairs(buf.setters) do
		local group_name = 'buf_autocmd_' .. pattern
		local group = vim.api.nvim_create_augroup(group_name, { clear = true })

		local load = function()
			local bufnr = vim.api.nvim_get_current_buf()
			-- Set pattern-specific keymaps as buffer-local
			for mode, mappings in pairs(setter.keymaps) do
				for lhs, map in pairs(mappings) do
					map.opts = map.opts or {}
					map.opts.buffer = bufnr
					key.set(mode, lhs, map.rhs, map.opts)
				end
			end

				-- Set pattern-specific abbreviations
			for lhs, rhs in pairs(setter.abbrevs) do
				vim.cmd('iabbrev ' .. lhs .. ' ' .. rhs)
			end
		end

		local unload = function()
			print('unloading')
			-- Unset pattern-specific abbreviations
			for lhs, _ in pairs(setter.abbrevs) do
				vim.cmd('una ' .. lhs)
			end
		end

		if setter.is_ft then
			fthook.register(setter.pattern, load, unload)
			return
		end

		-- BufEnter
		vim.api.nvim_create_autocmd("BufEnter", {
			group = group,
			pattern = pattern,
			callback = load,
		})

		-- BufLeave
		vim.api.nvim_create_autocmd("BufLeave", {
			group = group,
			pattern = pattern,
			callback = unload,
		})


	end
end

return buf
