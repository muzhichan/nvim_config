""""" test autocmd
" augroup test_group
"     autocmd BufWrite * :echom "Foo"
"     autocmd BufWrite * :echom "Bar"
" augroup END
"
" augroup test_group
"     autocmd!
"     autocmd BufWrite * :echom "Baz"
" augroup END

" ##########################

" Set custom augroup
augroup user_events
    autocmd!
augroup END


if has('vim_starting')
    let g:mapleader=","
    let g:maplocalleader=";"

    " Release keymappings prefixes
    nnoremap <Space> <Nop>
    xnoremap <Space> <Nop>
    nnoremap ,       <Nop>
    xnoremap ,       <Nop>
    nnoremap ;       <Nop>
    xnoremap ;       <Nop>
endif


let $VIM_PATH =
    \ get(g:, 'etc_vim_path',
    \   exists('*stdpath') ? stdpath('config') :
    \   ! empty($MYVIMRC) ? fnamemodify(expand($MYVIMRC), ':h') :
    \   ! empty($VIMCONFIG) ? expand($VIMCONFIG) :
    \   ! empty($VIM_PATH) ? expand($VIM_PATH) :
    \   fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
    \ )

let $DATA_PATH =
    \ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')


if has('vim_starting')
    " When using VIMINIT trick for exotic MYVIMRC locations, add path now.
    if &runtimepath !~# $VIM_PATH
        set runtimepath^=$VIM_PATH
    endif

    "" ensure data directories
    for s:path in [
            \ $DATA_PATH,
            \ $DATA_PATH . '/undo',
            \ $DATA_PATH . 'backup' ]

        if ! isdirectory(s:path)
            call mkdir(s:path, 'p')
        endif
    endfor

    "" python host conf
    if has('nvim')
        if has('mac')
        let g:python3_host_prog='/path/to/bin/python'
    elseif has('unix')
        let g:python3_host_prog=''
    endif

    endif
endif

"" ############
"" use plug {{{
"" ------------
    execute 'source' expand($VIM_PATH . '/local.plugins.vim')
    execute 'source' expand($VIM_PATH . '/plugins.conf.vim')
    " --- config/plugins ---
    "execute 'source' expand($VIM_PATH . '/config/plugins/defx.vim')
    "execute 'source' expand($VIM_PATH . '/config/plugins/coc.vim')
""}}}

"" general config
set mouse=nv                 " Disable mouse in command-line mode
set modeline                 " automatically setting options from modelines
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path+=**                 " Directories to search when using gf and friends
set isfname-==               " Remove =, detects filename in var=/foo/bar
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=2500           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions-=o         " Disable comment-continuation (normal 'o'/'O')
if has('patch-7.3.541')
    set formatoptions+=j       " Remove comment leader when joining lines
endif

if has('vim_starting')
    set encoding=utf-8
    scriptencoding utf-8

    " Enables 24-bit RGB color in the TUI
    if has('termguicolors') && $COLORTERM =~# 'truecolor\|24bit'
        set termguicolors
    endif
endif

" What to save for views and sessions:
set viewoptions=folds,cursor,curdir,slash,unix
set sessionoptions=curdir,help,tabpages,winsize

if has('mac') && has('vim_starting')
    let g:clipboard = {
        \   'name': 'macOS-clipboard',
        \   'copy': {
        \      '+': 'pbcopy',
        \      '*': 'pbcopy',
        \    },
        \   'paste': {
        \      '+': 'pbpaste',
        \      '*': 'pbpaste',
        \   },
        \   'cache_enabled': 0,
        \ }
endif

if has('clipboard') && has('vim_starting')
    set clipboard& clipboard+=unnamedplus
endif

" Wildmenu {{{
" --------
if has('wildmenu')
    if ! has('nvim')
        set wildmode=list:longest
    endif

    " if has('nvim')
    " 	set wildoptions=pum
    " else
    " 	set nowildmenu
    " 	set wildmode=list:longest,full
    " 	set wildoptions=tagfile
    " endif
    set wildignorecase
    set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
    set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
    set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
    set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
    set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
    set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
endif

" }}}

" Tabs and Indents {{{
" ----------------
"set textwidth=120   " Text width maximum chars before wrapping
"set noexpandtab     " Don't expand tabs to spaces
set expandtab
set tabstop=4       " The number of spaces a tab is
set shiftwidth=4    " Number of spaces to use in auto(indent)
set softtabstop=4  " Automatically keeps in sync with shiftwidth
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
" set smartindent   " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

if exists('&breakindent')
    set breakindentopt=shift:2,min:20
endif

" }}}

" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=500   " Time out on mappings
set ttimeoutlen=10   " Time out on key codes
set updatetime=200   " Idle time to write swap and trigger CursorHold
set redrawtime=1500  " Time in milliseconds for stopping display redraw

" }}}
" Searching {{{
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set wrapscan        " Searches wrap around the end of the file
set complete=.,w,b  " C-n completion: Scan buffers and windows

if exists('+inccommand')
    set inccommand=nosplit
endif

" }}}
" Behavior {{{
" --------
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,vsplit    " Jump to the first open window
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
set completeopt=menuone         " Always show menu, even for one item
set completeopt+=noselect       " Do not select a match in the menu

if exists('+completepopup')
    set completeopt+=popup
    set completepopup=height:4,width:60,highlight:InfoPopup
endif

if has('patch-7.4.775')
    " Do not insert any text for a match until the user selects from menu
    set completeopt+=noinsert
endif

if has('patch-8.1.0360') || has('nvim-0.4')
    set diffopt+=internal,algorithm:patience
    " set diffopt=indent-heuristic,algorithm:patience
endif

" }}}
" Editor UI {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set number            " Don't show line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
" set winheight=4         " Minimum height for active window
set winminheight=1      " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set showcmd             " Show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line
"set colorcolumn=+0      " Column highlight at textwidth's max character-limit
set display=lastline

set showmatch

if has('folding') && has('vim_starting')
    set foldenable
    set foldmethod=indent
    set foldlevelstart=99
endif

if has('nvim-0.4')
    set signcolumn=yes:1
else
    set signcolumn=yes           " Always show signs column
endif

" UI Symbols
" icons:  ▏│ ¦ ╎ ┆ ⋮ ⦙ ┊ 
let &showbreak='↳  '
set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·
" set fillchars=foldopen:O,foldclose:x
" set fillchars=vert:▉,fold:─

if has('patch-7.4.314')
    " Do not display completion messages
    set shortmess+=c
endif

if has('patch-7.4.1570')
    " Do not display message when editing files
    set shortmess+=F
endif

if has('conceal') && v:version >= 703
    " For snippet_complete marker
    set conceallevel=2 concealcursor=niv
endif

if exists('+previewpopup')
    set previewpopup=height:10,width:60
endif

" Pseudo-transparency for completion menu and floating windows
if &termguicolors
    if exists('&pumblend')
        set pumblend=10
    endif
    if exists('&winblend')
        set winblend=10
    endif
endif

" solve wrong encoding
if has("multi_byte")
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
endif
" }}}

" change tab {{{
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" https://stackoverflow.com/questions/15583346/how-can-i-temporarily-make-the-window-im-working-on-to-be-fullscreen-in-vim
nnoremap tt :tab split<CR>

" }}}

" Terminal Behavior {{{
" --------------------
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
"tnoremap <C-N> <C-\><C-N> :q<CR>
"tnoremap <C-N> <C-\><C-N>
"tnoremap <Esc> <C-\><C-n>
nnoremap <leader>T :botright vs term://$SHELL<CR>
nnoremap <leader>t :botright split term://$SHELL<CR>
" }}}


"" custom mapping {{{
"" ------------------
" Fast saving from all modes
nnoremap <Leader>w :write<CR>
xnoremap <Leader>w <Esc>:write<CR>
nnoremap <C-s> :<C-u>write<CR>
xnoremap <C-s> :<C-u>write<CR>
cnoremap <C-s> <C-u>write<CR>

" Ultimatus Quitos
autocmd user_events BufWinEnter * if &buftype == ''
    \ | nnoremap <silent><buffer> q :quit<CR>
    \ | endif

" Macros
nnoremap Q q
nnoremap gQ @q

" Tabs
nnoremap <silent> g1 :<C-u>tabfirst<CR>
nnoremap <silent> g5 :<C-u>tabprevious<CR>
nnoremap <silent> g9 :<C-u>tablast<CR>
"nnoremap <silent> <C-Tab> :<C-U>tabnext<CR>
"nnoremap <silent> <C-S-Tab> :<C-U>tabprevious<CR>
nnoremap <silent> <A-j> :<C-U>tabnext<CR>
nnoremap <silent> <A-k> :<C-U>tabprevious<CR>
nnoremap <silent> <A-{> :<C-u>-tabmove<CR>
nnoremap <silent> <A-}> :<C-u>+tabmove<CR>

" Buffer
nnoremap <silent> <A-[> :bprevious<CR>
nnoremap <silent> <A-]> :bnext<CR>
nnoremap <silent> <A-d> :bd<CR>

" Drag current line/s vertically and auto-indent
nnoremap <Leader>k :m-2<CR>
nnoremap <Leader>j :m+<CR>
vnoremap <Leader>k :m'<-2<CR>gv=gv
vnoremap <Leader>j :m'>+<CR>gv=gv
"" }}}

"" theme setting
colorscheme onedark


