

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



