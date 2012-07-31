"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle. REQUIRED
Bundle 'gmarik/vundle'

" My bundles
Bundle 'mattsa/vim-fuzzee'
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'

"Bundle 'QuickBuf'
Bundle 'bufkill.vim'

Bundle 'a.vim'
Bundle 'The-NERD-tree'
"Bundle 'taglist.vim'

"Bundle 'tpope/vim-fugitive'
"Bundle 'ervandew/supertab'
Bundle 'derekwyatt/vim-protodef'
Bundle 'derekwyatt/vim-fswitch'

Bundle 'ack.vim'

Bundle 'Zenburn'
Bundle 'fu'
"Bundle 'nanotech/jellybeans.vim'

Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on " required! 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" No intro splash
set shortmess=I

" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype plugin on
filetype indent on

set encoding=utf-8

" Set to auto read when a file is changed from the outside
set autoread

set hidden

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Allow Mouse Usage
set mouse=a

set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/glfw

" Let's use ack instead of grep!
set grepprg=ack

" Make with 2 cores
"set makeprg=make\ -j3

if has('unnamedplus')
    set clipboard=unnamedplus
endif

set ttyfast
"set ttyscroll=0

set autowrite

"set ofu=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ask for confirmation for various things
set confirm
set completeopt=menu,menuone,longest

" Set 3 lines to pad the cursor - when moving vertical..
set scrolloff=3

set wildmenu " Turn on WiLd menu
set wildmode=full
set wildignore=*.o,*.pyc,*.hi
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.d                              " dependency files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX BS

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set ruler "Always show current position

" Line Numbers
" set number

" Set backspace config
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" Searching
set ignorecase "Ignore case when searching
set smartcase  "If there are any capitalized letters, case sensitive search
set nohlsearch "Don't Highlight search things
set incsearch "Make search act like search in modern browsers

set gdefault "substitute default = all matches on line

set showmatch "Show matching bracets when text indicator is over them
set matchtime=5

set modelines=0

" Disable all bells
set noerrorbells visualbell t_vb=

set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nobackup
"set nowritebackup
"set noswapfile

if has('persistent_undo')
    set undodir=~/.vim/tmp/undo/     " undo files
    set undofile
    set undolevels=1000
    if exists('+undoreload')
        set undoreload=1000
    endif
endif
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                       " enable backups
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set autoindent
"set smartindent
set cindent

set list
set lcs=extends:»,precedes:«,tab:»¯,trail:°
set wrap
" set textwidth=79
" set colorcolumn=85
set linebreak
" set tw=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

" Multiple buffer stuff
"set switchbuf=useopen
set switchbuf=usetab

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Easy buffer navigation
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
noremap <leader>v <C-w>v

" Fast Tab Switching?
nmap <silent> J gT
nmap <silent> K gt

" line wrap movement
noremap j gj
noremap k gk

map H ^
map L g_

"nmap <silent> <C-S-w> :wincmd<Space>

" Escape is far...
imap jk <ESC>
imap kj <ESC>

"imap jj <Esc>
"inoremap <A-Space> <Esc>

" Bracket matching made easy?
"nnoremap <tab> %
"vnoremap <tab> % 

" Tab Switching (non-terminal vim only)
"nmap <C-S-tab> :tabp<CR>
"nmap <C-tab>   :tabn<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Remapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix broken vim regexes when searching
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
nnoremap / /\v
vnoremap / /\v

" Less chording
"nnoremap ; :

" Sudo to write
"cmap W!! w !sudo tee % >/dev/null

" Avoid Typos
silent! command -nargs=0 W w
silent! command -nargs=0 Q q
silent! command -nargs=0 WQ x
silent! command -nargs=0 Wq x

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('autocmd')
    " Resize splits when window is resized
    au VimResized * exe "normal! \<c-w>="

    augroup closenerdtreeiflastwindow
        au!
        au BufEnter *
                    \ if exists("t:NERDTreeBufName")            |
                    \   if bufwinnr(t:NERDTreeBufName) != -1    |
                    \       if winnr("$") == 1                  |
                    \           q                               |
                    \       endif                               |
                    \   endif                                   |
                    \ endif
    augroup END
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

