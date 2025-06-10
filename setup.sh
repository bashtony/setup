#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install -y tmux git curl

# Instalação do VIM e dependências.
if vim --version; then
    echo "VIM Já está instalado."
else
    sudo apt install -y clang make libtool-bin
    git clone https://github.com/vim/vim.git
    cd ./vim/src
    make
    sudo make install
    cd #
fi

# Instalação do Node.js
if node -v; then
    echo "Node.js já está instalado."
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v-1.40.2/install.sh | bash
    \. "$HOME/.nvm/nvm.sh"
    nvm install 21
fi

#Instalação do Vim-plug
if [ -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "Vim-plug já está instalado."
else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#Clonagem dos meus dotfiles
if [ -d "./dotfiles-public" ]; then
    echo "Os dotfiles já existem"
else
    git clone https://github.com/paulojsx/dotfiles-public.git
        cd dotfiles-public
        mv * .[^.]* ../
fi
