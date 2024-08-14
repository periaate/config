return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		jump = {autojump = true},
		labels = "aeopgk'udtnhwcmbrl",
		label = {
			min_pattern_length = 2,
		},
		-- max_length = 1,
		modes = {
			treesitter = {
				labels = "aeopgk'udtnhwcmbrl",
			},
			-- char = {
				-- enabled = true,
				-- multi_line = false,
				-- hide after jump when not using jump labels
				-- 			autohide = false,
				-- 			-- show jump labels
				-- 			jump_labels = true,
				-- 			keys = { ["f"] = "o", ["F"] = "a"},
				-- 		},
			},
		},

		keys = {
			{ "a", mode = { "n", "x", "o" }, function() require("flash").jump({
				search = { forward = false, wrap = false, multi_window = false, mode = "fuzzy" },
			}) end, desc = "Flash" },
			{ "o", mode = { "n", "x", "o" }, function() require("flash").jump({
				search = { forward = true, wrap = false, multi_window = false, mode = "fuzzy" },
			}) end, desc = "Flash" },
			{ "m", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "d", mode = { "n", "x", "o" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter" },
			-- { "<C-e>", mode = { "n", "x", "o" }, function() require("flash").jump({
				-- search = { forward = true, wrap = false, mode = "search", max_length = false },
-- label = { after = { 0, 0 } },
  -- pattern = [[^\S]],
			-- }) end, desc = "Jump to line" },
			-- { "<C-u>", mode = { "n", "x", "o" }, function() require("flash").jump({
				-- search = { forward = false, wrap = false, mode = "search", max_length = false },
-- label = { after = { 0, 0 } },
  -- pattern = [[^\S]],
			-- }) end, desc = "Jump to line" },
		},
	}

