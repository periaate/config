local key = require("lib.key")
local str = require("lib.str")

local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local conf = require('telescope.config').values
local T = require('core.utils').IsTruthy

local sessions = require("lib.sessions")

-- Custom zoxide picker
return function()
	-- Run zoxide query -ls and get the output
	local zoxide_output = vim.fn.systemlist('zoxide query -l')

	for i, v in ipairs(zoxide_output) do
		zoxide_output[i] = str.ReplacePrefix("/home/periaate", "~")(v)
	end

	-- Create the picker
	pickers.new({}, {
		prompt_title = 'Zoxide',
		finder = finders.new_table {
			results = zoxide_output,
		},
		sorter = sorters.get_generic_fuzzy_sorter(),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = require('telescope.actions.state').get_selected_entry()
				sessions.change_session(selection[1])
			end)
			return true
		end,
	}):find()
end
