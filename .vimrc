" no vi compatibility
set nocp


" PLUGINS
" ==============================================
" my plugins config file path
let $MYPLUGINS = '~/.vim/plugins.vim'

" load plugins managed by vundle
exe 'so '.$MYPLUGINS


" GVIMRC
" ==============================================
" define gvimrc here
if has('gui_running')
  if has('mac')
    set guifont=Monaco:h12
  else
    set guifont=Courier_New:h10:cANSI
  endif
endif


" EDITION
" ==============================================
syntax enable
set background=light

" basic edition stuff on
syntax on
filetype on
filetype plugin on
filetype indent on

"solarized options
colorscheme Dracula

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
set cursorline

" auto load files when hanged outside of Vim
set autoread

" allow hidden buffers
set hidden

" color trailing whitespace
hi TrailWhitespace ctermbg=198 guibg=#f62c73
match TrailWhitespace /\s\+$\| \+\ze\t/

" use many undos
set undolevels=1000

" do not syntax highlight too long lines
set synmaxcol=500

" keep selection to indent/outdent
vnoremap < <gv
vnoremap > >gv

" join lines with cursor staying in place
nnoremap J mzJ`z

" set mouse
"set mouse=a


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

" - is the new : (i.e. -w to save) faster instead of shift+:
nnoremap - :

" easy :bd
map <silent> <leader>bd :bd<cr>

" delete all buffers
map <silent> <leader>wp :1,9999bwipeout<cr>

" quick save
map <leader>w :w<cr>

" select all
nmap <leader>a ggVG

" force save of files with root permission
com! W :w !sudo tee %
map <leader>W :W<cr>

" maximize vim window
map <leader>m :let &lines=500<bar>let &columns=500<cr>

" minimize vim window
map <leader>n :let &lines=35<bar>let &columns=140<bar>winpos 150 110<cr>

" make j/k move to next visual line instead of pysical line
" http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" easy move lines in all modes
imap <a-j> <esc>mz:m+<cr>`zi
imap <a-k> <esc>mz:m-2<cr>`zi
nmap <a-j> mz:m+<cr>`z
nmap <a-k> mz:m-2<cr>`z
vmap <a-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <a-k> :m'<-2<cr>`>my`<mzgv`yo`z

" easy add new line in normal mode
" without moving the cursor
nnoremap <cr> mzo<esc>`z

" easy remove line in normal mode
" (copy to _ for not losing the last register)
nnoremap <BS> "_dd

" easy copy/paste from/to system clipboard
map <leader>yy "*y
map <leader>pp "*p
map <leader>YY "*Y
map <leader>PP "*P

" list current dir files and folders
nmap <c-p> :e <c-d>

" quick install new bundles
map <leader>bi :BundleInstall<cr>

" easy open buffer in new tab
map <leader>te :ls<cr>:tabedit #

" guizoom.vim mappings
map <leader>+ :ZoomIn<cr>
map <leader>- :ZoomOut<cr>
map <leader>= :ZoomReset<cr>

" function to yank lines and keep cursor in position
function! YankInPlace()
  " save last cursor position
  let p=getpos('.')
  " yank current visual selection to reg x
  normal gv"xy
  " set last cursor position
  call setpos('.', p)
endfunction

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

" move splits around
nnoremap <leader>sl <c-w><s-h>
nnoremap <leader>sr <c-w><s-l>
nnoremap <leader>st <c-w><s-k>
nnoremap <leader>sb <c-w><s-j>

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

" don't move on *
nnoremap * *<c-o>

" center search
nmap n nzz
nmap N Nzz



" TERMINAL
" ==============================================
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
map <F5> :redraw!<cr><c-w>=



" FOLDS
" ==============================================
set foldmethod=syntax

" do not fold automatically
set nofoldenable

" toggle folds with space bar
nnoremap <silent> <space> za

" allow syntax foldmethod for javascript
let javaScript_fold=1


" SIDEBAR
" =============================================
map <Leader>s :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" NAVIGATION
" ==============================================
" easy window navigation
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" easy tab navigation
map <s-l> :tabnext<cr>
map <s-h> :tabprevious<cr>

" move the cursor in insert mode
imap <c-h> <c-o>h
imap <c-j> <c-o>j
imap <c-k> <c-o>k
imap <c-l> <c-o>l


" AUTOCOMMANDS
" ==============================================
" remove unwanted trailling spaces on save
au! BufWritePre * :%s/\s\+$//e

" set current path to current file parent directory for better use of :find
au! BufEnter * silent! let &path = expand('%:p:h') . '/**'


" EDIT/SOURCE VIMRC/PLUGINS
" ==============================================
" vimrc
nmap <leader>vs :vsplit $MYVIMRC<cr>
nmap <leader>so :so $MYVIMRC<cr>

" plugins.vim
nmap <leader>pe :exe 'split '.$MYPLUGINS<cr>



" SPELLING
" ==============================================
" fix my common spelling mistakes
iab slef self
iab tihs this
iab functino function
iab getElementByID getElementById

" CONTROL P
" ==============================================
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'
