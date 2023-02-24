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
        Plug 'tpope/vim-vinegar'
        Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

syntax on
colorscheme dracula
set filetype=dosini

set tabstop=4
set shiftwidth=4
set expandtab

set number
set noswapfile
set hidden
