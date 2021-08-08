local map = require('utils').map
local set = require('utils').set

-- Install packages with :PackagerInstall --
vim.cmd 'packadd vim-packager'
require('packager').setup(function(packager)
  packager.add('kristijanhusak/vim-packager', { type = 'opt' })
  packager.add('nvim-telescope/telescope.nvim', { requires = {'nvim-lua/plenary.nvim', 'nvin-lua/popup.nvim'} })
  packager.add('hoob3rt/lualine.nvim')
  packager.add('nvim-lua/popup.nvim')
  packager.add('nvim-lua/plenary.nvim')
  packager.add('godlygeek/tabular')
  packager.add('neovim/nvim-lspconfig')
  packager.add('tpope/vim-surround')
  packager.add('tpope/vim-repeat')
  packager.add('tpope/vim-fugitive')
end)

-- Statusline --
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'codedark',
    component_separators = {'', ''}, -- Powerline seperators
    section_separators = {'', ''}, -- Powerline seperators
    disabled_filetypes = {},
    sources = {'nvim_lsp'},
    sections = {'error'},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype', 'encoding', 'fileformat'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
}

-- Telescope mappings --
require('telescope').setup {
  file_sorter =  require'telescope.sorters'.get_fzy_sorter,
}

map('n', '<C-p>', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>')
map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
map('n', '<leader>fo', '<cmd>lua require(\'telescope.builtin\').oldfiles()<cr>')
map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').grep_string()<cr>')
map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>')
map('n', '<leader>fq', '<cmd>lua require(\'telescope.builtin\').quickfix()<cr>')
map('n', '<leader>fl', '<cmd>lua require(\'telescope.builtin\').loclist()<cr>')

-- LSP configuration --
local lsp_attach = function(client)
  lsp_error = { severity = 'Error' }
  lsp_warning = { severity = 'Warning' }
  set('bo', 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  map('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<cr>')
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev(lsp_error)<cr>')
  map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next(lsp_error)<cr>')
  map('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  map('n', '<Leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  map('n', '<Leader>gp', '<cmd>lua vim.lsp.util.preview_location()<cr>')
  map('n', '<Leader>gR', '<cmd>lua vim.lsp.buf.rename()<cr>')
  map('n', '<Leader>ge', '<cmd>lua vim.lsp.diagnostic.set_loclist(lsp_error)<cr>')
  map('n', '<Leader>gw', '<cmd>lua vim.lsp.diagnostic.set_loclist(lsp_warning)<cr>')
  map('n', '<Leader>ga', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  map('n', '<Leader>=', '<cmd>lua vim.lsp.buf.formatting()<cr>')
  map('v', '<Leader>=', '<cmd>lua vim.lsp.buf.range_formatting()<cr>')
end

require('lspconfig').clangd.setup {
  on_attach = lsp_attach;
  cmd = { "clangd", "--background-index", "--clang-tidy" };
}

-- Disable automatic diagnostics annoying me
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false, -- Underlines errors
    signs = false, -- Adds signs in gutter
    virtual_text = false, -- Virtual text after the diagnostic
  }
)
