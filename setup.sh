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
    # Descarregar e instalar a nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# Em vez de reiniciar a concha ou shell
\. "$HOME/.nvm/nvm.sh"

# Descarregar e instalar a Node.js:
nvm install 22

# Consultar a versão da Node.js:
node -v # Deveria imprimir "v22.16.0".
nvm current # Deveria imprimir "v22.16.0".

# Consultar a versão da npm:
npm -v # Deveria imprimir "10.9.2".

fi

#Clonagem dos meus dotfiles
if [ -d "./dotfiles-public" ]; then
    echo "Os dotfiles já existem"
else
    git clone https://github.com/paulojsx/dotfiles-public.git
        cd dotfiles-public
        mv * .[^.]* ../
fi
