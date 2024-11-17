local key = require("lib.buf").setter("markdown", true)

-- md
key.set('n', 'mt', require("maps.md").todo.on)  -- toggle todo
key.set('n', 'md', require("maps.md").todo.off) -- remove todo

key.abbrev('ab', 'hiiiii!!!')
