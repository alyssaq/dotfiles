set encoding=utf-8
autocmd! bufwritepost .vimrc source %

syntax on

" No folding magic
" =========================
set foldmethod=syntax
set foldnestmax=2
nnoremap <space> zA
vnoremap <space> zA
au BufRead * normal zR

" Tagbar
" ======
nmap <F8> :TagbarToggle<CR>

" General option
" ===============
let mapleader = "," " rebind <Leader> key
nnoremap . <NOP>
set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors

set mouse=a
set bs=2 " make backspace behave like normal again
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" make yank copy to the global system clipboard
set clipboard=unnamed

set history=700
set undolevels=700

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab
" disable formatting when pasting large chunks of code
set pastetoggle=<F2>

set grepprg=ack\ -k
set number
set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrap " don't automatically wrap on load
set tw=80  " width of document (used by gd)
set fo-=t  " don't automatically wrap text when typing

" Settings for vim-markdown
" ==========================
" let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1

"
" Movement
" =========
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Fixing the copy & paste madness
" ================================
vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a

" set Unix as the standard file type
set ffs=unix,dos,mac

" Color scheme
" =============
set t_Co=256
set background=dark

set colorcolumn=80
highlight ColorColumn ctermbg=233
