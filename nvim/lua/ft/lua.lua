local key = require("lib.key")
local a = require("lib.abbrev")

return function()
	key.set('n', 'goo', function() print("hiiii :DDD") end)
	a.iabbrev('goo', "hiiii :DDD")
end
