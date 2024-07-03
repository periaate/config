local M = {
	"romgrk/barbar.nvim",
	keys = {
		{ "<A-a>", "<cmd>BufferPrevious<CR>" },
		{ "<A-o>", "<cmd>BufferNext<CR>" },
		{ "<A-<>", "<cmd>BufferMovePrevious<CR>" },
		{ "<A->>", "<cmd>BufferMoveNext<CR>" },
		{ "<A-w>", "<cmd>BufferClose<CR>" },
		{ "<A-g>", "<cmd>BufferRestore<CR>"},
		{ "<A-f>", "<cmd>BufferPick<CR>" },
		{ "<A-p>", "<cmd>BufferPin<CR>" },
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
