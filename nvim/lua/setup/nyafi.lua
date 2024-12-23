local nyafi = require("nyafi")

nyafi.config = {
	maps = {
		save = "das",
		exit = "<esc>",
	},
	events = {
		post_open = function(this)
			vim.cmd(":setfiletype markdown")
			require("lib.fthooks").recheck()
			this:write_binds()
		end,
		post_exit = function(this)
			require("lib.fthooks").recheck()
		end
	},
	-- this is not being expanded when it is `~`; fix
	filename = "/home/periaate/notes/todo.md"
}

