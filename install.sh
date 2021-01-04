if [ ! -f "{$HOME/.config/nvim/autoload/plug.vim}" ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt install -y nodejs

apt install silversearcher-ag

# install ccls
apt install zlib1g-dev libncurses-dev
# You need PPA before run llvm.sh
apt install software-properties-common
apt update
# Install with llvm.sh
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

git clone --depth=1 --recursive https://github.com/MaskRay/ccls && cd ccls

cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10/lib/clang/10.0.0 \
    -DLLVM_INCLUDE_DIR=/usr/lib/llvm-10/include \
    -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-10/

