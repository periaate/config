
require("maps.basic")
require("maps.abbrev")

--
--local keymap = vim.keymap.set
--
--local function nrmap(mode, key, action, optss)
--	local options = { noremap = true, silent = true }
--	if optss then
--		options = optss
--	end
--	keymap(mode, key, action, options)
--end
--
--local opts = {noremap = true}
--local all = {'n', 'v', 'x', 'o'}
--local almost = {'n', 'v', 'x'}
--
--
--nrmap(all, 'd', '')
--nrmap(all, 'D', '')
--nrmap(all, 'x', '')
--nrmap(all, 'X', '')
--nrmap(all, 'j', '')
--nrmap(all, 'J', '')
--nrmap(all, 'q', '')
--nrmap(all, 'Q', '')
--nrmap(all, 'f', '')
--nrmap(all, 'F', '')
--
--keymap('n', '<C-u>', '20k', opts)
--keymap('n', '<C-e>', '20j', opts)
--
---- keymap(all, '<C-a>', "gg", opts)
---- keymap(all, "<C-o>", "G", opts)
--
--keymap(all, 'U', '{', opts)
--keymap(all, 'E', '}', opts)
--
--
---- discover left, on top right, on top, left, next to, right, next to
---- keymap(all, 'daa', 'F', opts)
---- keymap(all, 'doo', 'f', opts)
---- keymap(all, 'dao', 'T', opts)
---- keymap(all, 'doa', 't', opts)
--
--keymap(all, "n", "i", opts)
--keymap(all, "t", "a", opts)
--keymap(all, "N", "I", opts)
--keymap(all, "T", "A", opts)
--
--keymap(all, "(", 'u', opts)
--keymap(all, ")", '<C-r>', opts)
--
--keymap(all, 'r', 'c', opts)
--keymap(all, 'r<Delete>', 'cl', opts)
--keymap(all, 'c', 'y', opts)
--keymap(all, 'w', 'p', opts)
--
--keymap(all, 'C', 'Y', opts)
--keymap(all, 'W', 'P', opts)
--
--
--
--
--
--
---- horizontal movement
--
--keymap(all, "<C-a>", "b", opts)
--keymap(all, "u", "k", opts)
--keymap(all, "e", "j", opts)
--keymap(all, "<C-o>", "w", opts)
---- keymap(all, "i", "e", opts)
--
--keymap(all, 'a<C-a>', '0', opts)
--keymap(all, 'o<C-o>', 'g_', opts)
--
--keymap(all, 'a', 'F', opts)
--keymap(all, 'o', 'f', opts)
--keymap(all, 'A', 'T', opts)
--keymap(all, 'O', 't', opts)
--
--keymap('n', 'rw', [["_dP]], opts)
--
---- vertical movement
--
---- newlines
---- edit
--nrmap('n', 'lu', "ko")
--nrmap('n', 'le', 'o')
---- editless
--nrmap('n', 'lU', "mlko<Esc>`l")
--nrmap('n', 'lE', "mlo<Esc>`l")
---- delete
--nrmap('n', 'l<C-u>', "mlj0i<BS><Esc>`l")
--nrmap('n', 'l<C-e>', "mlk0i<BS><Esc>`l")
--
--
--nrmap('n', '~', '~h')
--
--nrmap(all, 'h', 'q')
--nrmap(all, 's', '@')
--
--nrmap('n', '<leader>=', [[mlgg=G`l]])
--
--
--keymap("v", "<C-u>", ":m '<-2<CR>gv=gv")
--keymap("v", "<C-e>", ":m '>+1<CR>gv=gv")
--
--keymap({"n", "v"}, "<leader><BS>", "d")
--keymap({"n", "v"}, "<leader><BS><BS>", "dd")
--keymap(all, "<BS>", [["_d]], opts)
--keymap(all, "<BS><BS>", [[0"_dg_i<BS><Esc>]], opts)
--
--keymap('n', '<C-r>', function()	vim.lsp.buf.rename() end, { noremap = true, silent = true })
--keymap('v', '<C-r>', '\"fy<Esc>:%s/<C-r>f/',opts)
--keymap("n", "r<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--
--nrmap("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn<Esc>")
--nrmap("n", "<leader>ef", "oif err != nil {<CR>}<Esc>Olog.Fatalln(err)<Esc>")
--nrmap("n", "<leader>ep", "oif err != nil {<CR>}<Esc>Opanic(err)<Esc>")
--nrmap("n", "<leader>el", "oif err != nil {<CR>}<Esc>Oslog.Error(\"error occurred\", \"err\", err)<Esc>")
--
--
---- shoutout (load current file as lua or something)ts
--keymap("n", "<leader>so", function() vim.cmd("so") end)
--
--
---- Map Ctrl+s to :w in normal mode
--keymap(all, '<C-s>', ':w<CR>', opts)
--
---- Map Ctrl+s to :w in insert mode
--keymap('i', '<C-s>', '<Esc>:w<CR>', opts)
--
--keymap(almost, '<leader>WW', 'ZZ', opts)
--keymap(almost, '<leader>WF', ':qa!<CR>', opts)
--
--keymap(almost, 'WW', ':w!<CR>:bd!<CR>', opts)
--keymap(almost, 'WF', ':bd!<CR>', opts)
--
--keymap(almost, '<C-w>', ':bd<CR>', opts)
--keymap(almost, '<leader><C-w>', '<C-w>c', opts)
--
--
--
--
--
--keymap(all, 'p', ':b#<CR>', {noremap = true, silent = true})
--keymap(all, 'P', ':bprevious<CR>', {noremap = true, silent = true})
--keymap(all, '<C-p>', ':bnext<cr>', {noremap = true, silent = true})
--
--
--keymap("n", "-", "<CMD>Oil<CR>" ,opts)
--
--
--
--keymap(all, '>', '', opts)
--keymap(all, '<', 'N', opts)
--keymap(all, '>', 'n', opts)
--
--
---- Splits management
--local leader = '<leader>'
--
---- Movement
--keymap(all, leader .. 'a', '<C-w>h', opts)  -- Move left
--keymap(all, leader .. 'e', '<C-w>j', opts)  -- Move down
--keymap(all, leader .. 'u', '<C-w>k', opts)  -- Move up
--keymap(all, leader .. 'o', '<C-w>l', opts)  -- Move right
--
---- Resizing
--keymap(all, leader .. 'A', '<C-w><', opts)  -- Resize left
--keymap(all, leader .. 'E', '<C-w>+', opts)  -- Resize down
--keymap(all, leader .. 'U', '<C-w>-', opts)  -- Resize up
--keymap(all, leader .. 'O', '<C-w>>', opts)  -- Resize right
--
---- New splits
--keymap(all, leader .. '<C-a>', ':vsp<CR>', opts)  -- Vertical split right
--keymap(all, leader .. '<C-o>', ':vsp<CR><C-w>l', opts)  -- Vertical split left
--keymap(all, leader .. '<C-u>', ':sp<CR>', opts)  -- Horizontal split up
--keymap(all, leader .. '<C-e>', ':sp<CR><C-w>j', opts)  -- Horizontal split down
--
---- Moving splits
--keymap(all, leader .. 'tr', '<C-w>r', opts)  -- Rotate windows
--keymap(all, leader .. 'te', '<C-w>J', opts)  -- Move window down
--keymap(all, leader .. 'tu', '<C-w>K', opts)  -- Move window up
--keymap(all, leader .. 'to', '<C-w>H', opts)  -- Move window left
--keymap(all, leader .. 'ta', '<C-w>L', opts)  -- Move window right
--
--keymap(all, '<leader><C-w>', ':close<CR>', opts)
--
--
--
--keymap('n', '\\', 'gcc', opts)
--keymap('v', '\\', 'gc', opts)
--
--
--keymap("n", "<leader>eo", vim.diagnostic.goto_next)
--keymap("n", "<leader>ea", vim.diagnostic.goto_prev)
--
---- show floating preview of the word currently under the cursor in normal mode
--keymap("n", "dp", function() vim.lsp.buf.hover() end)
--
--vim.g.copilot_no_tab_map = true
--keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', { silent = true, expr = true, replace_keycodes = false})
--
---- toggle copilot enable
--keymap("n", "<leader>tce", ":Copilot enable<CR>")
---- toggle copilot disable
--keymap("n", "<leader>tcd", ":Copilot enable<CR>")
--
--
--keymap('i', '<C-Delete>', '<Esc>wdwi')
--
--
--
--local sub = require('substitute')
--
--keymap('n', 'rw', sub.operator, opts)








































