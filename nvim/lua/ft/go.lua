local key = require("lib.buf").setter("go", true)
local edit = require("lib.std").edit
local get = require("lib.std").get

key.set('n', 'gop', function() edit.paste("package " .. get.base(), false) end)
