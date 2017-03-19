" global settings
set nocompatible
syntax enable
filetype plugin indent on


" file editing
set modeline
set noswapfile


" rulers
set cursorcolumn
autocmd InsertEnter * highlight CursorColumn ctermbg=DarkBlue
autocmd InsertLeave * highlight CursorColumn ctermbg=DarkGray
set cursorline
highlight CursorLineNr cterm=underline
set number
set numberwidth=6

" invisible chars
set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:>-,trail:-,eol:$


" search
set hlsearch
set incsearch
set smartcase
set showmatch
set wrapscan

" fyletimes
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileformats=unix,dos,mac

set ambiwidth=double

" status
set laststatus=2 " 0: never, 1: when multi window, 2: always
set statusline=%n:\ %F%h%w%m%r
set statusline+=\ [%Y/%{&fenc!=''?&fenc:&enc}/%{&ff}]
set statusline+=\ (%{strftime(\"%F\ %R\",getftime(expand(\"%:p\")))})
set statusline+=%=
set statusline+=[HEX=0x\%02.2B]
set statusline+=\ [POS=%l,%c]\ [LEN=%L]
set showcmd

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

