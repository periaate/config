
local keymap = vim.keymap.set

local function nrmap(mode, key, action, optss)
	local options = { noremap = true, silent = true }
	if optss then
		options = optss
	end
	vim.keymap.set(mode, key, action, options)
end

local opts   = { noremap = true }
local all    = { 'n', 'v', 'x', 'o' }
local almost = { 'n', 'v', 'x' }

local key  = {
	set    = nrmap,
	del    = vim.keymap.del,
	opts   = opts,
	all    = function(a, b, c) nrmap(modes, a, b, c) end,
	n      = function(a, b, c) nrmap('n', a, b, c) end,
	o      = function(a, b, c) nrmap('o', a, b, c) end,
	v      = function(a, b, c) nrmap('v', a, b, c) end,
	x      = function(a, b, c) nrmap('x', a, b, c) end,
	i      = function(a, b, c) nrmap('i', a, b, c) end,
	modes  = { 'n', 'v', 'x', 'o' },
	almost = almost,
}

return key
