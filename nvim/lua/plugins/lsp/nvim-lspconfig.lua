local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim",          config = true },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
}

M.config = function()
	local mason = require("mason")
	local mcfg = require("mason-lspconfig")
	mason.setup()

	local servers = {
		"gopls",
		"tsserver",
		-- "nil_ls",
		"rust_analyzer",
		"emmet_ls",
		"emmet_language_server",
		"zls",


		"html",
		"cssls",
		"eslint",
		"tsserver",

		"htmx",
		"templ",
	}

	mcfg.setup {
		ensure_installed = servers,
	}

	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local on_attach = function(client, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = 0 }
		vim.keymap.set("n", "dc", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "df", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "<leader>ai", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<leader>ar", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
		vim.keymap.set("n", "<space>df", vim.diagnostic.goto_next, bufopts)

		-- if client.supports_method("textDocument/inlayHint") then
		-- 	print("supports inlay hint")
		-- 	vim.lsp.inlay_hint.enable(bufnr, true)
		-- end

		vim.api.nvim_exec([[
		augroup LspAutocommands
		autocmd! * <buffer>
		autocmd BufWritePre <buffer> lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
		augroup END
		]], false)
	end


	-- custom settings
	local gopls_settings = {
		gofumpt = true,      -- use gofumpt formatting style
		staticcheck = true,  -- enable staticcheck diagnostics
		completeUnimported = true, -- enable completion for unimported packages
		usePlaceholders = true, -- placeholders for function parameters or struct fields in completion
		analyses = {
			unusedparams = true,
			nilness = true, -- enable analysis for nilness
			unusedwrite = true, -- enable analysis for unused write
		},
		hints = {
			assignVariableTypes = true,
			compositeLiteralFields = true,
			compositeLiteralTypes = true,
			constantValues = true,
			functionTypeParameters = true,
			parameterNames = true,
			rangeVariableTypes = true,
		},
	}

	-- setup servers
	for _, lsp in pairs(servers) do
		lspconfig[lsp].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "LUASNIP_ENV" },
						-- LUASNIP_ENV is a custom variable declared in `lua/plugins/luasnip.lua`
					},
					hint = {
						enable = true,
					},
				},
				gopls = gopls_settings,
			},
		})
	end

	--https://github.com/aca/emmet-ls
	lspconfig.emmet_ls.setup({
		filetypes = { "html", "css", "template", "templ" },
	})


	lspconfig.marksman.setup {}
end

-- M.toggle_inlay_hints = function()
-- 	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- end

return M
