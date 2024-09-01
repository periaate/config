vim.g.mapleader = " "

vim.cmd[[:filetype plugin on]]

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

vim.o.ignorecase = true  -- Make searches case-insensitive
vim.o.smartcase = true   -- But make it case-sensitive if the search contains uppercase letters

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


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

local oil = require("oil")

local function custom_open_dir()
	local node = oil.get_cursor_entry()
	if node.type == "directory" then
		oil.select()
		local res = oil.get_current_dir() .. node.name
		vim.cmd({cmd = "cd", args = {res}})
	end
end



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
		["ta"] = "actions.toggle_hidden",
		["L"] = {
			callback = function()
				custom_open_dir()
			end,
			desc = "Navigate into directory",
		},
		["`"] = "actions.cd",
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






require('mini.align').setup()

-- The setup config table shows all available config options with their default values:
require("neocord").setup({
    -- General options
    logo                = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Neovim-mark.svg/1200px-Neovim-mark.svg.png", -- "auto" or url
    logo_tooltip        = nil,                        -- nil or string
    main_image          = "language",                 -- "language" or "logo"
    client_id           = "1157438221865717891",      -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 5,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer
    global_timer        = false,                      -- if set true, timer won't update when any event are triggered

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    terminal_text       = "Using Terminal",           -- Format string rendered when in terminal mode.
})



require("remap")
require("commands")

