local M = {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
}

M.config = function()
	local ls = require("luasnip")

	-- global variable
	LUASNIP_ENV = {
		s = require("luasnip.nodes.snippet").S,
		i = require("luasnip.nodes.insertNode").I,
		fmt = require("luasnip.extras.fmt").fmt,
		parse = require("luasnip.util.parser").parse_snippet,
		p = require("luasnip.extras").partial,
	}

	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
	})

	-- load lua snippets
	require("luasnip.loaders.from_lua").lazy_load({ paths = "/blume/config/nvim/snippets/" })

	vim.keymap.set({ "i", "s" }, "<a-p>", function()
		if ls.expand_or_jumpable() then
			ls.expand()
		end
	end)

	vim.keymap.set({ "i", "s" }, "<a-k>", function()
		if ls.jumpable(1) then
			ls.jump(1)
		end
	end)

	vim.keymap.set({ "i", "s" }, "<a-j>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end)

	vim.keymap.set({ "i", "s" }, "<a-l>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end)
	vim.keymap.set({ "i", "s" }, "<a-h>", function()
		if ls.choice_active() then
			ls.change_choice(-1)
		end
	end)


end

return M
