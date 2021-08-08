if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal spell
setlocal nosmartindent
setlocal textwidth=80
setlocal formatoptions=tcqa2w

nnoremap <buffer> <leader>b :!pdflatex '%'<cr>
nnoremap <buffer> <leader>z :!zathura '%'<cr>
