"make vim not try to pretend to be vi
set nocompatible

nnoremap <SPACE> <Nop>
let mapleader=" "

set number
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
set laststatus=2

"allow buffer switching without saving
set hidden

"allows search (:find) down into subfolders
set path+=**

set wildmenu

"allows faster vim-gitgutter response
set updatetime=300

"insert mode blinking bar
let &t_SI = "\e[5 q"
"non-insert mode blinking block
let &t_EI = "\e[1 q"

"inside tmux, vim does not detect dark background
set background=dark

"vim-plug settings and user specific plugins stored in /.vim/autoload
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yegappan/lsp'
call plug#end()

let lspServers = [
		\     #{
		\	 filetype: 'sh',
		\	 path: '/Users/chris/.nvm/versions/node/v10.20.1/bin/bash-language-server',
		\	 args: ['start']
		\      },
		\     #{
    \	 filetype: ['scala', 'sbt'],
		\	 path: '/Users/chris/Library/Application Support/Coursier/bin/metals',
		\	 args: []
		\      }
		\   ]
autocmd VimEnter * call LspAddServer(lspServers)

let lspOpts = {'autoHighlightDiags': v:true}
autocmd VimEnter * call LspOptionsSet(lspOpts)

noremap <leader>h :LspHover<CR>
noremap <leader>d :LspPeekDefinition<CR>
noremap <leader>D :LspGotoDefinition<CR>
noremap <leader>r :LspPeekReferences<CR>
noremap <leader>R :LspShowReferences<CR>
noremap <leader>i :LspPeekImpl<CR>
noremap <leader>I :LspGotoImpl<CR>
noremap <leader>f :LspHighlightClear<CR> :LspHighlight<CR>
noremap <leader>F :LspHighlightClear<CR>

