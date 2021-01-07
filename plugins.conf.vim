"" vim-airline
"let s:plugins_dir = expand($DATA_PATH . "/plug/repo")
let s:plugins_dir = expand('~/.vim/plugged')

"if executable('rg')
"    set grepformat=%f:%l:%m
"    let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
"elseif executable('ag')
"    set grepformat=%f:%l:%m
"    let &grepprg = 'ag --vimgrep' . (&smartcase ? ' --smart-case' : '')
"endif

if isdirectory(expand(s:plugins_dir . '/vim-airline'))
    let g:airline_powerline_fonts=0
    "let g:airline_theme = 'wombat'
    let g:airline_theme = 'molokai'
    let g:airline#extensions#hunks#enabled=0
    "let g:airline_section_b = airline#section#create_left(['branchs'])
    let g:airline_section_z = '%3p%% %3l/%L:%3v'
endif

"" vim-sleuth
if isdirectory(expand(s:plugins_dir . '/vim-sleuth'))
    let g:sleuth_neighbor_limit = 5
endif

"" vim-clap
function! s:clap_mappings()
    nnoremap <silent> <buffer> <nowait>' :call clap#handler#tab_action()<CR>
    inoremap <silent> <buffer> <Tab>   <C-R>=clap#navigation#linewise('down')<CR>
    inoremap <silent> <buffer> <S-Tab> <C-R>=clap#navigation#linewise('up')<CR>
    nnoremap <silent> <buffer> <C-f> :<c-u>call clap#navigation#scroll('down')<CR>
    nnoremap <silent> <buffer> <C-b> :<c-u>call clap#navigation#scroll('up')<CR>

    nnoremap <silent> <buffer> sg  :<c-u>call clap#handler#try_open('ctrl-v')<CR>
    nnoremap <silent> <buffer> sv  :<c-u>call clap#handler#try_open('ctrl-x')<CR>
    nnoremap <silent> <buffer> st  :<c-u>call clap#handler#try_open('ctrl-t')<CR>

    nnoremap <silent> <buffer> q     :<c-u>call clap#handler#exit()<CR>
    inoremap <silent> <buffer> <Esc> <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
endfunction

if isdirectory(expand(s:plugins_dir . '/vim-clap'))
    let g:clap_cache_directory = $DATA_PATH . '/clap'
    let g:clap_theme = 'material_design_dark'
    let g:clap_layout = { 'relative': 'editor' }
    let g:clap_enable_icon = 1
    let g:clap_search_box_border_style = 'curve'
    let g:clap_provider_grep_enable_icon = 1
    let g:clap_prompt_format = '%spinner%%forerunner_status% %provider_id%: '
    highlight! link ClapMatches Function
    highlight! link ClapNoMatchesFound WarningMsg
endif
if isdirectory(expand(s:plugins_dir . '/vim-clap'))
    nnoremap <silent><LocalLeader>b :<C-u>Clap! buffers<CR>
    nnoremap <silent><LocalLeader>/ :<C-u>Clap! lines<CR>
    nnoremap <silent><LocalLeader>t :<C-u>Clap! tags<CR>
    nnoremap <silent><LocalLeader>gg :<C-u>Clap! grep<CR>
    nnoremap <silent><LocalLeader>j :<C-u>Clap! jumps<CR>
    nnoremap <silent><LocalLeader>h :<C-u>Clap! help_tags<CR>
    nnoremap <silent><LocalLeader>l :<C-u>Clap! loclist<CR>
    nnoremap <silent><LocalLeader>y :<C-u>Clap! yanks<CR>
    nnoremap <silent><LocalLeader>q :<C-u>Clap! quickfix<CR>

    autocmd user_events FileType clap_input call s:clap_mappings()
endif

"" defx.nvim
if isdirectory(expand(s:plugins_dir . '/defx.nvim'))
    nnoremap <silent> <LocalLeader>e
    \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
    nnoremap <silent> <LocalLeader>a
    \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
endif

"" g:indentLine
if isdirectory(expand(s:plugins_dir . '/indentLine'))
    let g:indentLine_fileTypeExclude = ['defx']
    let g:indentLine_setConceal = 0
    let g:indentLine_concealcursor = ''
endif

"" ncm2 --> ncm2/ncm2-pyclang
if isdirectory(expand(s:plugins_dir . '/ncm2'))
    if has('mac')
    let g:ncm2_pyclang#library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
    endif
    if has('unix')
    let g:ncm2_pyclang#library_path='/usr/lib64/llvm/libclang.so'
    endif
endif

"" ack.vim
" 用 ,a 搜索当前 cursor 下单词
if isdirectory(expand(s:plugins_dir . '/ack.vim'))
    noremap <Leader>ac :Ack <cword><cr>
endif
" if executable('ag')
    " noremap <leader>a :Ag! -w "<cword>"<cr>
" else
    " noremap <Leader>a :Ack <cword><cr>
" endif

"" fzf.vim
if isdirectory(expand(s:plugins_dir . '/fzf.vim'))
    nnoremap <silent> <Leader>a :Ag <C-R><C-W><CR>
    "nnoremap <silent> <c-p> :<c-u>Files<CR>
    nnoremap <silent> <Leader><space> :Files<CR>
    "Lines in current buf
    nnoremap <silent> <Leader>/ :BLines<CR>
    "Lines in loaded buf
    nnoremap <silent> <Leader>m :Lines<CR>
    nnoremap <silent> <Leader>b :Buffers<CR>
