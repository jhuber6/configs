local abbreviations = {
  Wq = 'wq',
  WQ = 'wq',
  Wqa = 'wqa',
  W = 'w',
  Q = 'q',
  Qa = 'qa',
  tb = 'tabedit'
}

for left,right in pairs(abbreviations) do
  vim.cmd(string.format('cnoreabbrev %s %s', left, right))
end
