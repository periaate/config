local M = {}

function M.Log(val)
	print(val)
	return val
end

-- All function: Returns true if all arguments satisfy the predicate.
function M.All(fn)
    return function(args)
        for _, arg in ipairs(args) do
            if not fn(arg) then
                return false
            end
        end
        return true
    end
end

-- Any function: Returns true if any argument satisfies the predicate.
function M.Any(fn)
    return function(...)
        local args = { ... }
        for _, arg in ipairs(args) do
            if fn(arg) then
                return true
            end
        end
        return false
    end
end

-- First function: Returns the first value that satisfies the predicate.
function M.First(fn)
    return function(args)
        for _, arg in ipairs(args) do
            if fn(arg) then
                return arg
            end
        end
        return nil
    end
end

-- Filter function: Returns a list of values that satisfy the predicate.
function M.Filter(fn)
    return function(args)
        local res = {}
        for _, arg in ipairs(args) do
            if fn(arg) then
                table.insert(res, arg)
            end
        end
        return res
    end
end

function M.Map(fn)
	return function(args)
		local res = {}
		for _, arg in ipairs(args) do
			table.insert(res, fn(arg))
		end
		return res
	end
end

return M
