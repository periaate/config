local key = require("lib.buf").setter("*.go")

key.set('n', 'gop', function() edit.paste("package " .. get.base(), false) end)

