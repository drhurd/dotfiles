"Appearance
syntax on
set t_Co=256
set number

"Search behavior
set hlsearch
set smartcase

"Indents and Tabs
set smartindent 
set tabstop=2
set shiftwidth=2

"Scrolling
set scrolloff=2
set mouse=a

" Vundle-required configuration
" To install Vundle: 
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" $ vim +PluginInstall +qall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'	" required
Plugin 'rking/ag.vim'				" use the_silver_searcher
Plugin 'kien/ctrlp.vim'			" ctrl-p
Plugin 'fatih/vim-go'       " vim-go

call vundle#end()            " required
filetype plugin indent on    " required
