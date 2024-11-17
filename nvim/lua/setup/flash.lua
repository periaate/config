local key = require("lib.key")

key.set({ "n", "x", "o" }, " " .. "o", function()
	require("flash").jump({
		search = { 
			forward = true, wrap = false,
			mode = "search", max_length = 0,
		},
		highlight = { backdrop = false, matches = false, },
		labels = "pgkaeo'ud",
		label = { uppercase = false, after = { 0, 0 } },
		pattern = [[\s]],
	})
end)

key.set({ "n", "x", "o" }, " " .. "a", function()
	require("flash").jump({
		search = { 
			forward = false, wrap = false,
			mode = "search", max_length = 0
		},
		highlight = { backdrop = false, matches = false, },
		labels = "pgkaeo'ud",
		label = { uppercase = false, after = { 0, 0 } },
		pattern = [[\s]],
	})
end)

key.set({ "n", "x", "o" }, " " .. "e", function()
	require("flash").jump({
		search = { 
			forward = true, wrap = false,
			mode = "search", max_length = 0
		},
		label = { after = { 0, 0 } },
		pattern = [[^\(\s*$\|$\)]],
	})
end)

key.set({ "n", "x", "o" }, " " .. "u", function()
	require("flash").jump({
		search = { 
			forward = false, wrap = false,
			mode = "search", max_length = 0
		},
		label = { after = { 0, 0 } },
		pattern = [[^\(\s*$\|$\)]],
	})
end)


