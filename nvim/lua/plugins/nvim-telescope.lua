local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>tt",
			"<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({ previewer = true }))<CR>",
		},
		{
			"<leader><leader>",
			"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = true }))<CR>",
		},
	},
}

M.config = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
				},
			},
		},
	})
end

return M
