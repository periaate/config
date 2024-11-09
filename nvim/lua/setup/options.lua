vim.g.mapleader = " "

vim.cmd[[:filetype plugin on]]

-- Use spaces instead of tabs
vim.o.expandtab        = true
vim.opt.number         = true -- line number
vim.opt.relativenumber = true
vim.opt.mouse          = "a" -- Enable mouse
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.scrolloff      = 20 -- Keep minimum x number of screen lines above and below the cursor
vim.opt.swapfile       = false
vim.opt.hlsearch       = false -- Highlight search results
vim.opt.incsearch      = true -- As you type, match the currently typed word w/o pressing enter
vim.opt.cursorline     = true
vim.opt.termguicolors  = true
vim.opt.clipboard      = "unnamedplus"

vim.o.ignorecase       = true  -- Make searches case-insensitive
vim.o.smartcase        = true   -- But make it case-sensitive if the search contains uppercase letters

vim.o.foldlevel        = 99
vim.o.foldlevelstart   = 99


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.cmd([[:setlocal spell spelllang=en_us]])

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end
})

-- format on save
local fmtGroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = fmtGroup,
	pattern = { "*.lua", "*.go", "*.html", "*.rs", "*.json", "*.py", "*.nix", "*.js", "*.ts", "*.svelte" },
	command = "lua vim.lsp.buf.format({ async = false })",
})

-- Define the function to create a session
local function create_session()
	-- Use vim.ui.input to get the session name from the user
	vim.ui.input({ prompt = 'Enter session name: ' }, function(input)
		-- Check if input is not nil or empty
		if input and input ~= '' then
			-- Construct the session file path
			local session_file = vim.fn.expand('~') .. '/' .. input .. '.vim'
			-- Create the session with the given name
			vim.cmd('mksession! ' .. session_file)
			-- Inform the user
			print('Session saved as: ' .. session_file)
		else
			-- Inform the user if no valid input was given
			print('Session creation canceled or invalid name given.')
		end
	end)
end

-- Map the function to a command for easy use
vim.api.nvim_create_user_command('SaveSession', create_session, {})
