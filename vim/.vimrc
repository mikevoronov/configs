" Colors
syntax on
set background=dark
colorscheme base16-atelier-dune-light
hi Normal ctermbg=NONE

" Shell options
set shell=/bin/bash
let mapleader = "\<Space>"

" GUI options
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set ruler " Where am I/
set ttyfast
set number relativenumber
set laststatus=2 " activate the color scheme of the lightline plugin
set noshowmode " disable standart -- INSERT -- indicator for the insert mode
"set diffopt+=iwhite
set colorcolumn=120 " show a colored column
set showcmd " show command in status line
set mouse=a " enable mouse usage (all modes) in terminals
set shortmess+=c " don't give ins-completion menu messages

" Show those damn hidden characters
" todo

" Tabs configure
set expandtab " insert spaces on pressing Tab
set tabstop=2 " set existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2

" Enable plugins
call plug#begin('~/.vim/plugged')
execute pathogen#infect()

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/localvimrc'
Plug 'justinmk/vim-sneak'

" Fuzzy finder
Plug 'airblader/vim-rooter'
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do' : './install --all'}
Plug 'junegunn/fzf.vim'

" Language plugins
Plug 'rust-lang/rust.vim'

" Hybrid linenumbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Lightline
let g:lightline = {
  \ 'colorscheme' : 'powerline',
  \ 'component_function' : {
  \   'filename': 'LightlineFilename',
  \ },
\ }

" override the default colors for line numbers
if has('autocmd')
    augroup coloroverride
        autocmd!
        autocmd ColorScheme * highlight LineNr  ctermbg=None ctermfg=White guifg=White " Override LineNr
        autocmd ColorScheme * highlight CursorLineNr ctermbg=DarkGrey ctermfg=White guifg=White " Override CursorLineNr
        autocmd ColorScheme * highlight CursorLine ctermbg=None ctermfg=None guifg=None " Override CursorLineNr
        autocmd ColorScheme * highlight ColorColumn ctermbg=DarkGrey ctermfg=DarkGrey guifg=DarkGrey " Override ColorColumn
    augroup END
endif
silent! colorscheme eldar " Custom color scheme

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

