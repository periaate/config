

function open_win()
	buf = vim.api.nvim_create_buf(false, true)

	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

	local win_height = math.ceil(height * 0.8 - 4)
	local win_width = math.ceil(width * 0.8)

	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)

	local opts = {
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = 20,
		row = row,
		col = col,
		border = "rounded",
	}

	win = vim.api.nvim_open_win(buf, true, opts)
	vim.api.nvim_win_set_option(win, "cursorline", true)
	return buf
end

function save_buf_to_file(buf, filename)
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local file = io.open(filename, "w")
	for _, line in ipairs(lines) do
		file:write(line .. "\n")
	end
	file:close()
end

local function view(buf, fn)
	vim.api.nvim_create_autocmd("BufUnload", {
		buffer = buf,
		callback = function()
			save_buf_to_file(buf, fn)
		end,
	})

	vim.api.nvim_input("nn<BS><esc>")
	vim.api.nvim_buf_set_keymap(buf, "n", "<ESC>", ":close!<cr>", { noremap = true, silent = true })
	vim.api.nvim_command("$read " .. fn)
	vim.cmd(":setfiletype markdown")
end

local function file_window(fn)
	local buf = open_win()
	view(buf, fn)
end


return file_window
