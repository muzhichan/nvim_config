" ===                ===
" === Author: @muzhi ===
" ===                ===

" =====================================
" === Auto load for first time uses ===
" =====================================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" =======================
" === Editor behavior ===
" =======================
syntax on

if has("termguicolors")
    " enable true color
    " remote terminal if colortheme not work, try comment bellow
    "set termguicolors
endif
" set t_Co=256
"set guifont=Fira\ Code:h14
" set background=dark
" solarized options 
" colorscheme NeoSolarized
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

filetype off  " required!
filetype plugin indent on     " required!
"inoremap jj <Esc>
set guifont=Source\ Code\ Pro\ for\ Powerline\ :h18
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
" 设定文件浏览器目录为当前目录  
set bsdir=buffer  
" 设置编码  
set encoding=utf-8  
set nocompatible
set laststatus=2
" 设置文件编码  
"set fenc=utf-8 
"set to use clipboard of system
if has("clipboard")
    set clipboard=unnamed
endif
" 设置文件编码检测类型及支持格式  
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936  
"显示行号  
set number
"Show related row numbers
"set relativenumber
"settings for backspace
set backspace=2
set backspace=indent,eol,start
"忽略大小写查找
set ic
" tab宽度  
set tabstop=4
set expandtab
set cindent shiftwidth=4
set autoindent shiftwidth=4
"set wrap
"set tw=0
"set indentexpr=
"set foldmethod=indent
"set foldlevel=99
" set 折叠
set foldmethod=indent
" 打开文件默认不折叠
set foldlevelstart=99
"set foldenable
"set formatoptions-=tc
"set splitright
"set splitbelow
"set noshowmode
"set showcmd
"set wildmenu
"set ignorecase
"set smartcase
"set shortmess+=c
"set inccommand=split
"set ttyfast "should make scrolling faster
"set lazyredraw "same as above
"set visualbell
"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
"	set undofile
"	set undodir=~/.config/nvim/tmp/undo,.
"endif
"set colorcolumn=80
"set updatetime=1000
"
"" Cursor shape
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"
"set my leader
"let mapleader="\<Space>"
let mapleader=","
"Save & Quit
noremap <silent> Q :q<CR>
noremap <silent> S :w<CR>
"Disable highlight
nnoremap <leader>n :nohl<CR>
" settings for resize splitted window
nmap <leader>w[ :vertical resize -6<CR>
nmap <leader>w] :vertical resize +6<CR>
nmap <leader>w- :resize -3<CR>
nmap <leader>w= :resize +3<CR>

" ===            ===
" === for window ===
" ===            ===
" tab or buf 1
nnoremap <leader>1 :call functions#tab_buf_switch(1)<cr>
" tab or buf 2
nnoremap <leader>2 :call functions#tab_buf_switch(2)<cr>
" tab or buf 3
nnoremap  <leader>3 :call functions#tab_buf_switch(3)<cr>
" tab or buf 4
nnoremap  <leader>4 :call functions#tab_buf_switch(4)<cr>
" tab or buf 5
nnoremap  <leader>5 :call functions#tab_buf_switch(5)<cr>
" tab or buf 6
nnoremap  <leader>6 :call functions#tab_buf_switch(6)<cr>
" tab or buf 7
nnoremap  <leader>7 :call functions#tab_buf_switch(7)<cr>
" tab or buf 8
nnoremap  <leader>8 :call functions#tab_buf_switch(8)<cr>
" tab or buf 9
nnoremap  <leader>9 :call functions#tab_buf_switch(9)<cr>

" tab navigation like zsh
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>W :call functions#tab_buf_close()<CR>


" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
"tnoremap <C-N> <C-\><C-N> :q<CR>
tnoremap <C-N> <C-\><C-N>
"tnoremap <Esc> <C-\><C-n>
nnoremap <leader>T :botright vs term://$SHELL<CR>
nnoremap <leader>t :botright split term://$SHELL<CR>

" coc settings
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*.gif,*.jpeg,.DS_Store  " MacOSX/Linux

set updatetime=100
au TextChangedI * GitGutter

" =======================
" === plugins install ===
" =======================
call plug#begin('~/.local/share/nvim/plugged')

