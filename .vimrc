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
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'easymotion/vim-easymotion'
" Initialize plugin system
call plug#end()

set encoding=utf-8
set noswapfile " no annoying swap files
syntax on
set number

set ruler
set belloff=all " turn off all bells
set laststatus=2 " status bar

" vim history
set history=500

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" leader key
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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
augroup FixColorscheme
    autocmd!
    autocmd Colorscheme * highlight Normal ctermbg=NONE
augroup END
set termguicolors
let ayucolor="light"
colorscheme ayu 

if has("gui_running")
    set guifont=JetBrains\ Mono\ 17
endif

" remove gui elements
set guioptions-=m " menu bar
set guioptions-=T " toolbar
set guioptions-=r " right-hand scroll bar
set guioptions-=L " left-hand scroll bar

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" fzf
"nnoremap <C-p> :GFiles<Cr>
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
nnoremap <silent><leader>b :Buffers<Cr>

" fixes annoying black background on kitty
let &t_ut=''