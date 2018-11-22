" For writing if you forget to sudo: :w !sudo tee %
set nocompatible
filetype indent plugin on
" Enable mouse for all Vim modes "

" To disable a plugin, add it's bundle name to the following list
 let g:pathogen_disabled = ['ale']
execute pathogen#infect()

"unwanted whitespaces"
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd FileType c,cpp,python match ExtraWhitespace /\s\+$\| \+\ze\t/
" Show trailing whitespace and spaces before a tab:"
 autocmd FileType c,cpp,python set complete-=i

set mouse=a
" Show line numbes "
set number
" Match "
set showmatch
" Syntax highlight for files "
set syntax=on
" Show tabs "
set listchars=tab:>-,eol:$
set ruler
set hidden
"setup solarized colorscheme (force 256 color etc.)

set encoding=utf-8

set incsearch
set hlsearch
" default search ingores case sensitivity
set ignorecase
" if uppercase found then search is case sensitive 
set smartcase

:set nowrap
set cindent

"set tags=./tags;/
"set tags=/tmp/ctags
"let g:gutentags_cache_dir="/tmp/.ctags"

set clipboard^=unnamedplus

" \d and \D will just delete text, without copying to register
:noremap <Leader>d "_d
:noremap <Leader>D "_D

set completeopt+=preview,longest
" enter accepts omnicompletion
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

syntax enable
set background=dark
"colorscheme solarized
"set t_Co=256

set wildmode=list:longest,full
    set wildmenu
set laststatus=2

autocmd FileType gitcommit setlocal spell
"autocmd FileType c,cpp setlocal spell
"
"set spell spelllang=en_us
"
set path=.,,**

set backspace=2 " make backspace work like most other apps
"=======================remaps()=============="
nnoremap gb :ls<CR>:b<Space>
" Switch buffers with TAB
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>


nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'
" hi StatusLine term=reverse cterm=reverse ctermfg=14 ctermbg=0 gui=bold,reverse
" au InsertEnter * hi StatusLine term=reverse cterm=reverse ctermfg=31 ctermbg=0 gui=bold,reverse
" au InsertLeave * hi StatusLine term=reverse cterm=reverse ctermfg=14 ctermbg=0 gui=bold,reverse

set ttimeoutlen=10
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

set pastetoggle=<F2>

set laststatus=2

:set tabstop=4 shiftwidth=4 expandtab
"au FileType c setl ofu=ccomplete#CompleteCpp

let g:ale_linters = {'c': ['gcc'], 'cpp': ['clang'], 'python' : ['pylint'], }
" let g:ale_c_gcc_options="-std=c++11"
" let g:ale_cpp_gcc_options="-std=c++11"
let g:ale_cpp_clang_options= "-std=c++11 -I/home/parallels/nervana/syssw/umd/export -I/home/parallels/nervana/syssw/**"

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:ctrlp_custom_ignore = '_out'

nmap <F3> :TagbarToggle<CR>
let g:tagbar_width=50
set updatetime=400