" My Bundles here:
Plug 'iCyMind/NeoSolarized'
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/xml.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'neomake/neomake'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/wildfire.vim'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'TimothyYe/vim-ydict'
Plug 'matze/vim-move'
Plug 'pbrisbin/vim-mkdir'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plugins for golang
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"Plugin(s) for Rust
"Plug 'rust-lang/rust.vim'
" ===      ===
" === ncm2 ===
" ===      ===
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'     "for python
Plug 'ncm2/ncm2-pyclang'  "for cpp
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

" ===                    ===
" === for neomake plugin ===
" ===                    ===
nnoremap <leader>m :Neomake<CR>
let g:neomake_open_list = 2
let g:neomake_list_height = 7


" ===                       ===
" === for easymotion plugin ===
" ===                       ===
" Settings for vim-easymotion
let g:EasyMotion_leader_key = "<Space>"

" ===                     ===
" === for vim-move plugin ===
" ===                     ===
let g:move_key_modifier = 'C'

" ===                ===
" === for ack plugin ===
" ===                ===   
let g:ackprg = 'ag --nogroup --nocolor --column'
" search word under cursor
noremap <Leader>s :Rg <cword><cr>
" ===           ===
" === for ag/rg ===
" ===           ===
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching=0
endif

" ===                  ===
" === for ydict plugin ===
" ===                  === 
vnoremap <leader>yv <Esc>:Ydv<CR>
nnoremap <leader>yc <Esc>:Ydc<CR>
nnoremap <leader>ye :<C-u>Yde<CR>

" ===                    ===
" === for airline plugin ===
" ===                    ===
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1
let g:airline_extensions=['tabline', 'tagbar']
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=1 " tab number
let g:airline#extensions#tabline#show_tab_nr=1
let g:airline#extensions#tabline#formatter='default'
let g:airline#extensions#tabline#buffer_nr_show=0
let g:airline#extensions#tabline#fnametruncate=16
let g:airline#extensions#tabline#fnamecollapse=2
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#fnamemod=':p:t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#hunks#enabled=0
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_highlighting_cache=1
let g:airline#extensions#tabline#show_tab_type=0

" ===            ===
" === for Golang ===
" ===            ===
let g:go_fmt_command="goimports"
let g:go_highlight_types=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_snippet_engine="neosnippet"

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def-tab)

au BufNewFile,BufRead *.go set filetype=go  noexpandtab tabstop=4 shiftwidth=4

" ===            ===
" === for python ===
" ===            ===
au BufRead,BufNewFile *.py set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab autoindent


" ===          ===
" === for Rust ===
" ===          ===
"let g:rustfmt_autosave=1

" ===           ===
" === scss,sass ===
" ===           ===
"au BufRead,BufNewFile *.scss set filetype=scss
"au BufRead,BufNewFile *.sass set filetype=scss

" ===               ===
" === coffee script ===
" ===               ===
au BufWritePost *.coffee silent CoffeeMake!
au BufWritePost *.coffee :CoffeeCompile watch vert

" ===                          ===
" === let skim use slim syntax ===
" ===                          ===
au BufRead,BufNewFile *.skim set filetype=slim


" ===                       ===
" === for neosnippet plugin ===
" ===                       ===
"NeoSnippet Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ===                   ===
" === for TagBar plugin ===
" ===                   ===
nnoremap <leader>g :TagbarToggle<CR>
let g:tagbar_type_go={
    \ 'ctagstype' : 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin' : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" ===                  ===
" === for ctrlp plugin ===
" ===                  ===
let g:ctrlp_map='<c-p>'
let g:ctrlp_custom_ignore='\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"use in  edit
imap <C-A> <C-C><c-p>
nnoremap <silent> <C-p> :Files<CR>

" ===                     ===
" === for NERDTree plugin ===
" ===                     ===
"let loaded_nerd_tree=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
let NERDChristmasTree=1
let g:NERDTreeWinSize=24 
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>v :NERDTreeFind<CR>

" ===                 ===
" === for ncm2 plugin ===
" ===                 ===
" gree outer PC conf
"let g:python3_host_prog='/home/260249/.pyenv/shims/python'
" macbook pro conf
let g:python3_host_prog='/Users/muzhi/.pyenv/shims/python'
let g:ncm2_pyclang#library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'


" ===                             ===
" === for markdown-preview plugin ===
" ===                             ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

