set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/neobundle.vim/
    set runtimepath+=~/.vim/.bundle
    call neobundle#rc(expand('~/.vim/.bundle/'))
endif

"------- set plugins -------
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache-clang_complete'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
"TDD plugin for vim
NeoBundle 'reinh/vim-makegreen'
"syntax hightlight for python, with pyflak
NeoBundle 'mitechie/pyflakes-pathogen'

NeoBundle 'vim-scripts/java_getset.vim'
" enable use slim on vim
NeoBundle 'slimv.vim'

filetype plugin indent on
filetype indent on

"
" common settings
"
"
set vb t_vb=

set directory=~/.vim/tmp/vimswap
set backupdir=~/.vim/tmp/bak
set viminfo+=n~/.vim/tmp/viminfo


" set PEP8 Style
set autoindent
set smarttab
set cindent "clang style indent

set foldlevel=99

set foldmethod=syntax

" Syntax setting
" ---------------
syntax on

" VB.NET
autocmd BufRead, BufNewFile *.vb setlocal filetype=vbnet

"___________
" indent
"---------
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"--------
" display settings
"---------
"
"colorscheme anotherdark
"colorscheme solarized
set background=dark
"set transparency=50
set title
set number

set guifont=inconsolata:h16
set guifontwide=Osaka-Mono:h15

set showcmd
set textwidth=90
set colorcolumn=80
set wrap

set showtabline=2

highlight link ZenkakuSpace Error
match ZenkakuSpace /　/


set laststatus=2
"set statusline=[%L]\ %t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L
set statusline=%F%m%r%h%w\ [Linefeed=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [LEN=%L]
"let &statusline = ''

set smartcase


"" from  expart Python
set incsearch
set ignorecase
set ruler
set wildmenu
set commentstring=\ #\ %s
set foldlevel=0


" ----- Syntax Settings -----------
"" Java
let java_highlight_all=1
let java_space_errors=1
let java_highlight_function=1
"4debug highlight
let java_highlight_debug=1


" ------ Key Mapping --------------
" nomal mode
nnoremap q: <NOP> "disable command
nmap n nzz

" insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>


"-------------
" plugin settings
"---------------
"

" disable autoComplPop
let g:acp_enableAtStartup = 0

"" neocomplcache
let g:neocomplcache_enable_at_startup = 1   " enabled when start vim 
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_max_list = 30
let g:neocomplcache_auto_completion_start_length = 2
" set minimum syntax keyword length
let g:neocomplcache_min_syntax_length = 3
"" like AutoComplPop
let g:neocomplcache_enable_auto_select = 1
"" search with camel case like Eclipse
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
"imap <C-k> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
"" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"" <CR>: close popup and save indent.
"inoremap <expr><CR> neocomplcache#smart_close_popup() . (&indentexpr != '' ? "\<C-f>\<CR>X\<BS>":"\<CR>")
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

" Enable heavy omni-comlete
let g:NeoComplCache_EnableSkipCompletion=1

" for neocomplcache-clang_complete
" use neocomplcache & clang_complete
let g:neocomplcache_force_overwrite_completefunc=1
" add clang_complete option
let g:clang_complete_auto=1

" for c/c++
let g:neocomplcache_include_patterns = {'c':'^\s#\s*include','cpp':'^\s#\s*include'}
let g:neocomplcache_include_suffixes = {'c':'.h','cpp':'.h'}

"Define dictonaru
let g:neocomplcache_dictionary_filetype_lists={
\'default':'',
\'java':$HOME.'/.vim/dict/java.dict',
\'javascript':$HOME.'/.vim/dict/javascript.dict',
\'python':$HOME.'/.vim/dict/python.dict',
\'vim':$HOME.'/.vim/dict/vim.dict',
\'vimshell':$HOME.'/.vim/dict/vimshell.dict',
\'cpp':$HOME.'/.vim/dict/cpp.dict'
\}


let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2 
let g:indent_guides_color_change_percent=20

" ---------Unite.vim---------

""" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"---- netrw(default filer) ----
" set treeview
let g:netrw_liststyle = 3
" push 'v' open a pane on right side
let g:netrw_altv = 1
" push 'o' open a pane on under
let g:netrw_alto = 1

" ------------- VimFiler ------------------"
noremap <C-q> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
"autocmd! FileType vimfiler call g:my_vimfiler_settings()
"function! g:my_vimfiler_settings()
"    nmap <buffer><expr><Cr> vimfiler#smart_cursor_map


" ----- slimv.vim --------
if has('mac')
    let g:slimv_swank_clojure = '!osascript -e "tell app \"iTerm\"" -e "tell the first terminal" -e "set mysession to current session" -e "launch session \"Default Session\"" -e "tell the last session" -e "exec command \"/bin/bash\"" -e "write text \"cd $(pwd)\"" -e "write text \"lein swank\"" -e "end tell" -e "select mysession" -e "end tell" -e "end tell"'
endif

