local set = require('utils').set
local augroup = require('utils').augroup

vim.cmd('filetype plugin indent on')
vim.cmd('set fillchars+=vert:│')
vim.cmd('colorscheme elflord')
augroup('formatting', {
  'ColorScheme * highlight VertSplit cterm=NONE ctermbg=NONE',
  'ColorScheme * highlight NormalFloat cterm=NONE ctermbg=Black',
})
