连续两条命令在一起时，请按 enter 键继续，试试 `:set cmdheight=2`
## install

* pip install -U pynvim neovim

* neovim version >= 0.4

* `:checkhealth`，查看安装环境情况

* coc.nvim 需要 node(centos 下注意升级以下 node 版本，使用 n 管理 node 版本)。coc.vim 在装完 ncm2 系列后执行：`:CocCommand -> python.setInterpreter` 选取对应环境即可。如果显示 python.setInterpreter not found，试试 `:CocInstall coc-python`，然后打开一个 python 文件在进行上述操作，可能是 ncm2 造成的。

* ncm2 记得进行 python 和 cpp 配置。

* fzf 按照官网安装，先安装 [fzf](https://github.com/junegunn/fzf)，再安装 [The Silver Searcher, ag 命令需要](https://github.com/ggreer/the_silver_searcher)

* nerd-fonts 安装

[安装 hack 字体](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
```
wget -c https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip

unzip it

mkdir -p ~/.local/share/fonts/ && mv ttf/* ~/.local/share/fonts/

fc-cache -f -v

fc-list | grep "Hack"
```

安装 `Sauce Code Pro Nerd Font`:
```
1. 到 https://www.nerdfonts.com/font-downloads 下载对应字体

2. unzip and mv to [~/.local/share/fonts/]

3. fc-cache -vf ~/.local/share/fonts/

4. terminal config it
```

[buffers, tabs, windows & modes](http://springest.io/vim-buffers-tabs-windows-and-modes)
[buffer](https://harttle.land/2015/11/17/vim-buffer.html)

## mapping

在Vim中有很多默认的方式可以退出插入模式：
```
<esc>
<c-c>
<c-[>

terminal esc: <C-\><C-n>
```

## customes mapping
```
let g:mapleader=","
let g:maplocalleader=';'

<leader>b  关闭当前 buf
<leader>w  写入文件
```
## plugin install and use

## vim 理解

### buffer/window/tab

> **buffers**: A buffer in Vim is an open instance of a file. This means that the file may not be visible on the current screen, but it is saved somewhere in memory.

