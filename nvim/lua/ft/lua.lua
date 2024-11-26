local key = require("lib.key")
local a = require("lib.abbrev")


return function()
	key.set('n', 'goo', function() print("hiiii :DDD") end)
	a.iabbrev('goo', "hiiii :DDD")
	a.isnip('lb', a.clean .. a.last(1, [[local \1 = require("lib.\1")]]))
	a.isnip("prl", a.clean .. a.repm([[print("\0")]]))
end

