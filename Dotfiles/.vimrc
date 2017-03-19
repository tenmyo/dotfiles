" global settings
set nocompatible
syntax enable
filetype plugin indent on

" file editing
set modeline
set noswapfile

" cursors
set cursorcolumn
highlight CursorColumn ctermbg=DarkGray guibg=Gray20
autocmd InsertEnter * highlight CursorColumn ctermbg=DarkBlue guibg=DarkBlue
autocmd InsertLeave * highlight CursorColumn ctermbg=DarkGray guibg=Gray20
set cursorline
highlight CursorLine ctermbg=None guibg=Gray20
highlight CursorLineNr cterm=underline ctermbg=None guibg=Gray20


" rulers
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

" filetypes
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

" set cursortype by mode for mintty
" ESC [n SP q
" 0: default
" 1: block blink
" 2: block noblink
" 3: underline blink
" 4: underline noblink
" 5: line blink
" 6: line noblink
let &t_ti.="\e[1 q"   " Startup VIM
let &t_SI.="\e[5 q"   " Enter Insert Mode
let &t_SR.="\e[3 q"   " Enter Replace Mode
let &t_EI.="\e[1 q"   " Leave Edit Mode
let &t_te.="\e[0 q"   " Exit VIM

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

