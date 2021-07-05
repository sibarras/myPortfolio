set encoding=utf-8
set number relativenumber
syntax enable
set noswapfile
set scrolloff=7
set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

let mapleader=' '

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sirver/ultisnips'

" New additions
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'Chiel92/vim-autoformat'

" For search in code
Plug 'justinmk/vim-sneak'

" For rust lang
Plug 'rust-lang/rust.vim'

call plug#end()

colorscheme gruvbox
let g:airline_theme='gruvbox'

if (has("termguicolors"))
    set termguicolors
endif

lua require 'colorizer'.setup()

" NERD Commenter - (control + /)
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" NERD Tree - (Space + Tab)
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <Space><Tab> :NERDTreeToggle<CR>

" Tabs
" Space + 1 to go left
" Space + 2 to go right
" Ctrl + w to delete tab
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <space>1 :bp<CR>
nmap <space>2 :bn<CR>
nmap <C-w> :bd<CR>

" UtilSnippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpFowardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

filetype plugin indent on

" New Configuration for python linting

syntax enable

" Color Scheme
let base16colorspace=256
set background=dark

" True Color Support
if has("termguicolors")
    set termguicolors
endif

if has("gui_running")
    set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" Turn Off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase
set smartcase

" Vim-Autoformat
noremap <F3> :Autoformat<CR>

" NCM2
augroup NCM2
    autocmd!
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " This maping is to close the menu and also start newline
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")

    " Use Tab to select the pop menu
    inoremap <expr> <Tab> (pumvisible() ? "\<C-n>" : "\<Tab>")
    inoremap <expr> <S-Tab> (pumvisible() ? "\<C-p>" : "\<S-Tab>")

augroup END

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8', 'mypy']}

" Airline (More Changes)
let g:airline_left_sep  = ''
let g:rirline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let rirline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" For sneak position
source ~/.config/nvim/plug-config/sneak.vim
