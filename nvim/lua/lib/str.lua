local M = {}

-- Contains: Checks if a string contains any of the given substrings.
function M.Contains(...)
    local substrings = { ... }
    return function(str)
        for _, substring in ipairs(substrings) do
            if string.find(str, substring, 1, true) then
                return true
            end
        end
        return false
    end
end

-- HasPrefix: Checks if a string has any of the given prefixes.
function M.HasPrefix(...)
    local prefixes = { ... }
    return function(str)
        for _, prefix in ipairs(prefixes) do
            if string.sub(str, 1, #prefix) == prefix then
                return true
            end
        end
        return false
    end
end

-- HasSuffix: Checks if a string has any of the given suffixes.
function M.HasSuffix(...)
    local suffixes = { ... }
    return function(str)
        for _, suffix in ipairs(suffixes) do
            if string.sub(str, -#suffix) == suffix then
                return true
            end
        end
        return false
    end
end

-- ReplacePrefix: Replaces prefixes based on pattern pairs.
function M.ReplacePrefix(...)
    local pats = { ... }
    return function(str)
        if #pats % 2 ~= 0 then
            return str
        end
        for i = 1, #pats, 2 do
            local prefix = pats[i]
            if #prefix <= #str and string.sub(str, 1, #prefix) == prefix then
                return pats[i + 1] .. string.sub(str, #prefix + 1)
            end
        end
        return str
    end
end

-- ReplaceSuffix: Replaces suffixes based on pattern pairs.
function M.ReplaceSuffix(...)
    local pats = { ... }
    return function(str)
        if #pats % 2 ~= 0 then
            return str
        end
        for i = 1, #pats, 2 do
            local suffix = pats[i]
            if #suffix <= #str and string.sub(str, -#suffix) == suffix then
                return string.sub(str, 1, -#suffix - 1) .. pats[i + 1]
            end
        end
        return str
    end
end

function M.Split(input, sep)
	local result = {}

	if sep == "" then
		for i = 1, #input do
			table.insert(result, input:sub(i, i))
		end
		return result
	end

	local pattern = "(.-)" .. sep
	local last_end = 1
	local s, e, cap = input:find(pattern, 1)

	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(result, cap)
		end
		last_end = e + 1
		s, e, cap = input:find(pattern, last_end)
	end

	if last_end <= #input then
		table.insert(result, input:sub(last_end))
	end

	return result
end


return M
