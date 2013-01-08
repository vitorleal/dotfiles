""" EDITION
colorscheme BusyBee
syntax on

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set copyindent
set nowrap
set number
set cursorline
set history=1000
set undolevels=1000
set pastetoggle=<F2>
set mouse=a

" auto load files if vim detects they have been changed outside of Vim
set autoread
set hidden

" ignore some files when autocomplete
set wildignore=*.swp,*.bak,*.pyc,*.class

" fix my common spelling mistakes
iab slef self
iab functino function

" keep selection to (in/out)dent
vnoremap < <gv
vnoremap > >gv

" easy add new line in normal mode
nnoremap <CR> o<ESC>

" make j/k move to next visual line instead of pysical line
" http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" do not generate backup nor swap files
set nobackup
set noswapfile

" always do vertical splits at right side and always do horizontal splits below
set splitright
set splitbelow

" highlight trailing whitespace
set list listchars=trail:.,extends:#,nbsp:.

" remove unwanted trailling spaces
autocmd BufWritePre * :%s/\s\+$//e

""" SEARCH
" ignore case when searching
set ignorecase
set incsearch
set smartcase
set hlsearch
nmap <silent> ,0 :nohlsearch<CR>

""" TERMINAL
" change the current working directory to where the current file is on
set autochdir

""" FOLDS
set foldmethod=syntax

" toggle folds with space bar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

""" EASY EDIT/SOURCE VIMRC
nnoremap <silent> <F7> :e ~/.vimrc<CR>
nnoremap <silent> <S-F7> :so ~/.vimrc<CR>

""" NAVIGATION
" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""" OTHER MAPPINGS
" change the mapleader from \ to ,
let mapleader=","

" - is the new : (i.e. -w to save) faster instead of shift+:
nnoremap - :
