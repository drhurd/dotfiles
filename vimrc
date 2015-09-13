"Appearance
syntax on
set t_Co=256
set number

" Airline
set laststatus=2 " airline always on
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark' " explicitly set airline background color

" Syntastic
let g:syntastic_auto_loc_list = 1

"Search behavior
set hlsearch
set smartcase

" Split behavior
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Scrolling
set scrolloff=2

" Mouse behavior
set mouse=a
set ttymouse=sgr

" Set shortcut to toggle tagbar
nmap <F5> :TagbarToggle<CR>

" Vundle-required configuration
" To install Vundle:
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" $ vim +PluginInstall +qall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Plugins
Plugin 'gmarik/Vundle.vim'        " required
Plugin 'rking/ag.vim'             " use the_silver_searcher
Plugin 'kien/ctrlp.vim'           " ctrl-p
Plugin 'fatih/vim-go'             " vim-go
Plugin 'majutsushi/tagbar'        " tagbar
Plugin 'Valloric/YouCompleteMe'   " completion
Plugin 'kchmck/vim-coffee-script' " coffeescript support
Plugin 'scrooloose/syntastic'     " syntax errors
Plugin 'tpope/vim-sleuth'         " smart indentation detection
Plugin 'bling/vim-airline'        " statusline mod
call vundle#end()            " required
filetype plugin indent on    " required

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion=1 "close scratch after completion selected

" Gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

