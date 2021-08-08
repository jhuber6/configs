local set = require('utils').set
local setvar = require('utils').setvar

-- Window controls
set('o', 'report', 0)
set('o', 'scrolloff', 10)
set('o', 'showtabline', 2)
set('o', 'hidden', true)
set('o', 'mouse', 'a')
set('o', 'signcolumn', 'no')
set('o', 'splitright', true)
set('o', 'background', 'dark')

-- Encoding
set('o', 'encoding', 'utf-8')

-- General settings
set('o', 'undofile', true)
set('o', 'wildmode', 'list:longest')
set('o', 'wildmenu', true)
set('o', 'showcmd', true)
set('o', 'visualbell', true)
set('o', 'completeopt', 'menuone')

-- Text formatiing
set('wo', 'wrap', false)
set('bo', 'textwidth', 80)
set('o', 'tabstop', 2)
set('o', 'shiftwidth', 2)
set('o', 'softtabstop', 2)
set('o', 'expandtab', true)
set('o', 'smarttab', true)
set('o', 'autoindent', true)
set('o', 'smartindent', true)
set('wo', 'number', true)
set('wo', 'relativenumber', true)

-- Status line
set('o', 'ruler', true)
set('o', 'showmode', false)
set('o', 'laststatus', 2)

-- Searching
set('o', 'showmatch', true)
set('o', 'ignorecase', true)
set('o', 'smartcase', true)
set('o', 'hlsearch', true)
set('o', 'incsearch', true)
set('o', 'gdefault', false)

-- Netrw settings
setvar('netrw_banner', 0)
setvar('netrw_liststyle', 3)
setvar('netrw_browse_split', 0)
setvar('netrw_altv', 1)
setvar('netrw_winsize', 15)
