scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" ---------- General ----------

" Remap leader key
let maplocalleader=";"
let mapleader=","

" Automatically re-read file if a change was detected outside of vim
set autoread

" Yank and paste with the system clipboard
set clipboard=unnamed

" Better display for messages
" set cmdheight=2

" Folding
let g:javaScript_fold=1
set foldmethod=syntax
set foldlevelstart=99

" Hides buffers instead of closing them
set hidden

" Don't update the display while executing macros
set lazyredraw 

" Enable line numbers
set number

" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

" Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Don't give completion messages like 'match 1 of 2' or 'The only match'
set shortmess+=c

" Enable horizontal scroll
set sidescroll=1

" always show signcolumns
" set signcolumn=yes

" You will have bad experience for diagnostic messages when it's default 4000
" set updatetime=300

" Set height of an active window in split mode to 30
set winheight=30 





" ---------- Fix ----------

" Fix CSS properties highlighting problem
" augroup VimCSS3Syntax
  " autocmd!

  " autocmd FileType css setlocal iskeyword+=-
" augroup END





" ---------- Formating ----------

set autoindent smartindent copyindent

set expandtab smarttab shiftwidth=2	softtabstop=2	tabstop=2

set nowrap





" ---------- UI ----------

" Enable true color support
set termguicolors

" Theme
colorscheme gruvbox-material
set background=dark

" Lightline 
set laststatus=2
set noshowmode
let g:lightline = {
\ 'colorscheme': 'jellybeans',
\}





" ---------- Plugin Setup ----------

" ----- Emmet -----
autocmd FileType html,css,scss,php EmmetInstall 
let g:user_emmet_install_global = 0 
let g:user_emmet_expandabbr_key=',,'

" ----- NERDCommenter -----

let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
    \ 'scss': { 'left': '//' }
    \ }





" ---------- Key Mappings ----------

" Duplicate line
noremap <C-S-Down> YP

" CTRL + S to save 
nnoremap <silent><c-s> :<c-u>update<cr>
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr>





" ---------- Search / Regexp ----------

" RegExp global by default
set gdefault                

" Highlight searches
set hlsearch                

" Make searches case-insensitive
set ignorecase smartcase    

" Show the `best match so far'
set incsearch               

" Enable extended regexes
set magic

