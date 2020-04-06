连续两条命令在一起时，请按 enter 键继续，试试 `:set cmdheight=2`
## Trash
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [incsearch](https://github.com/haya14busa/incsearch.vim)
```
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
```

```
pip install -U pynvim neovim jedi
```
coc.vim 在装完 ncm2 系列后执行：`:CocCommand -> python.setInterpreter` 选取对应环境即可。

[buffers, tabs, windows & modes](http://springest.io/vim-buffers-tabs-windows-and-modes)
[buffer](https://harttle.land/2015/11/17/vim-buffer.html)

## mapping

在Vim中有很多默认的方式可以退出插入模式：
* <esc>
* <c-c>
* <c-[>

## customes mapping
```
	let g:mapleader=","
	let g:maplocalleader=';'

<leader>b  关闭当前 buf
<leader>w  写入文件
```
## plugin install and use

