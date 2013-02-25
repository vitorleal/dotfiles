colorscheme BusyBee

" EDIT
" ==============================================
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


" PLUGINS
" ==============================================

" my plugins config file path
let $MYPLUGINS = '~/.vim/plugins.vim'

" load plugins managed by vundle
exe 'so '.$MYPLUGINS


" highlight trailing whitespace (and tabs)
" http://nvie.com/posts/how-i-boosted-my-vim/
set list
set listchars=tab:>-,trail:·

" color trailing whitespace
highlight TrailWhitespace ctermbg=red guibg=#f62c73
match TrailWhitespace /\s\+$\| \+\ze\t/

" do not syntax highlight too long lines
set synmaxcol=500

" join lines with cursor staying in place
nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<CR>



" SCROLLING
" ==============================================

" show more lines around cursor when at the edge of file
set scrolloff=3
set sidescrolloff=5

" scroll viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>



" SPELLING
" ==============================================

" fix my common spelling mistakes
iab slef self
iab tihs this
iab functino function
iab getElementByID getElementById



" quick save
map <leader>w :w<CR>

" select all and keep cursor in place
nmap <leader>a ggVG

" force save of files with root permission
com! W :w !sudo tee %
map <leader>W :W<CR>

" maximize vim window
com! MAX :let &lines=500<bar>let &columns=500
map <leader>m :MAX<CR>

" easy add new line in normal mode
nnoremap <CR> o<ESC>k

" easy remove line in normal mode
" (copy to _ for not losing the last register)
nnoremap <BS> "_dd

" easey copy/paste from/to system clipboard
map <leader>yy "*y
map <leader>pp "*p
map <leader>YY "*Y
map <leader>PP "*P

" list current dir files
nmap <C-p> :e <C-d>


" SPLITS
" ==============================================

" always do vertical splits at right side
" and horizontal splits below
set splitright splitbelow

" equally resize splits on window resize
au! VimResized * wincmd=

" only have cursorline in current window
au! WinLeave * set nocursorline
au! WinEnter * set cursorline

" move splits around
nnoremap <leader>sl <C-w><S-h>
nnoremap <leader>sr <C-w><S-l>
nnoremap <leader>st <C-w><S-k>
nnoremap <leader>sb <C-w><S-j>


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
nnoremap <silent> <leader>0 :nohls<CR>

" don't move on *
nnoremap * *<C-o>

" center search
nmap n nzz
nmap N Nzz



" TERMINAL
" ==============================================

let s:txtwidth=120

" limit textwidth
exe 'set textwidth=' . s:txtwidth

" highlight column limit
exe 'set colorcolumn=' . s:txtwidth

" wider number width
set numberwidth=6

" disable blinking cursor
set guicursor=a:blinkon0

" always show status bar
set laststatus=2

" my status line
set statusline=\ #%n\ %f\ %m\ %r\ Line\ %l\ %P\ \ Column\ %c%=\ [%{&ff}]\ %{&ft}

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
set visualbell

" restore messed up vim and splits
map <F5> :redraw!<CR><c-w>=



" FOLDS
" ==============================================

set foldmethod=syntax

" do not fold automatically
set nofoldenable

" toggle folds with space bar
nnoremap <silent> <Space> za

" allow syntax foldmethod for javascript
let javaScript_fold=1



" NAVIGATION
" ==============================================

" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" easy tab navigation
map <S-l> :tabnext<CR>
map <S-h> :tabprevious<CR>


" AUTOCOMMANDS
" ==============================================

" remove unwanted trailling spaces on save
au! BufWritePre * :%s/\s\+$//e

" set current path to current file parent directory for better use of :find
au! BufEnter * silent! let &path = expand('%:p:h') . '/**'

" enter key goes to error in quickfix window (CoffeeLint fix)
au! BufWinEnter quickfix nmap <buffer> <Enter> :.cc<CR>

