set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set nohlsearch
set selection=inclusive
"set autoindent              " indent a new line the same amount as the line just typed
set noautoindent
set nocompatible

set smartindent
set nospell
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
syntax on

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

set clipboard+=unnamedplus
set cursorline
set mouse=a
set noshowmode
set foldmethod=indent
set nofoldenable
set encoding=UTF-8
set langmap=§k
set splitbelow splitright
set hidden
set completeopt=menuone,noinsert
set cmdheight=0
" Avoid showing extra messages when using completion
set shortmess+=c
set scroll=1
set signcolumn=yes
set foldcolumn=1
set noswapfile
set guifont="'Cascadia Code Cursive"
set background=dark
set termguicolors
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
          \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
          \,sm:block-blinkwait175-blinkoff150-blinkon175
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"
