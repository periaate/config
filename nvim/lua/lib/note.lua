local M = {}

local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event



M.config = {
	maps = {
		open = {}, -- keymap(s) to open file
		save = {}, -- keymap(s) to save file
		exit = {}, -- keymap(s) to exit file
	},
	events = {
		pre_open = nil, -- callback ran on opening
		post_open = nil, -- callback ran on opening
		pre_exit = nil, -- callback ran on exiting
		post_exit = nil, -- callback ran on exiting
	}
}

local function clear() vim.api.nvim_buf_set_lines(op.buf, 0, -1, false, {}) end

local function callbacks(cbs)
	function call(cb)
		if type(cb) ~= "function" then return else cb() end
	end
	if type(cbs) == "table" then
		for _, v in ipairs(cbs) do call(v) end
	else
		call(cbs)
	end
end

local function write_binds(bufnr)
	bufnr = bufnr or 0
	function all(buf, fn, arr)
		if not fn then return end
		if not arr then return end
		if type(arr) == "string" then
			if buf then
				vim.api.nvim_buf_set_keymap(bufnr, 'n', arr, fn, {})
			else 
				vim.keymap.set('n', arr, fn)
			end
		elseif type(arr) == "table" then
			if buf then
				for _, v in ipairs(arr) do
					if type(v) == "string" then	vim.api.nvim_buf_set_keymap(bufnr, 'n', v, fn, {}) end
				end
			else
				for _, v in ipairs(arr) do
					if type(v) == "string" then	vim.keymap.set('n', v, fn) end
				end
			end
		end
	end

	all(false, M.open, M.config.maps.open)
	all(false, M.save, M.config.maps.save)
	all(false, M.exit, M.config.maps.exit)
end

function M.mount()
	callbacks(M.config.events.pre_open)
	M.popup:mount()
	write_binds(M.popup.bufnr)
	callbacks(M.config.events.post_open)
end

function M.unmount()
	callbacks(M.config.events.pre_exit)
	M.popup:unmount()
	callbacks(M.config.events.post_exit)
end

function M.open(fn)
	local popup = Popup({
		enter = true,
		focusable = true,
		border = {
			style = "rounded",
		},
		position = "50%",
		size = {
			width = "80%",
			height = "80%",
		},
	})

	fn = fn or "/blume/test.md"

	M.popup = popup
	M.fn = fn

	M.mount()
	popup:on({ event.BufLeave, event.BufUnload }, function() M.exit() end)
	if fn then M.read_file_to_buf(fn) end
end

function M.save(fn)
	fn = fn or M.fn
	if not fn then error("no valid filepath given") end
	fn = vim.fn.expand(fn)
	if not M.popup then return end
	M.write_buf_to_file(M.popup.bufnr, fn)
end

function M.exit()
	M.save()
	M.unmount()
end

function M.read_file_to_buf(fn)
	vim.api.nvim_command("$read " .. fn)
	
	-- there is a phantom line. These commands remove it.
	vim.cmd("normal! k") 
	vim.cmd("normal! dd")
end

function M.write_buf_to_file(buf, fn)
	if not vim.api.nvim_buf_is_valid(buf) then return end
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local file = io.open(fn, "w")
	for _, line in ipairs(lines) do
		file:write(line .. "\n")
	end
	file:close()
end

-- local function view(buf, fn)
-- 	op.fn = "C:/Users/Daniel/notes/todo/" .. td(op.td) .. ".md"
-- 	vim.fn.system("touch " .. op.fn)
-- 	vim.cmd(":setfiletype markdown")
-- 	abbrev.recheck()
-- 	key.set('n', '<C-a>', op.prev)
-- 	key.set('n', '<C-o>', op.next)
-- end


M.config.maps.open = "dat"
M.config.maps.save = "das"
M.config.maps.exit = { "<esc>", "hi" }

M.config.events.pre_open = function() print("hi!! :3") end


M.open("/blume/test.md")

-- return M
