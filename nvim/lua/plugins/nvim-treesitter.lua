local M = {
	"nvim-treesitter/nvim-treesitter",
	cmd = "TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}

M.config = function()
	require("nvim-treesitter.configs").setup({
		-- A list of parser names, or "all"
		ensure_installed = {
			"c",
			"lua",
			"go",
			"bash",
			"python",
			"html",
			"javascript",
			"json",
			"nix",
			"rust",
			"templ",
		},
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		--indent = { enable = true }
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					["to"] = "@assignment.rhs",
					["te"] = "@assignment.outer",
					["ta"] = "@assignment.lhs",

					["no"] = "@parameter.outer",
					["na"] = "@parameter.inner",
				},
			},
		},
	})
end

return M
