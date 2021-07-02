" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim', { 'branch': 'release' }
Plugin 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}

call vundle#end()
filetype plugin indent on
