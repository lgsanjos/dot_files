set rtp+=~/.vim/bundle/Vundle.vim
filetype off

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tomasr/molokai'

call vundle#end()

filetype on
" let g:molokai_original = 1

colorscheme molokai
set background=dark
set t_Co=256
hi Search ctermbg=LightBlue
set showcmd 
set encoding=utf-8
set autoindent
set foldenable
set incsearch
set ignorecase
set cursorline
set tabstop=2 shiftwidth=2 
set showmode
set number
set showmatch
set hlsearch
syntax on
