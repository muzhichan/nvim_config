set -e
work_path=$(dirname $(readlink -f $0))
echo "work_path: ${work_path}"

if ! [ -x "$(command -v nvim)" ]; then
    echo "neovim install ..."
    apt-get install software-properties-common
    add-apt-repository ppa:neovim-ppa/stable
    apt update
    apt install neovim -y
else
    echo "neovim installed"
fi

if ! [ -x "$(command -v clang-10)" ]; then
    echo "clang install ..."
    apt install zlib1g-dev libncurses-dev \
        clang-10 libclang-10-dev -y

    ln -s /usr/bin/clang-10 /usr/bin/clang
else
    echo "clang installed"
fi

if ! [ -x "$(command -v ccls)" ]; then
    echo "ccls install ..."
    git clone --depth=1 --recursive https://github.com/MaskRay/ccls ${work_path}/ccls
    cd ${work_path}/ccls

    cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10/lib/clang/10.0.0 \
        -DLLVM_INCLUDE_DIR=/usr/lib/llvm-10/include \
        -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-10/

    cmake --build Release
    cd Release && make install
    rm -rf ${work_path}/ccls
else
    echo "ccls installed"
fi

# cd work_path
cd ${work_path}

if ! [ -x "$(command -v node)" ]; then
    echo "nodejs install ..."
    apt install -y curl
    curl -sL https://deb.nodesource.com/setup_12.x | bash -
    apt install -y nodejs
else
    echo "nodejs installed"
fi

if ! [ ! -d "~/.fzf" ]; then
    echo "fzf install ..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
else
    echo "fzf installed"
fi

if false; then
    apt install -y silversearcher-ag ctags
fi

pip install pynvim neovim -i https://pypi.tuna.tsinghua.edu.cn/simple

