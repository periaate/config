local key = require("lib.buf").setter("markdown", true)

-- md
key.set('n', 'mt', require("maps.md").todo_on)  -- toggle todo
key.set('n', 'md', require("maps.md").todo_off) -- remove todo
-- key.set('n', 'a', "lua print('hi')")

key.abbrev('ab', 'hiiiii!!!')
key.abbrev('h', 'hiiiii!!!')
