local abbrev = require("lib.abbrev")
local key = require("lib.key")
local base = require("ft.base")


local function setup()
	abbrev.set_default(base.setup)

	abbrev.ft("go")(require("ft.go"))
	abbrev.ft("markdown")(require("ft.md"))
	abbrev.ft("lua")(require("ft.lua"))
	abbrev.ft("svelte")(require("ft.svelte"))
	abbrev.ft("yaml")(require("ft.yml"))
end

return { setup = setup }
