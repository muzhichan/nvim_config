FROM python:3.6.12-stretch  # ubuntu:20.04

RUN pip install pynvim neovim

RUN apt-get update && apt-get install -y --no-install-recommends \
  software-properties-common \
  && apt update \
  && add-apt-repository ppa:neovim-ppa/stable \
  && apt install -y --no-install-recommends \
    neovim \
	curl \
	clang \
	snap \
	ctags \
  && snap install ccls --classic \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt install -y nodejs \

  && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
  && ~/.fzf/install

