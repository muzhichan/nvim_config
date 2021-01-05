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

