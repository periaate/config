return {
	'periaate/nyafi.nvim',
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local nyafi = require("nyafi")

		nyafi.config = {
			maps = {
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
			filename = "/blume/home/root/todo.md"
		}

		nyafi.setup()
	end
}
