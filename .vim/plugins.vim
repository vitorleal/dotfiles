" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'
autocmd BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent nofoldenable

" SnipMate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

" Jade
Bundle 'digitaltoad/vim-jade'

" delimitMate
Bundle 'Raimondi/delimitMate'

" AutoCloseTag
Bundle 'HTML-AutoCloseTag'

" matchit (extended % matching)
Bundle 'matchit.zip'

" Better CSS Syntax highlight
Bundle 'Better-CSS-Syntax-for-Vim'

" supertab
Bundle 'ervandew/supertab'

" better javascript syntax
Bundle 'JavaScript-syntax'

" less syntax
Bundle 'groenewege/vim-less'

" multiple cursors
Bundle 'terryma/vim-multiple-cursors'

" NERDtree
Bundle 'scrooloose/nerdtree'

" Cntr P
Bundle 'kien/ctrlp.vim'

" Puppet syntax
Bundle 'puppetlabs/puppet-syntax-vim'

" AirLine
Bundle 'bling/vim-airline'

" GuitGutter
Bundle 'airblade/vim-gitgutter'

