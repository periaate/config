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
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- Whether to set jumps in the jumplist
				goto_next_start = {
					["foa"] = "@function.outer",
					["loa"] = "@loop.outer",
					["coa"] = "@conditional.outer",
				},
				goto_next_end = {
					["foo"] = "@function.outer",
					["loo"] = "@loop.outer",
					["coo"] = "@conditional.outer",
				},
				goto_previous_start = {
					["faa"] = "@function.outer",
					["laa"] = "@loop.outer",
					["caa"] = "@conditional.outer",
				},
				goto_previous_end = {
					["fao"] = "@function.outer",
					["lao"] = "@loop.outer",
					["cao"] = "@conditional.outer",
				},
			},
		},
	})
end

return M
