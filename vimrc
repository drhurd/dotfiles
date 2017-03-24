"""
""" GENERAL
"""
syntax on
set t_Co=256
set linebreak
set scrolloff=2 " 2 lines of padding for cursor
set backupcopy=yes " so reload-on-save always works
set backspace=2
" set clipboard=unnamed " allows vim w/ +clipboard to work with osx pbcopy/pbpaste

" mouse
set mouse=a

" Line Numbers
set number
set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Searching
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"""
""" KEY MAPPINGS
"""
let mapleader=","
" no one uses semicolon
nmap ; :
" remap qq to escape
noremap qq <Esc>
inoremap qq <Esc>
" change macros to leader-m
noremap q <Nop>
noremap <Leader>m q

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


"""
""" INDENTS AND TABS
"""
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
Plugin 'gmarik/Vundle.vim'        " required

" Filesystem
Plugin 'kien/ctrlp.vim'           " ctrl-p
Plugin 'scrooloose/nerdtree'      " sidebar to see files and directories

" Code analysis
Plugin 'w0rp/ale'                 " async autocomplete
Plugin 'majutsushi/tagbar'        " tagbar to see go structs/functions

" Display
Plugin 'bling/vim-airline'        " statusline mod
Plugin 'vim-airline/vim-airline-themes'

" git
Plugin 'tpope/vim-fugitive'       " vim git integration (for airline)

" Language support
Plugin 'Valloric/YouCompleteMe'   " completion
Plugin 'fatih/vim-go'             " vim-go
Plugin 'kchmck/vim-coffee-script' " coffeescript support
Plugin 'groenewege/vim-less'      " syntax highlighting for .less files
Plugin 'leafgarland/typescript-vim' " typescript syntax
Plugin 'pangloss/vim-javascript'    " javascript syntax - required for vim-jsx
Plugin 'mxw/vim-jsx'
Plugin 'digitaltoad/vim-pug.git'    " jade/pug syntax highlighting

" Other
Plugin 'raimondi/delimitmate'

call vundle#end()            " required
filetype plugin indent on    " required

"""
""" PLUGIN SETTINGS
"""
" Airline
set laststatus=2 " airline always on
let g:airline_theme = 'wombat'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" delimitMate
let g:delimitMate_expand_cr=2

" ale
let g:ale_sign_error = '>>'
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_linters = {
   \ 'jsx': ['eslint'],
   \ 'javascript': ['eslint'],
   \ 'typescript': ['eslint', 'tslint'],
   \ 'go': ['gofmt -e', 'go vet', 'golint'],
   \ }

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion=1 "close scratch after completion selected

" NerdTree shortcut
nnoremap <Leader>T :NERDTreeToggle<CR>

" Tagbar shortcut
nnoremap <Leader>t :TagbarToggle<CR>

" CtrlP
" Map space to CtrlP
nnoremap <Space> :CtrlP<CR>
set wildignore+=node_modules " Set folders to ignore

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

