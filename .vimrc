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
set scrolloff=2
set timeoutlen=1000 ttimeoutlen=0 "No esc delay
syntax on

"Case-insensitive search, unless mixed case is used
set ignorecase
set smartcase
set incsearch
set hlsearch

"Start gVim in full screen
au GUIEnter * simalt ~x

map <Leader>f :NERDTreeFind<CR>
map <Leader>tc :tabclose<CR>

" Plugins
""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'bronson/vim-visual-star-search'
Plugin 'editorconfig/editorconfig-vim'
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
let g:syntastic_python_checkers=['flake8']

Plugin 'altercation/vim-colors-solarized'
set background=dark
set t_Co=256
let g:solarized_visibility = 'low'

Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-commentary' " gc to comment line
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline#extensions#whitespace#trailing_format = '%s:trailing'

call vundle#end()

function! BD()
	let restoreStateCmds = []
	"Don't accidentally delete certain buffers
	if @% == 'NERD_tree_1'
		NERDTreeClose
		:call add(restoreStateCmds, 'NERDTreeFocus')
	endif
	if &buftype == 'quickfix'
		ccl
		:call add(restoreStateCmds, 'copen')
	endif

	"Don't lose splits
	b# "Go to last used buffer
	bd # "Close previous buffer (buffer before b#)
	try
		buffer
	catch
		"Last used buffer we've ended up in has previously been bd'd (hidden)
		"bd again to hide it and go to a visible buffer
		bd
	endtry

	for cmd in restoreStateCmds
		execute(cmd)
	endfor
endfunction

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
