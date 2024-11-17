local key = require("lib.key")

local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values


-- Custom zoxide picker
key.set('n', key.leader .. 'cd', function()
	-- Run zoxide query -ls and get the output
	local zoxide_output = vim.fn.systemlist('gs zoxide query -l | grep "C:" | grep -v work')

	-- Create the picker
	pickers.new({}, {
		prompt_title = 'Zoxide',
		finder = finders.new_table {
			results = zoxide_output,
		},
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = require('telescope.actions.state').get_selected_entry()
				print(selection[1])
				vim.cmd("Oil ".. selection[1])
			end)
			return true
		end,
	}):find()
end)

