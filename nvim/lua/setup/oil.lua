local str = require("lib.str")

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

-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		dir = str.ReplacePrefix(vim.fn.expand("$HOME"), "~")(dir)
		dir = string.gsub(dir, "\\", "/")
		dir = str.ReplacePrefix("C:/", "/")(dir)

		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

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
		winbar = "%!v:lua.get_oil_winbar()",
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
	watch_for_changes = true,
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

