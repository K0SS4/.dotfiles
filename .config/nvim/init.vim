call plug#begin('~/.vim/plugged')
	Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
	Plug 'junegunn/vim-easy-align'
	Plug 'itchyny/lightline.vim'
	Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
	Plug 'vim-python/python-syntax'
        Plug 'tpope/vim-fugitive'
        Plug 'preservim/nerdtree'
        Plug 'StanAngeloff/php.vim'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        Plug 'tpope/vim-sleuth'
call plug#end()

syntax on
colorscheme challenger_deep
set filetype=dosini

set number
set noswapfile
set hidden
