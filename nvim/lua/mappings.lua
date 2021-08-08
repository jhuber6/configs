local map = require('utils').map
local augroup = require('utils').augroup

-- Set leader
map('n', '<Space>', '')
vim.g.mapleader = ' '

-- Navigation
map('n', '<Leader>w', '<C-w>')
map('i', 'jj', '<Esc>')
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', '<Leader>h', '<cmd>noh<cr>')

-- Spelling
map('n', '<C-l>', '[s1z=<C-O>')
map('i', '<C-l>', '<Esc>[s1z=`]a')

-- Terminal control
map('n', '<C-w>t', '<c-w>v:terminal<cr>a')
map('t', '<C-w>', '<C-\\><C-n><C-w>')
map('t', '<C-w>', '<C-\\><C-n><C-w>')
map('t', '<Esc>', '<C-\\><C-n>')
augroup('terminals', {'TermOpen * setlocal nonumber norelativenumber'})

-- Quickfix helpers
map('n', '<Leader>cc', '<cmd>:cclose<cr>')
map('n', '<Leader>cn', '<cmd>:cnext<cr>')
map('n', '<Leader>cp', '<cmd>:cprev<cr>')
map('n', '<Leader>co', '<cmd>:copen<cr>')

-- Location list helpers
map('n', '<Leader>lc', '<cmd>:lclose<cr>')
map('n', '<Leader>ln', '<cmd>:lnext<cr>')
map('n', '<Leader>lp', '<cmd>:lprev<cr>')
map('n', '<Leader>lo', '<cmd>:lopen<cr>')

-- Set `make` to call Ninja
vim.cmd(':command Ninja set makeprg=ninja')

-- Netrw
map('n', '_', '<cmd>Explore<cr>')

-- Save cursor position in the buffer
vim.cmd([[autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif]])
