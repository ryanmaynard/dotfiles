"               ABOUT                           {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Ryan Maynard
"               https://ryanmaynard.co/about 
"               hi@ryanmaynard.co
"
"
" Sections:     Vundle - Plugin Management
"               General Settings
"               VIM User Interface
"               Colors & Fonts
"               Searching 
"               Folding
"               Mappings
"               Plugin Settings
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}
"               VUNDLE SETTINGS                 {{{

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Ton of color schemes
Plugin 'flazz/vim-colorschemes'

" Fuzzy finder
Plugin 'kien/ctrlp.vim'

" Easily toggle comments
Plugin 'tpope/vim-commentary'

" Emmet
Plugin 'mattn/emmet-vim'

" Markdown syntax
Plugin 'tpope/vim-markdown'

"" Git-gutter
Plugin 'airblade/vim-gitgutter'

" Markdown Viewer
Plugin 'JamshedVesuna/vim-markdown-preview'

" Lightweight powerline
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype plugin indent on    " Filetype auto-detection
syntax on


"}}}
"               GENERAL SETTINGS                {{{                              

set shell=/bin/bash
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab       " Use spaces instead of tabs
set smarttab        " Lets tab key insert tab stops, and bksp deletes tabs
set shiftround      " tab/shifting moves to closest tabstop
set autoindent      " Match indents to new lines
set smartindent     " Intelligently indent/dedent based on rules

" Obsolete; always use vcs
set nobackup
set nowritebackup
set noswapfile

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Tab nav aliases
cabbrev tp tabprev
cabbrev tn tabnext
cabbrev tf tabfirst
cabbrev tl tablast


"}}}
"               VIM USER INTERFACE              {{{

set ruler
set number
set numberwidth=5
set cursorline
hi Cursorline cterm=bold
set lines=999 columns=999

set hidden      " allow buffers with unsaved changes
set autoread    " When file has changed, just load; no questions



"}}}
"               COLORS & FONTS                  {{{

set guifont=Menlo\ Regular:h14
colorscheme obsidian
set encoding=utf-8


"}}}
"               SEARCH SETTINGS                 {{{

set ignorecase  " case insensitive search
set smartcase   " if there are upper case, become case-sensitive
set incsearch   " live incremental searching
set showmatch   " live match highlighting
set hlsearch    " highlight matches
set gdefault    " use the 'g' flag by default


"}}}
"               FOLDING SETTINGS                {{{

set foldmethod=marker


"}}}
"               MAPPING SETTINGS                {{{

let mapleader=","   
let maplocalleader="\\"     
inoremap jk <esc>   
noremap j gj
noremap k gk



"}}}
"               PLUGIN SETTINGS                 {{{

nnoremap <leader>c <Plug>CommentaryLine
" Emmet settings
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Lightine settings
set t_Co=256
let g:lightline = {'colorscheme':'wombat',}
" Vim-Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
"}}}