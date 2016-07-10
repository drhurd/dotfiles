"Appearance
syntax on
set t_Co=256
set number
set linebreak

"Search behavior
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

"Fix backspace
set backspace=2

"Indents and Tabs
set smartindent

"Scrolling
set scrolloff=2

" Mouse behavior
set mouse=a
set ttymouse=sgr

" Key mappings
nmap ; :
nmap <Up> <C-u>
nmap <Down> <C-d>
inoremap {<CR> {<CR><CR>}<Up><Tab>

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
Plugin 'lukaszkorecki/CoffeeTags' " coffeescript support for tagbar
Plugin 'groenewege/vim-less'      " syntax highlighting for .less files
Plugin 'leafgarland/typescript-vim' " typescript syntax
Plugin 'pangloss/vim-javascript'    " javascript syntax - required for vim-jsx
Plugin 'mxw/vim-jsx'                " jsx syntax highlighting
Plugin 'digitaltoad/vim-pug.git'    " jade/pug syntax highlighting
" Other
Plugin 'tpope/vim-sleuth'         " smart indentation detection

call vundle#end()            " required
filetype plugin indent on    " required

" Airline
set laststatus=2 " airline always on
let g:airline_theme = 'solarized'
" set airline bar depending on BGCOLOR env var
if $BGCOLOR == 'light'
    let g:airline_solarized_bg = 'light' " explicitly set airline background color
else
    let g:airline_solarized_bg = 'dark'
endif

" Syntastic
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_typescript_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion=1 "close scratch after completion selected

" NerdTree shortcut
nnoremap T :NERDTreeToggle<CR>

" Tagbar shortcut
nnoremap t :TagbarToggle<CR>

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

" Vim-go
let g:godef_split = "split"

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

