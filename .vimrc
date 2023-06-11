"make vim not try to pretend to be vi
set nocompatible

nnoremap <SPACE> <Nop>
let mapleader=" "

set backspace=indent,eol,start

set relativenumber
syntax enable

"attempt to determine type of file and use intelligent auto-indenting,
"combination of filetype on, filetype plugin on, filetype indent on
filetype plugin indent on

set expandtab
set tabstop=2
set shiftwidth=2
set mouse=a

"show partial commands in last line of screen
set showcmd

set noundofile
set nobackup
set hlsearch
set incsearch
set cursorline
set ruler
set laststatus=1

"allow buffer switching without saving
set hidden

"allows search (:find) down into subfolders
set path+=**

set wildmenu

"allows faster vim-gitgutter response
set updatetime=100

"insert mode blinking bar
let &t_SI = "\e[5 q"
"non-insert mode blinking block
let &t_EI = "\e[1 q"

"inside tmux, vim does not detect dark background
set background=dark

"vim-plug settings and user specific plugins stored in /.vim/autoload
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
call plug#end()

