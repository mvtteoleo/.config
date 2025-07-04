vim.g.have_nerd_font = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.cursorline = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- vim.cmd [[colorscheme default]]
vim.cmd [[colorscheme catppuccin-latte]]
-- vim.cmd [[colorscheme desert]]

vim.opt.spell = false
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.wrap = true
vim.wo.linebreak = true
-- -- Chiudi parentesi
-- vim.keymap.set('i', '(' , '()<ESC><ESC>i')
-- vim.keymap.set('i', '{' , '{}<ESC><ESC>i')
-- vim.keymap.set('i', '[' , '[]<ESC><ESC>i')
-- vim.keymap.set('n', 'ò' , '$')
-- Comodo per scorrere, zz mette a centro pg la riga
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
--vim.keymap.set('n', '<C-k>', 'i$_{}^{}$<ESC>T{;i')
--vim.keymap.set('n', '<C-j>', 'i\\partial{ }_{ } <ESC>T{;i')

vim.keymap.set('n', '<ESC>', ':noh<CR>', { silent = true })
-- TAB MOVEMENT
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true })   -- New tab
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true }) -- Close tab
vim.keymap.set('n', '<leader>l',  'gt', { noremap = true })                            -- Next tab
vim.keymap.set('n', '<leader>h',  'gT', { noremap = true })                            -- Prev tab
vim.keymap.set('n', '<leader>nt', ':tabnew term://bash<CR>', { noremap = true, silent = true })   -- Term in new tab

-- end TAB

vim.keymap.set("n", "<leader>tt", function()
  require("todo_popup").show()
end, { desc = "Show matching TODO popup" })

