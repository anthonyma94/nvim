call plug#begin()
" Make sure you use single quotes

" EasyMotion
Plug 'https://github.com/asvetliakov/vim-easymotion.git'
" Dracula theme
Plug 'dracula/vim'
" File Explorer
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
let mapleader = ";"

" Set better theming
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
colorscheme dracula

" File Explorer in nvim
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['node_modules']
" Automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle File Explorer
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Fuzzy Search
let g:fzf_action = {
\    'ctrl-t': 'tab split',
\   'ctrl-s': 'split',
\   'ctrl-v': 'vsplit'
\}

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4
" adds line numbers
set number
set relativenumber

" enables syntax highlighting
" syntax on

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

    " Fuzzy search
    nnoremap <C-p> :FZF<CR>
endif
