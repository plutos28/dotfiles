" General settings
set nocompatible " no vi compatible
filetype off " required

" Plugin management
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'tomtom/tcomment_vim'
Plug 'raimondi/delimitmate'
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
" Initialize plugin system
call plug#end()

set encoding=utf-8
set noswapfile " no annoying swap files
syntax on
set number

set ruler
set belloff=all " turn off all bells
set laststatus=2 " status bar

" indentation
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start

" better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set showmode
set showcmd

" searching stuff
set hlsearch 
set incsearch
set ignorecase
set smartcase
set showmatch

" colors and font
set t_Co=256
set background=dark
colorscheme wal

if has("gui_running")
    colorscheme solarized 
    "set guifont=Fira_Code_Regular:h11 
    set guifont=Hack:h10.5 
endif

" remove gui elements
set guioptions-=m " menu bar
set guioptions-=T " toolbar
set guioptions-=r " right-hand scroll bar
set guioptions-=L " left-hand scroll bar

" nerdtree 
map <C-n> :NERDTreeToggle<CR>

