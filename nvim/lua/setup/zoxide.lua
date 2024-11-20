local key = require("lib.key")

local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local conf = require('telescope.config').values

local sessions = require("lib.sessions")


-- Function to close all buffers without exiting Neovim
local function close_all_buffers()
	-- Get a list of all buffers
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		-- Only close listed, loaded buffers
		vim.api.nvim_buf_delete(buf, { force = true })
	end
end


-- Custom zoxide picker
key.set('n', 'cd', function()
	-- Run zoxide query -ls and get the output
	local zoxide_output = vim.fn.systemlist('gs zoxide query -l | str projects blume C:\\')

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

				sessions.save_session()
				vim.cmd("cd ".. selection[1])
				close_all_buffers()

				if sessions.exists() then
					sessions.load_session()
				else
					vim.cmd("Oil ".. selection[1])
				end
			end)
			return true
		end,
	}):find()
end)

