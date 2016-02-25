set nocompatible
set backspace=eol,start,indent

"set t_kb=^V<BS>
"fixdel

syntax enable
set hlsearch
set number
set autoindent
" size of a hard tabstop
set tabstop=2
set showcmd
set cmdheight=2

set smartindent
set tabstop=2
" size of an "indent"
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

"set nowrap
set wrap
set textwidth=0

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
"set softtabstop=4

" make "tab" insert indents instead of tabs at the beginning of a line
"set smarttab

nmap <CR> G

map <F2> :bprevious<CR>
map <F3> :bnext<CR>
nmap <F9> :set ignorecase!<CR>

nnoremap Q <nop>

"inoremap
inoremap jk <Esc> 

autocmd FileType make setlocal noexpandtab

set listchars=eol:$,tab:¦·
