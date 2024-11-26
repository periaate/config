-- local s = require('lib.sessions')

--
-- local buffers = vim.api.nvim_list_bufs()
-- for _, buf in ipairs(buffers) do
-- 	if vim.api.nvim_buf_is_loaded(buf) then
-- 		local filepath = vim.api.nvim_buf_get_name(buf)
-- 		print(s.get_filetype(buf), s.not_term(buf), filepath ~= "", s.not_term(buf) and filepath ~= "")
-- 	end
-- end
--
--
-- local function load_current_line_as_macro(register)
--     register = register or "a"
--     local line = vim.api.nvim_get_current_line()
--     vim.fn.setreg(register, line)
--     print(string.format("Macro loaded into register '%s': %s", register, line))
-- end
--
-- local function paste_current_macro(register)
--     register = register or "a"
--     local macro = vim.fn.getreg(register)
--     if macro == "" then
--         print(string.format("Register '%s' is empty.", register))
--         return
--     end
--     -- vim.api.nvim_feedkeys(macro, "n", false)
--     print(string.format("Pasted macro from register '%s': %s", register, macro))
-- end 
--
--
-- paste_current_macro()


local function get_git_files()
    local staged_files = {}
    local unstaged_files = {}
    local git_files = {}

    -- Function to run shell commands and capture output
    local function run_command(cmd)
        local handle = io.popen(cmd)
        local result = handle:read("*a")
        handle:close()
        return result
    end

    -- Get staged files
    local staged_output = run_command("git diff --name-only --cached")
    for file in staged_output:gmatch("[^\r\n]+") do
        table.insert(staged_files, file)
        table.insert(git_files, { filepath = file, is_staged = true })
    end

    -- Get unstaged files
    local unstaged_output = run_command("git diff --name-only")
    for file in unstaged_output:gmatch("[^\r\n]+") do
        if not vim.tbl_contains(staged_files, file) then
            table.insert(unstaged_files, file)
            table.insert(git_files, { filepath = file, is_staged = false })
        end
    end

    return git_files
end

local files = get_git_files()

for _, file in ipairs(files) do
	if file.is_staged then
		print("󰄲 " .. file.filepath)
	else
		print(" " .. file.filepath)
	end
end



