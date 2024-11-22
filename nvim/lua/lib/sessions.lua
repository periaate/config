local json = require('lib.json')

local M = {}

local function clean(path)
    path = path or ""
    path = path:gsub("\\", "/")
    path = path:gsub("//+", "/")
    return path
end

local function tpath(path)
    path = path or ""
    path = path:gsub("\\", "")
    path = path:gsub("/", "")
    path = path:gsub(":", "")
    return path
end

function get_cwd() return vim.fn.getcwd() end

function set_cwd(path)
    if vim.fn.isdirectory(path) == 1 then
        vim.cmd('cd ' .. vim.fn.fnameescape(path))
    else
        error('Path does not exist or is not a directory: ' .. path)
    end
end

function write_file(filepath, content)
    local file, err = io.open(filepath, "w")
    if not file then
        -- error('Could not open file for writing: ' .. err)
        return
    end
    file:write(content)
    file:close()
end

function read_file(filepath)
    local file, err = io.open(filepath, "r")
    if not file then
        -- error('Could not open file for reading: ' .. err)
        return
    end
    local content = file:read("*all")
    file:close()
    return content
end

-- Function to get buffer filepaths and cursor positions
local function get_buffers_and_cursors()
    local first = vim.api.nvim_get_current_buf()
    local fname = vim.api.nvim_buf_get_name(first)

    local buffers = vim.api.nvim_list_bufs()
    local result = {
        focus = clean(fname),
        files = {},
    }

    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local filepath = vim.api.nvim_buf_get_name(buf)
            if filepath ~= '' then
                vim.api.nvim_set_current_buf(buf)
                local cursor_position = {}
                -- Get the current window ID
                local win_id = vim.fn.bufwinid(buf)
                if win_id ~= -1 then
                    -- Get the cursor position as a (row, col) tuple
                    local cursor_pos = vim.api.nvim_win_get_cursor(win_id)
                    cursor_position = { row = cursor_pos[1], col = cursor_pos[2] }
                end
                print("Row: " .. cursor_position.row .. " Col: " .. cursor_position.col)

                table.insert(result.files, {
                    filepath = clean(filepath),
                    cursor_position = cursor_position
                })
            end
        end
    end

    vim.api.nvim_set_current_buf(first)

    return result
end

local function open_files_with_positions(data)
    local focus = data.focus
    local foc_buf = 0
    local files = data.files
    for _, file in ipairs(files) do

        local filepath = file.filepath
        local cursor_position = file.cursor_position
        if filepath and cursor_position and cursor_position.row and cursor_position.col then
            vim.cmd("edit " .. file.filepath)

            if cursor_position.row > 1 then
                vim.cmd('normal! ' .. cursor_position.row-1 .. 'j')
            end
            vim.cmd('normal! ' .. cursor_position.col .. 'l')

            if file.filepath == focus then
                foc_buf = vim.api.nvim_get_current_buf()
            end
        end
    end

    vim.api.nvim_set_current_buf(foc_buf)
end

M.root = "C:/blume/etc/nvim/"

function M.save_session(path)
    local cur = get_cwd()
    path = path or cur
    local buffers_data = get_buffers_and_cursors()
    local j = json.encode(buffers_data)
    local p = M.root .. tpath(path) .. ".json"
    write_file(p, j)
end

function M.load_session(path)
    local cur = get_cwd()
    path = path or cur
    local p = M.root .. tpath(path) .. ".json"
    local res = read_file(p)
    if not res then
        return
    end
    local data = json.decode(res)
    if not data then
        return
    end
    open_files_with_positions(data)
end

function M.exists(path)
    local cur = get_cwd()
    path = path or cur
    local p = M.root .. tpath(path) .. ".json"
    return read_file(p) ~= nil
end

return M
