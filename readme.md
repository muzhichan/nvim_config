## install

```bash
git clone https://github.com/muzhichan/nvim_config.git ~/.config/nvim
```

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

- 修改相关配置

**python 配置**

在 `config/init.vim` 中修改 `python3_host_prog` 对应路径。

## build-in

### buffer/window/tab

* [buffers, tabs, windows & modes](http://springest.io/vim-buffers-tabs-windows-and-modes)
* [buffer](https://harttle.land/2015/11/17/vim-buffer.html)

> **buffers**: A buffer in Vim is an open instance of a file. This means that the file may not be visible on the current screen, but it is saved somewhere in memory.

* tab 常用操作
  * :tabe -- eOpen a new tab
  * :tabe [file] -- Open a new tab with [file]
  * :tabc -- Close current tab
  * :gt -- Move to next tab
  * :gT -- Move to previous tab

* window 常用操作
  * :split -- horizon split screen
  * :vsplit -- vertical split screen
  * :split [file] -- split and open with file

* buffer 常用操作
  * :buf 2 -- second buffer
  * :bn -- next buffer
  * :bp -- previous buffer
  * :bd -- close current buffer

### shortcut and mapping

键盘符号说明：

```
:h key-notation
```

在Vim中有很多默认的方式可以退出插入模式：

```
<esc>
<c-c>
<c-[>

terminal esc: <C-\><C-n>
```

## custom config

* leader=","
* localleader=";"

### 键映射

|key bind|func|
|:------------|:-------------|
|\<leader>w    |写入文件       |
|[b            |切换到上一 buffer|
|[n            |切换到下一 buffer|
|\<leader>t    |水平分屏进入 terminal|
|\<leader>T    |垂直分屏进入 terminal|

- defx.nvim

|key bind|func|
|:------------|:-------------|
|\<localleader>e    |打开目录树|
|\<localleader>a    |从编辑窗口回到目录树上一位置|

- fzf.nvim

|key bind|func|
|:------------|:-------------|
|\<leader>a     |全局搜索当前光标下的单词|
|\<C-p>         |全局搜索文件|
|\<leader>b     |搜索 buffer|

- vim-clap

|key bind|func|
|:------------|:-------------|
|\<localleader>m      |files|
|\<localleader>j      |jump|
|\<localleader>/      |lines|


* scrooloose/nerdcommenter

|key bind|func|
|:------------|:-------------|
|\<leader>c\<space>|注释/取消注释|
|\<leader>cc       |注释 //       |
|\<leader>cm       |只用一组符号注释|
|\<leader>cA       |在行尾添加注释|
|\<leader>c$       |/* 注释 */   |
|\<leader>cs       |/* 块注释 */|
|\<leader>cy       |注释并复制   |
|\<leader>ca       |切换 // 和 /* */|
|\<leader>cu       |取消注释     |

### plugins

#### Language Server Client

**1. LanguageClient-neovim**

异步，python 插件，支持大部分 language server 操作，支持 deoplete 和 ncm2 两个补全框架。

**2. vim-lsp**

异步，纯 vim script 插件，支持 asyncomplete, deoplete 和 ncm2 三个补全框架，部分 lsp 支持有问题。

**3. coc.nvim**

异步，nodejs 后端，全部 language server 操作，支持 coc.nvim 本身的补全框架。

**3.1 c/cpp completion**

[ccls](https://github.com/MaskRay/ccls) + coc.nvim

补全配置，使用 clang，可能出现头文件找不到的情况，解决方案如下：

clang 的路径输出命令：
```
clang -v -fsyntax-only -x c++ /dev/null

clang -print-resource-dir
```

* [some-cc-headers-are-not-recognized](https://github.com/MaskRay/ccls/wiki/FAQ#some-cc-headers-are-not-recognized)
* [clang-resource-directory](https://github.com/MaskRay/ccls/wiki/Install#clang-resource-directory)
* [using_ccls_server_with_cocnvim_for_c_development](https://www.reddit.com/r/neovim/comments/e6uhhf/using_ccls_server_with_cocnvim_for_c_development/)
* [configure-coc-nvim-for-c-c++-development](https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/)

**3.2 centos7 下安装 ccls**

centos7 默认 clang+llvm 版本太低，可以使用 snap 进行 ccls 安装：
```
sudo yum install epel-release
sudo yum install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
```

#### others

**1. vim-gutentags**

vim-gutentags, [reference](https://zhuanlan.zhihu.com/p/43671939)


## 常见问题

> 连续两条命令在一起时，请按 enter 键继续，试试 `:set cmdheight=2`


> 一些设置项含义？


```
:se autochdir  --  含有打开的文件，这将自动切换到该目录

:cd %:h  --  切换到包含当前打开文件的目录

:echo getcwd()
```

## refs

* [1 如何让 vim 成为我们的神器](https://zhuanlan.zhihu.com/p/29936003)
* [2 有哪些好用到爆的vim插件](https://www.zhihu.com/question/23590572/answer/546352496)
* [3 C++和 Python 开发环境](https://juejin.im/post/5cdc396af265da03576ee968)

