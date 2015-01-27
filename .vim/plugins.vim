" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'digitaltoad/vim-jade'
Bundle 'Raimondi/delimitMate'
Bundle 'matchit.zip'
Bundle 'ervandew/supertab'
Bundle 'groenewege/vim-less'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
Bundle 'sudar/vim-arduino-syntax'
Bundle 'scrooloose/syntastic'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'elzr/vim-json'
Plugin 'fatih/vim-go'

syntax enable
filetype plugin indent on
