"               ABOUT                           
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Ryan Maynard
"               https://ryanmaynard.co/about 
"               hi@ryanmaynard.co
"
"
" Sections: 
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Make backspace behave in a sane manner.
set backspace=indent,eol,start
" Switch syntax highlighting on
syntax on
" vim-plug setup
call plug#begin('~/.vim/plugged')

" Tons of color schemes
Plug 'flazz/vim-colorschemes'
" Easily toggle comments
Plug 'tpope/vim-commentary'
" Markdown syntax
Plug 'tpope/vim-markdown'
" vim-lightline
Plug 'itchyny/lightline.vim'
" vim-gitgutter
Plug 'airblade/vim-gitgutter'


call plug#end()


" Enable file type detection and do language-dependent indenting.
filetype plugin indent on
" Security
set modelines=0
" Show line numbers
set number
" Show file stats
set ruler
" Encoding
set encoding=utf-8


" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround


" PLUGIN SETTINGS

" Colorscheme settings
set guifont=Menlo\ Regular:h14
colorscheme obsidian

" Lightine settings
set laststatus=2
set t_Co=256
let g:lightline = {'colorscheme':'wombat',}