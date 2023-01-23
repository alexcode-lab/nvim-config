call plug#begin("~/.config/nvim/plugged")
    " File Explorer
    Plug 'scrooloose/nerdtree'

    " Colorscheme
    "Plug 'dracula/vim'
    "Plug 'morhetz/gruvbox'
    "Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme

    " File search
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    "Plug 'junegunn/fzf.vim'

    " Python syntax highlight
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

    Plug 'https://github.com/ap/vim-css-color'  " CSS Color Preview
    Plug 'vim-airline/vim-airline'              " Status bar
    Plug 'jiangmiao/auto-pairs'                 " Autocomplete pair symbols
    Plug 'scrooloose/nerdcommenter'             " comment/ucomment lines
    Plug 'jlanzarotta/bufexplorer'              " buffer for open files
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'sbdchd/neoformat'                     " code auto format

    Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation

    Plug 'tomlion/vim-solidity'
    Plug 'davidhalter/jedi-vim'
    "Plug 'zchee/deoplete-jedi'

call plug#end()
"Config Section

filetype on

set encoding=UTF-8

" temp files
set backup
set backupdir=~/.tmpvim,/tmp
set directory=~/.tmpvim,/tmp
set dir=~/.tmpvim,/tmp
set undodir=~/.tmpvim,/tmp

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

set path+=**

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase
set smartcase

"Убарть подсветку поиска при нажатии space"
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"add some line space for easy reading
set linespace=4

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk
set fo=l

"statusline setup
set statusline=%f       "tail of the filename

"Git
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"turn off needless toolbar on gvim/mvim
set guioptions-=T

"indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set tabstop=4
set fileformat=unix
set textwidth=120

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,.* "stuff to ignore when tab completing
set wildignore+=*/vendor/*,*/node_modules/*

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a

"hide buffers when not displayed
set hidden

if (has("termguicolors"))
 set termguicolors
endif

colorscheme neverland2-darker

syntax enable

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-f> :NERDTreeToggle<CR>

"key mapping for saving file
nmap <C-s> :w<CR>
imap <C-s> :w<CR>
imap <C-j> <ESC><ESC>
nmap <C-j> <PageDown>
nmap <C-k> <PageUp>


" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов
set complete+=t
" other loaded windows
set complete+=w
" included files
set complete+=i

set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

"nnoremap <silent> <C-b> :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <C-b> :BufExplorer<CR>

nmap <F3> :TagbarToggle<CR>
nmap <F8> :Neoformat<CR>

"let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 1

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


map ,ca           <Plug>NERDCommenterAltDelims
map ,cu           <Plug>NERDCommenterUncomment
map ,cb           <Plug>NERDCommenterAlignBoth
map ,cl           <Plug>NERDCommenterAlignLeft
map ,cy           <Plug>NERDCommenterYank
map ,cs           <Plug>NERDCommenterSexy
map ,ci           <Plug>NERDCommenterInvert
map ,c$           <Plug>NERDCommenterToEOL
map ,cn           <Plug>NERDCommenterNested
map ,cm           <Plug>NERDCommenterMinimal
map ,c<Space>     <Plug>NERDCommenterToggle
map ,cc           <Plug>NERDCommenterComment


let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline_theme='dark'
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1
let g:airline_enable_bufferline=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'

"let g:airline_section_b = '%{fugitive#head()}'
let g:airline_section_c = '%t'
