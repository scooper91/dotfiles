if has("gui_running")
	autocmd VimEnter * NERDTree
	set guioptions-=T "don't show toolbar
	set guioptions-=l " Hide the left hand toolbar
	set guioptions-=r " Hide the right hand toolbar
	set guioptions-=b " Hide the bottom hand toolbar
"else
"	set shell=/usr/bin/bash
endif

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

set hidden
set number "view line numbers
set tabstop=4 "spaces per tab
set shiftwidth=4
set complete+=k
set nocompatible
set cursorline
set backspace=indent,eol,start "Allow backspacing over these chars
set noswapfile
set mouse=a "allow mouse
syntax on

"Case-insensitive search, unless mixed case is used
set ignorecase
set smartcase
set incsearch
set hlsearch

"Start gVim in full screen
au GUIEnter * simalt ~x

" Plugins
""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'bronson/vim-visual-star-search'
Plugin 'rking/ag.vim'
let g:ag_working_path_mode="r"

Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](node_modules|\.git)$',
\ }

"Use ag or git for autocompletion
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

Plugin 'mustache/vim-mustache-handlebars'
au BufNewFile,BufRead *.handlebars setlocal filetype=mustache

Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jshint', 'eslint']

Plugin 'altercation/vim-colors-solarized'
set background=dark
set t_Co=256
let g:solarized_visibility = 'low'

Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-commentary' " gc to comment line
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

call vundle#end()

noremap <F2> :NERDTreeToggle<CR>
nmap <SPACE> <SPACE>:noh<CR>

colorscheme solarized

set listchars=tab:\ \ ,trail:_
hi SpecialKey ctermfg=red guifg=red
set list
set exrc
set secure

" Closes vim if NERDTree is the only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

filetype off
filetype plugin indent on
