local key = require("lib.key")
local abbrev = require("lib.abbrev")

function clean(str) return str:gsub("\n", "") end
function td(v)
	v = v or ""
	v = vim.fn.system("td " .. v .. "d")
	v = clean(v)
	return v
end

function T(value)
	if not value then return false end
	if value == nil then return false end
	if value == '' then return false end
	if type(value) == "table" then
		if #value == 0 then return false end
	end
	return true
end

local op = {
	win = nil,
	buf = nil,
	fn = nil,
	td = 0,
}

function op.write(buf, fn)
	local buf = buf or op.buf
	local fn = fn or op.fn
	if not T(buf) then return end
	if not T(fn) then return end
	if not vim.api.nvim_buf_is_valid(buf) then return end
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local file = io.open(fn, "w")
	for _, line in ipairs(lines) do
		file:write(line .. "\n")
	end
	file:close()
end

function op.save(buf, fn)
	local buf = buf or op.buf
	local fn = fn or op.fn
	if not T(buf) then return end
	if not vim.api.nvim_buf_is_valid(buf) then return end
	op.write(buf, fn)
	-- vim.api.nvim_buf_delete(op.buf, { force = true })
end

function op.close()
	if not T(op.win) then return end
	op.write()
	vim.api.nvim_win_close(op.win, true)
	op.win = nil
	op.buf = nil
	op.fn = nil
	abbrev.recheck()
end

function op.open_win()
	op.close()
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")
	local win_height = math.ceil(height * 0.8)
	local win_width = math.ceil(width * 0.8)
	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)

	local opts = {
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, opts)
	vim.api.nvim_win_set_option(win, "cursorline", true)
	op.buf = buf
	op.win = win
end

local function view(buf, fn)
	vim.cmd(":setfiletype markdown")
	abbrev.recheck()
	vim.api.nvim_create_autocmd("BufUnload", {
		buffer = buf,
		callback = function()
			if vim.api.nvim_buf_is_valid(buf) then
				op.close()
			end
		end,
	})

	vim.api.nvim_input("nn<BS><esc>")
	-- vim.api.nvim_buf_set_keymap(buf, "n", "<ESC>", op.close, { noremap = true, silent = true })
	key.set('n', '<ESC>', op.close)
	vim.api.nvim_command("$read " .. fn)

	key.set('n', '<C-a>', op.prev)
	key.set('n', '<C-o>', op.next)
end

function op.clear() vim.api.nvim_buf_set_lines(op.buf, 0, -1, false, {}) end

function op.open()
	if op.win then
		op.write()
		op.clear()
	else
		op.open_win()
	end
	op.td = op.td or 0
	op.fn = "C:/Users/Daniel/notes/todo/" .. td(op.td) .. ".md"
	vim.fn.system("touch " .. op.fn)
	view(op.buf, op.fn)
end

function op.prev()
	op.td = op.td - 1
	op.open()
end

function op.next()
	op.td = op.td + 1
	op.open()
end

return { todo = op.open }
