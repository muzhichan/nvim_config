## 安装 ccls

1. install clang+llvm

安装 clang-10，可以先搜索：`apt search clang`，然后：
```
apt install zlib1g-dev libncurses-dev

apt install clang-10 libclang-10-dev
```

2. install ccls

- 直接安装

Ubuntu20.04
```
apt install ccls
```

- build

CMAKE_PREFIX_PATH 可使用 `clang -print-resource-dir` 得到。
```
git clone --depth=1 --recursive https://github.com/MaskRay/ccls && cd ccls

cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10/lib/clang/10.0.0 \
    -DLLVM_INCLUDE_DIR=/usr/lib/llvm-10/include \
    -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-10/

cmake --build Release
cd Release && make install
```
## pre-require

```
if [ ! -f "{$HOME/.config/nvim/autoload/plug.vim}" ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt install -y nodejs

apt install silversearcher-ag

apt install ctags
```
## ccls + coc.nvim

- coc-settings.json

```
:CocConfig

// or
:CocLocalConfig
```

- compile_commands.json

cmakelists.txt 设置即可生成：

`set(CMAKE_EXPORT_COMPILE_COMMANDS "ON")`

然后将其链接到当前项目 root。

如果更新 compile_commands.json 后，错误提示未消失，可使用：`:CocRestart` 命令。

- .ccls

如果不能生成 compile_commands.json 文件可以在项目根目录添加 `compile_commands.json` 和 `.ccls` 文件，并在 .ccls 文件中配置如下：
https://github.com/MaskRay/ccls/wiki/Project-Setup#ccls-file

## QnA

> update fzf?

`:PlugUpdate fzf`

