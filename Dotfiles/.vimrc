set nocompatible
syntax enable
filetype plugin indent on

set number
set numberwidth=6
set ruler

set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:>-,trail:-,eol:$

set showcmd

set hlsearch
set incsearch
set smartcase
set showmatch
set wrapscan

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileformats=unix,dos,mac

set ambiwidth=double

set modeline

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

