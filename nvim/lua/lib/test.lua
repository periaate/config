local json = require('lib.json')

local function clean(path)
    path = path:gsub("\\", "/")
    path = path:gsub("//+", "/")
    return path
end

local function tpath(path)
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
        error('Could not open file for writing: ' .. err)
    end
    file:write(content)
    file:close()
end

function read_file(filepath)
    local file, err = io.open(filepath, "r")
    if not file then
        error('Could not open file for reading: ' .. err)
    end
    local content = file:read("*all")
    file:close()
    return content
end

-- Function to get buffer filepaths and cursor positions
local function get_buffers_and_cursors()
    local buffers = vim.api.nvim_list_bufs()
    local result = {}

    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) then
            local filepath = vim.api.nvim_buf_get_name(buf)
            if filepath ~= '' then
                local cursor_position = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local row, col = unpack(vim.api.nvim_win_get_cursor(win))
                    cursor_position = { row = row, col = col }
                    break
                end

                table.insert(result, {
                    buffer = buf,
                    filepath = clean(filepath),
                    cursor_positions = cursor_position
                })
            end
        end
    end

    return result
end

local buffers_data = get_buffers_and_cursors()
local j = json.encode(buffers_data)

local cur = get_cwd()

local p = "C:/blume/etc/nvim/" .. tpath(cur) .. ".json"
write_file(p, j)

local res = read_file(p)
print(res)



