vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.templ",
	command = "set filetype=templ",
})
