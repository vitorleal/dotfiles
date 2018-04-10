" no vi compatibility
set nocp


" PLUGINS
" ==============================================
" my plugins config file path
let $MYPLUGINS = '~/.vim/plugins.vim'

" load plugins managed by vundle
exe 'so '.$MYPLUGINS


" EDITION
" ==============================================
syntax enable

" basic edition stuff on
syntax on
filetype on
filetype plugin on
filetype indent on

"color options
set background=dark

" vim icons file type
set encoding=utf8
let g:airline_powerline_fonts = 1

" use unix as standard file type
set fileformats=unix,dos,mac

" always set autoindenting on
set autoindent

" good when starting a new line
set smartindent

" fill tabs with spaces
set expandtab

" 2 spaces everywhere please!
set tabstop=2
set softtabstop=2
set shiftwidth=2

" copy the previous indentation on autoindenting
set copyindent

" don't wrap lines
set nowrap

" show line numbers
set number

" highlight current line
"set cursorline

" auto load files when hanged outside of Vim
set autoread

" allow hidden buffers
set hidden

" color trailing whitespace
hi TrailWhitespace ctermbg=198 guibg=#f62c73
match TrailWhitespace /\s\+$\| \+\ze\t/

" use many undos
set undolevels=500

" do not syntax highlight too long lines
set synmaxcol=300

" keep selection to indent/outdent
vnoremap < <gv
vnoremap > >gv

" after a :vim[grep] map the :cn and :cp
nmap <silent> - :cprevious<cr>
nmap <silent> = :cnext<cr>

" join lines with cursor staying in place
nnoremap J mzJ`z

set backupskip=/tmp/*,/private/tmp/*

" SCROLLING
" ==============================================
" show more lines around cursor when at the edge of file
set scrolloff=3
set sidescrolloff=5

" scroll viewport faster
nnoremap <c-e> 5<c-e>
nnoremap <c-y> 5<c-y>
vnoremap <c-e> 5<c-e>
vnoremap <c-y> 5<c-y>

" keep cursor in position when moving around
set nostartofline


" MAPPINGS
" ==============================================
" change the mapleader from \ to ,
let mapleader=","

" delete all buffers
map <silent> <leader>wp :1,9999bwipeout<cr>


" SPLITS
" ==============================================
" always do vertical splits at right side
" and horizontal splits below
set splitright splitbelow

" equally resize splits on window resize
au! VimResized * :wincmd =

" only have cursorline in current window
au! WinLeave * set nocursorline
au! WinEnter * set cursorline

" open all buffers in vertical split
map <silent> <leader>vb :vertical :ball<cr>


" SEARCH
" ==============================================
" ignore case when searching
set ignorecase

" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" highlight search when typing
set incsearch

" highlight search terms
set hlsearch

" do not highlight when vim starts
nohls

" hide search highlight
nnoremap <silent> <leader>0 :nohls<cr>

" center search
nmap n nzz
nmap N Nzz


" TERMINAL
" ==============================================
" wider number width
set numberwidth=6

" always show status bar
set laststatus=2

" higher command line
set cmdheight=2

" get rid of separation chars
set fillchars=""

" http://items.sjbach.com/319/configuring-vim-right
set wildmenu

" set terminal title
set title

" auto cd to the current buffer directory
set autochdir

" no backup/swap files
set nobackup noswapfile

" shorten vim messages
" see :h shortmess for the breakdown of what this changes
set shortmess=atI

" stop annoying noise
"set visualbell


" FOLDS
" ==============================================
set foldmethod=syntax

" do not fold automatically
set nofoldenable


" SIDEBAR
" =============================================
map <leader>s :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']


" NAVIGATION
" ==============================================
" easy window navigation
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l


" AUTOCOMMANDS
" ==============================================
" remove unwanted trailling spaces on save
au! BufWritePre * :%s/\s\+$//e

" set current path to current file parent directory for better use of :find
au! BufEnter * silent! let &path = expand('%:p:h') . '/**'
au BufNewFile,BufRead *.ejs set filetype=html


" CONTROL P
" ==============================================
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|(node_modules|ENV|bower_components|__pycache__)$'

