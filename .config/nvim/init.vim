call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'
	Plug 'itchyny/lightline.vim'
	Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
	Plug 'vim-python/python-syntax'
	Plug 'joshdick/onedark.vim'
call plug#end()

syntax on
colorscheme onedark

set number
set noswapfile
set hidden
