local nyafi = require("nyafi")

nyafi.config = {
	maps = {
		save = "das",
		exit = "<esc>",
	},
	events = {
		post_open = function(this)
			vim.cmd(":setfiletype markdown")
			require("lib.abbrev").recheck()
			this:write_binds()
		end,
		post_exit = function(this)
			require("lib.abbrev").recheck()
		end
	},
	filename = "/home/Daniel/notes/todo.md"
}

