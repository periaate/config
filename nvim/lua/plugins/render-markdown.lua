return {
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		sign = { enabled = false },
		checkbox = {
			custom = {
				todo = { raw = '[-]', rendered = '󰇘 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
				question = { raw = '[?]', rendered = ' ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
			},
		},
		bullet = {
			enabled = true,
			icons = { '', '', '', '' },
			ordered_icons = {},
			left_pad = 0,
			right_pad = 0,
			highlight = 'RenderMarkdownBullet',
		},
	},
}
