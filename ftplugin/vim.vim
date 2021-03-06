  
let s:save_cpo = &cpoptions
set cpoptions&vim

if exists('b:undo_ftplugin')
	let b:undo_ftplugin .= ' | '
else
	let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl modeline<'

setlocal iskeyword+=:,#
setlocal foldmethod=indent
setlocal keywordprg=:help
setlocal conceallevel=0

" For gf
let &l:path = join(map(split(&runtimepath, ','), 'v:val."/autoload"'), ',')
setlocal suffixesadd=.vim
setlocal includeexpr=fnamemodify(substitute(v:fname,'#','/','g'),':h')

let &cpoptions = s:save_cpo

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
" setlocal textwidth=120
setlocal expandtab
setlocal smarttab
