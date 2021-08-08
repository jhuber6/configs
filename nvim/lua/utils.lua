local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true, nowait = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end 

function M.set(mode, option, value)
  vim[mode][option] = value
  if mode ~= 'o' then
    vim['o'][option] = value
  end
end

function M.setvar(variable, value)
  vim.api.nvim_set_var(variable, value)
end


function M.augroup(group, commands)
  vim.cmd('augroup' .. ' ' .. group)
  vim.cmd('autocmd!');
  for _, command in ipairs(commands) do
    vim.cmd('autocmd' .. ' ' .. command)
  end
  vim.cmd('augroup end');
end

return M
