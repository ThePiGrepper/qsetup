"vim plugin - Vundle plugin manager
"required for Vundle
set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternately, pass a path where Vundle can install plugins
"call vundle#begin('~/some/path')

"add plugins to be handled by Vundle, starting with itself
Plugin 'VundleVim/Vundle.vim'

"more plugins...
Plugin 'tpope/vim-surround'
"Plugin 'FSwitch'
Plugin 'vimwiki/vimwiki'
Plugin 'http://github.com/sjl/gundo.vim.git'

"Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

"youcompleteme config
"let g:ycm_global_ycm_extra_conf = '~/work/MCU/vault/sandbox/stm32-template/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0

"back to my vimrc
set backspace=eol,start,indent

"set t_kb=^V<BS>
"fixdel

nnoremap <F5> :GundoToggle<CR>

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

"undo config
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" mapping
nmap <CR> G

map <F2> :bprevious<CR>
map <F3> :bnext<CR>
nmap <F9> :set ignorecase!<CR>

nnoremap Q <nop>

"inoremap
inoremap jk <Esc> 
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
inoremap <C-c> <Esc>

autocmd FileType make setlocal noexpandtab

set listchars=eol:$,tab:¦·