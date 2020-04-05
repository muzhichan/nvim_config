call plug#begin('~/.local/share/nvim/plugged')



" Plug 'jremmen/vim-ripgrep'
" Plug 'mattn/emmet-vim'
" Plug 'scrooloose/nerdtree'
" Plug 'kien/ctrlp.vim'
" Plug 'scrooloose/nerdcommenter'
" Plug 'majutsushi/tagbar'
" Plug 'vim-scripts/xml.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'jiangmiao/auto-pairs'
" Plug 'flazz/vim-colorschemes'
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'terryma/vim-multiple-cursors'

" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Plug 'neomake/neomake'
" Plug 'mhinz/vim-startify'
" Plug 'vim-scripts/wildfire.vim'
" Plug 'yonchu/accelerated-smooth-scroll'
" Plug 'TimothyYe/vim-ydict'
" Plug 'matze/vim-move'
" Plug 'pbrisbin/vim-mkdir'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" "Plugins for golang
" Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries'}
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

"Plugin(s) for Rust
"Plug 'rust-lang/rust.vim'
" ===      ===
" === ncm2 ===
" ===      ===
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" " IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" " NOTE: you need to install completion sources to get completions. Check
" " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'     "for python
" Plug 'ncm2/ncm2-pyclang'  "for cpp
" "Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()