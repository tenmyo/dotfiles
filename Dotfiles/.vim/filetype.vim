" .vim/filetype.vim
if exists('dit_load_filetypes')
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile .textlintrc setfiletype json
augroup END