endif

"" vim-gutentags
if isdirectory(expand(s:plugins_dir . '/vim-gutentags'))
    " gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

    " 所生成的数据文件的名称 "
    let g:gutentags_ctags_tagfile = '.tags'

    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags
    " 检测 ~/.cache/tags 不存在就新建 "
    if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
    endif

    " 配置 ctags 的参数 "
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
endif

" nerdcommenter
if isdirectory(expand(s:plugins_dir . '/nerdcommenter'))
    let g:NERDSpaceDelims = 1
    let g:NERDDefaultAlign = 'left'
    let g:NERDCustomDelimiters = {
        \ 'javascript': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' },
        \ 'less': { 'left': '/**', 'right': '*/' }
        \ }

    let g:NERDAltDelims_javascript = 1
    let g:NERDDefaultNesting = 0
endif

if isdirectory(expand(s:plugins_dir . '/rainbow_parentheses.vim'))
    let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

    " 不加入这行, 防止黑色括号出现, 很难识别
    " \ ['black',       'SeaGreen3'],

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
endif

if isdirectory(expand(s:plugins_dir . '/incsearch.vim'))
    nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
endif


"" coc.vim conf {{{
" coc.nvim settings
" -----------------

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-python',
    \ 'coc-json',
    \ 'coc-pairs'
    \]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup user_plugin_coc
    autocmd!
    autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap gs <Plug>(coc-git-chunkinfo)
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show commit contains current position
nmap gC <Plug>(coc-git-commit)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        let l:found = CocAction('doHover')
    endif
endfunction

"" }}}

"" defx {{{
"" --------
" :h defx
" ---
" Problems? https://github.com/Shougo/defx.nvim/issues
call defx#custom#option('_', {
    \ 'winwidth': 25,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'show_ignored_files': 0,
    \ 'root_marker': ' ',
    \ 'ignored_files':
    \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
    \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc'
    \ })

"call defx#custom#column('git', {
"    \   'indicators': {
"    \     'Modified'  : '•',
"    \     'Staged'    : '✚',
"    \     'Untracked' : 'ᵁ',
"    \     'Renamed'   : '≫',
"    \     'Unmerged'  : '≠',
"    \     'Ignored'   : 'ⁱ',
"    \     'Deleted'   : '✖',
"    \     'Unknown'   : '⁇'
"    \   }
"    \ })

call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })

" defx-icons plugin
let g:defx_icons_column_length = 2
let g:defx_icons_mark_icon = ''

" Internal use
let s:original_width = get(get(defx#custom#_get().option, '_'), 'winwidth')

" Events
augroup user_plugin_defx
    autocmd!

    " Delete defx if it's the only buffer left in the window
    autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif

    " Move focus to the next window if current buffer is defx
    autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

    " Clean Defx window once a tab-page is closed
    " autocmd TabClosed * call <SID>defx_close_tab(expand('<afile>'))

    " Automatically refresh opened Defx windows when changing working-directory
    " autocmd DirChanged * call <SID>defx_handle_dirchanged(v:event)

    " Define defx window mappings
    autocmd FileType defx call <SID>defx_mappings()

    " autocmd WinEnter * if &filetype ==# 'defx'
    "	\ |   silent! highlight! link CursorLine TabLineSel
    "	\ | endif
    "
    " autocmd WinLeave * if &filetype ==# 'defx'
    "	\ |   silent! highlight! link CursorLine NONE
    "	\ | endif

augroup END

" Internal functions
" ---

function! s:defx_close_tab(tabnr)
    " When a tab is closed, find and delete any associated defx buffers
    for l:nr in tabpagebuflist()
        if getbufvar(l:nr, '&filetype') ==# 'defx'
            silent! execute 'bdelete '.l:nr
            break
        endif
    endfor
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    " return defx#do_action('multi', ['drop', 'quit'])
    return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_mappings() abort
    " Defx window keyboard mappings
    setlocal signcolumn=no expandtab

    nnoremap <silent><buffer><expr> <CR>  <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> e     <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> t     defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> st    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
    nnoremap <silent><buffer><expr> sv    defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
    nnoremap <silent><buffer><expr> sg    defx#do_action('multi', [['drop', 'split'], 'quit'])
    nnoremap <silent><buffer><expr> P     defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> y     defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')

    " Defx's buffer management
    nnoremap <silent><buffer><expr> q      defx#do_action('quit')
    nnoremap <silent><buffer><expr> se     defx#do_action('save_session')

    " File/dir management
    nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
    nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
    nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')
    nnoremap <silent><buffer><expr><nowait> r  defx#do_action('rename')
    nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N  defx#do_action('new_multiple_files')

    " Change directory
    nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
    " nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
    nnoremap <silent><buffer><expr><nowait> & defx#do_action('cd', defx#get_candidate().action__path)
    nnoremap <silent><buffer><expr> <BS>  defx#async_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
    nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
    nnoremap <silent><buffer><expr> 3u  defx#do_action('cd', ['../../..'])
    nnoremap <silent><buffer><expr> 4u  defx#do_action('cd', ['../../../..'])
endfunction

"" }}}

