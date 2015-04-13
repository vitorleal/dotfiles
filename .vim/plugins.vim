" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Raimondi/delimitMate'
Bundle 'matchit.zip'
Bundle 'ervandew/supertab'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Bundle 'sheerun/vim-polyglot'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'scrooloose/nerdcommenter'

syntax enable
filetype plugin indent on
