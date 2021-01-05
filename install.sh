if [ ! -f "{$HOME/.config/nvim/autoload/plug.vim}" ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt install -y nodejs

apt install silversearcher-ag

