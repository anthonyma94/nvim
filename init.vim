call plug#begin()
" Make sure you use single quotes
" if exists('g:vscode')
    Plug 'https://github.com/asvetliakov/vim-easymotion.git'
" else
    " Plug 'easymotion/vim-easymotion'
" endif
call plug#end()
let mapleader = ";"
" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4
" adds line numbers
set number
set relativenumber

" enables syntax highlighting
" syntax on

" Better colors
" set termguicolors

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab


" highlights the matched text pattern when searching
" set incsearch
" set nohlsearch

" open splits intuitively
set splitbelow
set splitright

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 8 lines from top or bottom
set scrolloff=8

" Save undo history
set undofile

set number

" case insensitive search unless capital letters are used
set ignorecase
set smartcase

" columns used for the line number
set numberwidth=4
noremap Q <Nop>
noremap @ <Nop>
noremap q <Nop>


if exists('g:vscode')
    nmap  <Leader>f <Plug>(easymotion-bd-f)
    nmap  <Leader>w <Plug>(easymotion-bd-w)
    nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')</CR>
    nnoremap <C-.> <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')</CR>
else
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
    nnoremap <a-d> <C-d>
    nnoremap <a-u> <C-u>
    inoremap <a-j> <Esc>
    imap <Leader><leader> <Esc>
endif
