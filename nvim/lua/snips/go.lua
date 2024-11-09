
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local map = require("maps.map")

ls.cleanup()


map.set({"i", "s"}, "<A-o>", function()
	ls.expand_or_jump(1)
end, {silent = true})
map.set({"i", "s"}, "<A-a>", function()
	ls.jump(-1)
end, {silent = true})


vim.keymap.set({"i", "s"}, "<A-e>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

ls.add_snippets("all", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1), t(" ? "), i(2), t(" : "), i(3)
	})
})

ls.add_snippets("all", {
	ms({
		common = {snippetType = "autosnippet"},
		{trig = "a", snippetType = "snippet"},
		"b",
		{trig = "c", condition = function(line_to_cursor)
			return line_to_cursor == ""
		end}
	}, {
		i(1), t" - ", rep(1)
	})
})


local go = "all"

ls.add_snippets(go, { s("ier", { t'if err != nil { ', i(1), t' }' }) })

ls.add_snippets(go, { s(
{trig = "rier"},
t({"if err != nil {", "	return", "}"})
)}
)






