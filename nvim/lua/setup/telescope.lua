-- Load Telescope
local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- Function to fetch mappings
local function get_mappings()
	local mappings = vim.api.nvim_exec("map", true)
	local result = {}
	for line in mappings:gmatch("[^\r\n]+") do
		table.insert(result, line)
	end
	return result
end


local keymap = vim.keymap.set

keymap('n', '<leader>fm', function()
	local opts = {}
	pickers.new(opts, {
		prompt_title = 'Mappings',
		finder = finders.new_table {
			results = get_mappings(),
		},
		sorter = sorters.get_generic_fuzzy_sorter(),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				print("Selected mapping: " .. selection[1])
			end)
			return true
		end,
	}):find()
end)


