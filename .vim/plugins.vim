" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'digitaltoad/vim-jade'
Bundle 'Raimondi/delimitMate'
Bundle 'HTML-AutoCloseTag'
Bundle 'matchit.zip'
Bundle 'ervandew/supertab'
Bundle 'JavaScript-syntax'
Bundle 'groenewege/vim-less'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
Bundle "sudar/vim-arduino-syntax"
" Dash
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'

syntax enable
filetype plugin indent on
