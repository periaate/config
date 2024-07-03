
local keymap = vim.keymap.set

local function nrmap(mode, key, action, optss)
	local options = { noremap = true, silent = true }
	if optss then
		options = optss
	end
	keymap(mode, key, action, options)
end

local opts = {noremap = true}
local all = {'n', 'v', 'x', 'o'}
local almost = {'n', 'v', 'x'}

return {
	map = nrmap,
	opts = opts,
	all = all,
	almost = almost,
}
