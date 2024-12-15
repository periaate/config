-- Thanks ChatGPT o1


-- This revision focuses on correctly handling cases like R2. Previously, the heuristic for
-- "simple statements" was too restrictive, disallowing braces altogether. In Go, struct
-- literals (e.g. Err[E]{Val: err}) are common and should be considered simple single-line 
-- statements.
--
-- We now consider a "simple" statement as any single-line statement that does not represent 
-- multiple lines or multiple statements. It can contain braces if they form a single inline 
-- literal like Err[E]{Val: err}. We'll avoid splitting hairs too finely and rely on basic 
-- heuristics:
-- A line is considered simple if it:
-- - starts with `return`, or
-- - is a single assignment/return/panic statement line, possibly containing braces for 
--   struct literals, but no `if`, `for`, `case`, etc. inside it.
--
-- This will handle the scenario where we have `case E:` followed by `res.Error = Err[E]{Val: err}`, 
-- allowing it to inline correctly.

local function is_simple_statement(line)
	-- Trim
	local stmt = line:match("^%s*(.-)%s*$")
	-- Disallow empty lines
	if stmt == "" then return false end
	-- Disallow control structures
	if stmt:match("^if%s+") or stmt:match("^for%s+") or stmt:match("^switch%s+") then
		return false
	end

	-- Heuristic checks for a single statement:
	-- If it starts with 'return', consider it simple.
	if stmt:match("^return[%s(]") then
		return true
	end

	-- If it starts with 'panic(', consider it simple
	if stmt:match("^panic%(") then
		return true
	end

	-- Check for assignments or direct calls. A rough heuristic:
	-- Something like `res.Error = ...`, `x := ...`, `myFunc(...)`, etc.
	-- We'll allow braces for struct literals.
	-- Just ensure it's not multiple statements separated by ';'.
	if stmt:find(";") then
		return false
	end

	-- We'll trust any single statement that doesn't contain keywords introducing new blocks.
	-- It's a single line, so let's consider it simple if it doesn't start with case/default/etc.
	-- Already handled that above. Let's just return true now if we got here.
	return true
end

local function find_block_end(lines, start_index)
	for j = start_index, #lines do
		local ltrim = lines[j]:match("^%s*(.-)%s*$")
		if ltrim == "}" then
			return j
		end
	end
	return nil
end

local function next_control_line_index(lines, start_index)
	for j = start_index, #lines do
		local ltrim = lines[j]:match("^%s*(.-)%s*$")
		if ltrim:match("^case%s") or ltrim:match("^default:") or ltrim == "}" then
			return j
		end
	end
	return nil
end

local max = 100

local function try_inline_if(lines, i)
	local if_line = lines[i]
	local block_end = find_block_end(lines, i+1)
	if not block_end then return false end

	local inner_lines = {}
	for idx = i+1, block_end-1 do
		table.insert(inner_lines, lines[idx])
	end

	if #inner_lines == 1 then
		local stmt = inner_lines[1]:match("^%s*(.-)%s*$")
		if is_simple_statement(stmt) then
			local indent = if_line:match("^([ \t]*)")
			local cond = if_line:match("if%s+(.-)%s*{$")
			if cond then
				local res = indent .. "if " .. cond .. " { " .. stmt .. " }"
				if #res > max then return false end
				lines[i] = res

				for _ = i+1, block_end do
					table.remove(lines, i+1)
				end
				return true
			end
		end
	end
	return false
end

local function try_inline_fn(lines, i)
	local if_line = lines[i]
	local block_end = find_block_end(lines, i+1)
	if not block_end then return false end

	local inner_lines = {}
	for idx = i+1, block_end-1 do
		table.insert(inner_lines, lines[idx])
	end

	if #inner_lines == 1 then
		local stmt = inner_lines[1]:match("^%s*(.-)%s*$")
		if is_simple_statement(stmt) then
			local indent = if_line:match("^.*{%s*$")
			local cond = if_line:match("func.*{%s*$")
			if cond then
				local res = indent .. " " .. stmt .. " }"
				if #res > max then return false end
				lines[i] = res
				for _ = i+1, block_end do
					table.remove(lines, i+1)
				end
				return true
			end
		end
	end
	return false
end



local function try_inline_case(lines, i)
	local case_line = lines[i]
	local next_control = next_control_line_index(lines, i+1)
	if not next_control then return false end

	local inner_lines = {}
	for idx = i+1, next_control-1 do
		table.insert(inner_lines, lines[idx])
	end

	if #inner_lines == 1 then
		local stmt = inner_lines[1]:match("^%s*(.-)%s*$")
		if is_simple_statement(stmt) then
			local indent = case_line:match("^([ \t]*)")
			local ccond = case_line:match("^%s*(case%s+.-):%s*$")
			if not ccond then
				ccond = case_line:match("^%s*(default):%s*$")
			end
			if ccond then
				local res = indent .. ccond .. ": " .. stmt
				if #res > max then return false end
				lines[i] = res
				for _ = 1, #inner_lines do
					table.remove(lines, i+1)
				end
				return true
			end
		end
	end
	return false
end

local function try_all(lines, i)
	return try_inline_if(lines, i) or try_inline_case(lines, i) or try_inline_fn(lines, i)
end

local function try_inline_blocks(lines)
	local i = 1
	while i <= #lines do
		try_all(lines, i)
		i = i + 1
	end
end

local function reformat_gocode()
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	try_inline_blocks(lines)

	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
end


-- require("lib.key").set("n", "tgp", reformat_gocode)

return {
	reformat_gocode = reformat_gocode
}
