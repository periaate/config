local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},
}

M.config = function()
	local cmp = require("cmp")
	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	local kind_icons = {
		-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
		Text = " ",
		Method = "󰆧",
		Function = "ƒ ",
		Constructor = " ",
		Field = "󰜢 ",
		Variable = " ",
		Constant = " ",
		Class = " ",
		Interface = "󰜰 ",
		Struct = " ",
		Enum = "了 ",
		EnumMember = " ",
		Module = "",
		Property = " ",
		Unit = " ",
		Value = "󰎠 ",
		Keyword = "󰌆 ",
		Snippet = " ",
		File = " ",
		Folder = " ",
		Color = " ",
	}

	cmp.setup({
		window = {},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-c>"] = cmp.mapping.abort(),
			["<C-CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-u>"] = cmp.mapping.select_prev_item(),
			["<C-e>"] = cmp.mapping.select_next_item(),
		}),
		
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),

		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[NvimAPI]",
					path = "[Path]",
				})[entry.source.name]
				return vim_item
			end,
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return M
