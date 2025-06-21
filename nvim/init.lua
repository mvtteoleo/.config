vim.g.have_nerd_font = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ENABLE CURSORLINE ONLY IN THE ACTIVE WINDOW
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline"
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  pattern = "*",
  command = "set nocursorline"
})
-- end cursorline

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
-- In normal mode, make <Esc> also clear search highlight
vim.keymap.set('n', '<Esc>', '<Esc>:nohlsearch<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.opt.spell = false
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.wrap = true
vim.wo.linebreak = true
--Chiudi parentesi
vim.keymap.set('i', '(' , '()<ESC><ESC>i')
vim.keymap.set('i', '{' , '{}<ESC><ESC>i')
vim.keymap.set('i', '[' , '[]<ESC><ESC>i')
vim.keymap.set('n', 'ò' , '$')
-- Comodo per scorrere, zz mette a centro pg la riga
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- TAB MOVEMENT
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true })   -- New tab
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true }) -- Close tab
vim.keymap.set('n', '<leader>l',  'gt', { noremap = true })                            -- Next tab
vim.keymap.set('n', '<leader>h',  'gT', { noremap = true })                            -- Prev tab
-- end TAB
--
-- LUALINE
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
