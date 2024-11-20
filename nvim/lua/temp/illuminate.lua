local M = {
	"RRethy/vim-illuminate",
	config = function()
		require('illuminate').configure({
			-- providers: provider used to get references in the buffer, ordered by priority
			providers = {
				'lsp',
				'treesitter',
				'regex',
			},
			-- delay: delay in milliseconds
			delay = 16,

			-- under_cursor: whether or not to illuminate under the cursor
			under_cursor = true,
			-- large_file_cutoff: number of lines at which to use large_file_config
			-- The `under_cursor` option is disabled when this cutoff is hit
			large_file_cutoff = nil,
			-- large_file_config: config to use for large files (based on large_file_cutoff).
			-- Supports the same keys passed to .configure
			-- If nil, vim-illuminate will be disabled for large files.
			large_file_overrides = nil,
			-- min_count_to_highlight: minimum number of matches required to perform highlighting
			min_count_to_highlight = 0,
			should_enable = function(bufnr) return true end,
			-- case_insensitive_regex: sets regex case sensitivity
			case_insensitive_regex = false,
		})
	end,	
}

return M
