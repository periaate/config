vim.g.mapleader = " "

-- Use spaces instead of tabs
vim.o.expandtab = false
vim.opt.number = true -- line number
vim.opt.relativenumber = true
vim.opt.mouse = "a" -- Enable mouse
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 20 -- Keep minimum x number of screen lines above and below the cursor
vim.opt.swapfile = false
vim.opt.hlsearch = false -- Highlight search results
vim.opt.incsearch = true -- As you type, match the currently typed word w/o pressing enter
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

require("autocmd")
require("core.lazy")
require("zenburn").setup()

local git_ignored = setmetatable({}, {
	__index = function(self, key)
		local proc = vim.system(
		{ "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
		{
			cwd = key,
			text = true,
		}
		)
		local result = proc:wait()
		local ret = {}
		if result.code == 0 then
			for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
				-- Remove trailing slash
				line = line:gsub("/$", "")
				table.insert(ret, line)
			end
		end

		rawset(self, key, ret)
		return ret
	end,
})

require("oil").setup({
	default_file_explorer = true,
	columns = {
		"icon",
	},
	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	},
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = true,
	cleanup_delay_ms = 2000,
	lsp_file_methods = {
		timeout_ms = 1000,
		autosave_changes = false,
	},
	constrain_cursor = "editable",
	-- Set to true to watch the filesystem for changes and reload oil
	experimental_watch_for_changes = false,
	keymaps = {
		["<C-s>"] = ":w<CR>",
	},
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = false,
		is_hidden_file = function(name, _)
			-- dotfiles are always considered hidden
			if vim.startswith(name, ".") then
				return true
			end
			local dir = require("oil").get_current_dir()
			-- if no local directory (e.g. for ssh connections), always show
			if not dir then
				return false
			end
			-- Check if file is gitignored
			return vim.list_contains(git_ignored[dir], name)
		end,
	},
})



vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		signature = { enabled = false },
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			-- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

-- stylua: ignore
local colors = {
	black  = '',
	white  = '#c6c6c6',
	grey   = '#303030',
}

local theme = {
	normal = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},

	insert = { a = { fg = colors.white, bg = colors.black} },
	visual = { a = { fg = colors.white, bg = colors.black } },
	replace = { a = { fg = colors.white, bg = colors.black } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = theme,
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		component_separators = '',
		section_separators = { left = '', right = '' },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {},
		lualine_c = {
			{
				require("noice").api.status.command.get,
				cond = require("noice").api.status.command.has,
			},
			{
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
			},
			{
				require("noice").api.status.search.get,
				cond = require("noice").api.status.search.has,
			},
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})

vim.cmd([[:setlocal spell spelllang=en_us]])




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

-- Custom Telescope picker for mappings 








local keymap = vim.keymap.set
local ts_utils = require("nvim-treesitter.ts_utils")

local function get_node_at_cursor()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local root = ts_utils.get_root_for_position(cursor[1] - 1, cursor[2], bufnr)
	if not root then return end
	return root:named_descendant_for_range(cursor[1] - 1, cursor[2], cursor[1] - 1, cursor[2])
end



keymap('n', '<leader>ni', function(node_type)
	local node = get_node_at_cursor()
	while node do
		node = node:prev_named_sibling()
		if node and node:type() == node_type then
			local start_row, start_col, _, _ = node:range()
			vim.api.nvim_win_set_cursor(0, {start_row + 1, start_col})
			return
		end
	end
end, {noremap = true, silent = true})

keymap('n', '<leader>pi', function(node_type)
	local node = get_node_at_cursor()
	while node do
		node = node:next_named_sibling()
		if node and node:type() == node_type then
			local start_row, start_col, _, _ = node:range()
			vim.api.nvim_win_set_cursor(0, {start_row + 1, start_col})
			return
		end
	end
end, {noremap = true, silent = true})

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




require("remap")
require("commands")

-- not for .md or .env
vim.g.copilot_filetypes = {
	markdown = false,
	['*'] = false,
	go = true,
	lua = true,
	javascript = true,
	typescript = true,
	css = true,
	html = true,
	templ = true,
}

