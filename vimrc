set nocompatible              " be iMproved, required
filetype off                  " required

" Install plugins with Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" More plugins to consider: syntastic, incsearch, easymotion, over, argwrap
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax
syntax on

" Underline active line
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" Spacing control
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set textwidth=100

" Tab mappings
inoremap <S-Tab> <C-D>
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" General editing settings
set list lcs=trail:·,tab:»· " Display trailing spaces/tabs
set lbr " Break overflow lines between words
set scrolloff=5 " show lines above cursor
set laststatus=2 " show file status
set lazyredraw

" Plugin settings
map <C-t> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
let g:ackprg = 'rg --no-heading --vimgrep'

"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
