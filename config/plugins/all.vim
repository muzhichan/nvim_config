"" vim-airline
if 1
	let g:airline_powerline_fonts=1
	let g:airline_theme = 'wombat'
	" let g:airline_theme = 'molokai'
	let g:airline_left_sep=''
	let g:airline_right_sep=''
	" let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#vista#enabled = 0
	" muzhi start
	" let g:airline_extensions=['tabline', 'tagbar']
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#tab_nr_type=1 " tab number
	let g:airline#extensions#tabline#show_tab_nr=1
	" let g:airline#extensions#tabline#formatter='default'
	let g:airline#extensions#tabline#buffer_nr_show=0
	let g:airline#extensions#tabline#fnametruncate=16
	let g:airline#extensions#tabline#fnamecollapse=2
	let g:airline#extensions#tabline#buffer_idx_mode=1
	" let g:airline#extensions#tabline#fnamemod=':p:t'
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = ''
	let g:airline#extensions#hunks#enabled=0
	let g:airline_detect_modified=1
	let g:airline_detect_paste=1
	let g:airline_detect_crypt=1
	let g:airline_highlighting_cache=1
	let g:airline#extensions#tabline#show_tab_type=0
	" muzhi end
	function! ArilineInit()
		let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
		let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%F'])
		"let g:airline_section_c = airline#section#create(['filetype'])
		let g:airline_section_x = airline#section#create(['%P'])
		let g:airline_section_y = airline#section#create(['%B'])
		let g:airline_section_z = airline#section#create_right(['%l', '%c'])
	endfunction
	let g:airline_section_z = '%3p%% %3l/%L:%3v'
endif

"" vim-sleuth
if 1
	let g:sleuth_neighbor_limit = 5
endif

"" vim-clap
if 1
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
if 1
	" nnoremap <silent><LocalLeader>f :<C-u>Clap! files<CR>
	" nnoremap <silent><LocalLeader>b :<C-u>Clap! buffers<CR>
	" nnoremap <silent><LocalLeader>g :<C-u>Clap! grep<CR>
	nnoremap <silent><LocalLeader>j :<C-u>Clap! jumps<CR>
	nnoremap <silent><LocalLeader>h :<C-u>Clap! help_tags<CR>
	nnoremap <silent><LocalLeader>t :<C-u>Clap! tags<CR>
	nnoremap <silent><LocalLeader>l :<C-u>Clap! loclist<CR>
	nnoremap <silent><LocalLeader>q :<C-u>Clap! quickfix<CR>
	nnoremap <silent><LocalLeader>m :<C-u>Clap! files ~/docs/books<CR>
	nnoremap <silent><LocalLeader>y :<C-u>Clap! yanks<CR>
	nnoremap <silent><LocalLeader>/ :<C-u>Clap! lines<CR>
	nnoremap <silent><LocalLeader>* :<C-u>Clap! lines ++query=<cword><CR>
	nnoremap <silent><LocalLeader>; :<C-u>Clap! command_history<CR>

	" nnoremap <silent><Leader>gl :<C-u>Clap! commits<CR>
	" nnoremap <silent><Leader>gt :<C-u>Clap! tags ++query=<cword><CR>
	" xnoremap <silent><Leader>gt :<C-u>Clap! tags ++query=@visual<CR><CR>
	" nnoremap <silent><Leader>gf :<C-u>Clap! files ++query=<cword><CR>
	" xnoremap <silent><Leader>gf :<C-u>Clap! files ++query=@visual<CR><CR>
	" nnoremap <silent><Leader>gg :<C-u>Clap! grep ++query=<cword><CR>
	" xnoremap <silent><Leader>gg :<C-u>Clap! grep ++query=@visual<CR><CR>

	autocmd user_events FileType clap_input call s:clap_mappings()

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
		nnoremap <silent> <buffer> <Esc> :call clap#handler#exit()<CR>
		inoremap <silent> <buffer> <Esc> <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
		inoremap <silent> <buffer> jj    <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
	endfunction
endif

"" defx.nvim
if 1
	nnoremap <silent> <LocalLeader>e
		\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
endif


"" ncm2 --> ncm2/ncm2-pyclang
if 1
	let g:ncm2_pyclang#library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
endif

"" ack.vim
" 用 ,a 搜索当前 cursor 下单词
if executable('ag')
    noremap <leader>a :Ag! -w "<cword>"<cr>
else
    noremap <Leader>a :Ack <cword><cr>
endif

"" fzf.vim
if 1
	nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
	nnoremap <silent> <c-p> :Files <CR>
endif