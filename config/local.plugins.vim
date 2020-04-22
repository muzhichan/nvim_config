let s:plugins_dir = expand($DATA_PATH . "/plug/repo")

call plug#begin(s:plugins_dir)

" echo "loading plugins ..."

Plug 'mhinz/vim-startify'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'

Plug 'itchyny/vim-gitbranch'

Plug 'scrooloose/nerdcommenter'

Plug 'Shougo/context_filetype.vim'
" Plug 'wellle/visual-split.vim'
if ! (has('win32') || has('win64'))
	Plug 'christoomey/vim-tmux-navigator'
endif

Plug 'tpope/vim-sleuth'
Plug 'liuchengxu/vim-clap'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  " execute 'source' expand($VIM_PATH . '/config/plugins/defx.vim')
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" ==========================================
" 快速编辑
" ========
" Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'haya14busa/incsearch.vim'  " 文件内搜索
" Plug 'haya14busa/incsearch-fuzzy.vim'

" ==========================================
" Commands
" =========
Plug 'mileszs/ack.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Use release branch (Recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" " Or build from source code by use yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" ==========================================
" Completion and code analysis
" ----------

"""""""""
" ncm2
"""""""""
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
" for languages
Plug 'ncm2/ncm2-jedi'     "for python
Plug 'ncm2/ncm2-pyclang'  "for cpp
""""""""
" ctags --> tags
""""""""
Plug 'ludovicchabant/vim-gutentags'

call plug#end()