if has("gui_running")
    colorscheme fu
elseif &t_Co != 256
    colorscheme asdf
else
    colorscheme fu

    " fu modifications
    hi NonText        ctermfg=248   ctermbg=none  cterm=bold     guifg=#a8a8a8  guibg=#121212
    hi Normal         ctermfg=252   ctermbg=none                 guifg=#d0d0d0  guibg=#1c1c1c
    hi Visual         ctermfg=none  ctermbg=238   cterm=bold
    hi StatusLineNC   ctermfg=234   ctermbg=253                  guifg=#3a3a3a  guibg=#dadada
endif

" Set font
if has("win32") || has('win64')
    set guifont=Consolas:h8:cANSI
    cd ~
else
    set guifont=Inconsolata\ 10
    " set guifont=ProggyTinyTTSZ:h12:cANSI
endif

set guioptions=acg
set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2

hi StatColor guibg=#94e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

let &guicursor = &guicursor . ",a:blinkon0"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileAndRun(0)<CR>
map <F6> :call CompileAndRun(1)<CR>

function! CompileAndRun(runProgram)
    let l:progname = './' . expand('%:t:r')
    let l:interpreter = 0
    let l:domake = 1
    let l:runner = './run'

    " Otherwise :make won't return a proper exit status.
    setl shellpipe=2>&1\ \|\ tee\ %s;exit\ \${PIPESTATUS[0]}

    " Find out how to build the program.
    if filereadable("SConstruct")
        setl makeprg=scons
    elseif filereadable("Makefile") || filereadable("makefile")
        setl makeprg=make\ -j \ -k
    elseif filereadable("build.xml")
        setl makeprg=ant
    elseif &filetype == 'c'
        setl makeprg=gcc\ -Wall\ -std=c99\ -o\ %<\ %
    elseif &filetype == 'cpp'
        setl makeprg=g++\ -Wall\ -o\ %<\ %
    elseif &filetype == 'java'
        setl makeprg=javac\ %
        let l:progname = 'java ' . expand('%:t:r')
        let l:interpreter = 1
    elseif &filetype == 'matlab'
        let l:progname = 'octave ' . expand('%') . ' | less'
        let l:interpreter = 1
        let l:domake = 0
    else
        " Assume it's a simple script.
        let l:progname = './' . expand('%')
        let l:domake = 0
    endif

    write
    if l:domake == 1
        silent !echo -e "\n\nBuilding..."
        make
        cw
    else
        silent !echo -e "\n\nNot running build tool."
    endif

    if v:shell_error == 0 && a:runProgram == 1
        if executable(l:runner)
            silent !echo -e "\n\nExecuting run script..."
            exec '!' . l:runner
        elseif executable(l:progname) || l:interpreter == 1
            silent exec '!echo -e "\n\nExecuting \"' . l:progname . '\""...'
            exec '!' . l:progname
        endif
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:Powerline_symbols = 'fancy'

let NerdTreeQuitOnExit=1

nnoremap <silent> <F1> <ESC>:NERDTreeToggle<CR>

nnoremap <silent> <F4>  :CtrlPBuffer<CR>
nnoremap <silent> <C-o> :CtrlPBuffer<CR>
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $VIM . '/cache/ctrlp'

map <F7> :!ctags --verbose=yes -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let protodefprotogetter = "/home/sanford/.vim/bundle/vim-protodef/pullproto.pl"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoCacheComplete stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" supertab
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = '&omnifunc'
"let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"let g:SuperTabContextDiscoverDiscovery =
"       \ ["&omnifunc:<c-x><c-o>", "&completefunc<c-x><c-n>"]

" neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1

let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ }

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif

let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Snippets
let g:neocomplcache_disable_select_mode_mappings = 1
imap <C-l> <Plug>(neocomplcache_snippets_expand)
smap <C-l> <Plug>(neocomplcache_snippets_expand)
imap <silent> <C-k> <Plug>(neocomplcache_snippets_jump)

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr> <CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><silent> <CR> <SID>my_cr_function()
function! s:my_cr_function()
    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

