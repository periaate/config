local key = require("lib.buf").setter("lua", true)

key.set('n', 'goo', function() print("hiiii :DDD") end)

key.abbrev('goo', function() print("hiiii :DDD") end)
