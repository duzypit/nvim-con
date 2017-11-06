call plug#begin('~/.vim/plugged')


Plug 'scrooloose/nerdtree'				" nerdtree https://github.com/scrooloose/nerdtree
Plug 'thirtythreeforty/lessspace.vim'	" strip the trailing whitespace from the file you are editing
Plug 'Valloric/YouCompleteMe'			" fast, as-you-type, fuzzy-search code completion engine
Plug 'benekastah/neomake'				" plugin to asynchronously run programs
Plug 'Raimondi/delimitMate'				" automatic closing of quotes, parenthesis, brackets, etc.

" color schemes"
Plug 'iCyMind/NeoSolarized'				" Colorscheme for Vim
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'				" statusbar below text window
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'				"git wrapper"
call plug#end() 						" Initialize plugin system

"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent                    	" take indent for new line from previous line
set number							" line numbering
syntax on							" syntax highlight
colorscheme PaperColor 				" set colorshceme
set background=dark					" set background"
set smartindent                   	" enable smart indentation
set autoread                      	" reload file if the file changes on the disk
set autowrite                     	" write when switching buffers
set autowriteall                  	" write on :quit
set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set title                         " let vim set the terminal title
set updatetime=100                " redraw the status bar often
set ruler
"----------------------------------------------
" Plugin: vim-airline/vim-airline
"----------------------------------------------
let g:airline#extensions#tabline#enabled = 1

"----------------------------------------------
" Plugin: 'Valloric/YouCompleteMe
"----------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'		"ycm compilation database
au FileType c,cpp nnoremap <buffer> <c-]> :YcmCompleter GoTo<CR>			"ycm key binding for goto

"----------------------------------------------
" Plugin: 'scrooloose/nerdtree'
"----------------------------------------------
map <F2> :NERDTreeToggle<CR>												" Give a shortcut key to NERD Tree

"----------------------------------------------
" neovim specific settings
"----------------------------------------------

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

" Allow vim to set a custom font or color for a word
syntax enable

" Set the leader button
let mapleader = ','

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Center the screen quickly
nnoremap <space> zz

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch                     " move to match as you type the search query
set hlsearch                      " disable search result highlighting

if has('nvim')
    set inccommand=split          " enables interactive search and replace
endif

" Clear search highlights
map <leader>c :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"----------------------------------------------
" Navigation
"----------------------------------------------
" Disable arrow keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" Move between buffers with Shift + arrow key...
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>

" ... but skip the quickfix when navigating
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" Fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>
