local M = {
	-- "romgrk/barbar.nvim",
	"periaate/barbar.nvim",
	keys = {
		{ "<C-a>", "<cmd>BufferPrevious<CR>" },
		{ "<C-o>", "<cmd>BufferNext<CR>" },
		{ "<A-a>", "<cmd>BufferMovePrevious<CR>" },
		{ "<A-o>", "<cmd>BufferMoveNext<CR>" },
		{ "<A-w>", "<cmd>BufferClose<CR>" },
		{ "<A-b>", "<cmd>BufferRestore<CR>" },
		{ "<A-g>", "<cmd>BufferPick<CR>" },
		-- { "<A-p>", "<cmd>BufferPin<CR>" },
	},
	event = "BufEnter",
}

M.config = function()
	require("barbar").setup({
		icons = {
			button = false,
		},
	})
end

return M
