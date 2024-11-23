local s = require('lib.sessions')


local buffers = vim.api.nvim_list_bufs()
for _, buf in ipairs(buffers) do
	if vim.api.nvim_buf_is_loaded(buf) then
		local filepath = vim.api.nvim_buf_get_name(buf)
		print(s.get_filetype(buf), s.not_term(buf), filepath ~= "", s.not_term(buf) and filepath ~= "")
	end
end

