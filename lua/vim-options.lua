vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set scrolloff=10")
vim.g.mapleader = " "

vim.wo.relativenumber = true

vim.keymap.set("n", "<c-z>", "u")
vim.keymap.set("n", "<c-s>", ":wa<CR>", {})
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', 'G', 'Gzz')
vim.keymap.set('n', 'gg', 'ggzz')

vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', 'J', '20jzz')
vim.keymap.set('n', 'K', '20kzz')
