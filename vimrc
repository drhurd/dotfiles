" Appearance
syntax on
set t_Co=256
set number
set linebreak
set scrolloff=2 " 2 lines of padding for cursor

" mouse
set mouse=a

" Key mappings
nmap ; :
set backspace=2
noremap qq <Esc>
inoremap qq <Esc>
inoremap <Esc> <Nop>

" Search behavior
set hlsearch   " highlight matches
set ignorecase " these 2 together are only case sensitive when search has an uppercase letter
set smartcase

" Split behavior
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Indents and Tabs
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
" Typescript - 2 spaces
autocmd FileType typescript set expandtab
autocmd FileType typescript set shiftwidth=2
autocmd FileType typescript set softtabstop=2
" Javascript - 2 spaces
autocmd FileType javascript set expandtab
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set softtabstop=2
" Coffeescript - 2 spaces
autocmd FileType coffee set expandtab
autocmd FileType coffee set shiftwidth=2
autocmd FileType coffee set softtabstop=2
" Go - tabs not spaces
autocmd FileType go set noexpandtab
autocmd FileType go set tabstop=3
autocmd FileType go set shiftwidth=3
autocmd FileType go set softtabstop=3

"""
""" PLUGINS
"""

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
" Search
Plugin 'rking/ag.vim'             " use the_silver_searcher
Plugin 'kien/ctrlp.vim'           " ctrl-p
" Display Features
Plugin 'bling/vim-airline'        " statusline mod
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'      " sidebar to see files and directories
Plugin 'majutsushi/tagbar'        " tagbar to see go structs/functions
" git
Plugin 'airblade/vim-gitgutter'   " Shows git diffs in the gutter
Plugin 'tpope/vim-fugitive'       " vim git integration (for airline)
" Language support
Plugin 'Valloric/YouCompleteMe'   " completion
Plugin 'scrooloose/syntastic'     " syntax errors
Plugin 'fatih/vim-go'             " vim-go
Plugin 'kchmck/vim-coffee-script' " coffeescript support
Plugin 'groenewege/vim-less'      " syntax highlighting for .less files
Plugin 'leafgarland/typescript-vim' " typescript syntax
Plugin 'pangloss/vim-javascript'    " javascript syntax - required for vim-jsx
Plugin 'mxw/vim-jsx'                " jsx syntax highlighting
Plugin 'digitaltoad/vim-pug.git'    " jade/pug syntax highlighting
" Other
Plugin 'raimondi/delimitmate'

call vundle#end()            " required
filetype plugin indent on    " required

" Airline
set laststatus=2 " airline always on
let g:airline_theme = 'wombat'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"delimitMate
let g:delimitMate_expand_cr=2

" Syntastic
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_typescript_checkers = ['tslint', 'eslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion=1 "close scratch after completion selected

" NerdTree shortcut
nnoremap <Leader>T :NERDTreeToggle<CR>

" Tagbar shortcut
nnoremap <Leader>t :TagbarToggle<CR>

" GitGutter off by default
let g:gitgutter_enabled = 0

" CtrlP
" Map space to CtrlP
nnoremap <Space> :CtrlP<CR>
set wildignore+=node_modules " Set folders to ignore

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

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

