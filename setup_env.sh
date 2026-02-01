#!/usr/bin/bash

# cp relevant files from dotfiles to ~
# .zshrc .vimrc .vim/ .node.yaml .tmux.conf
# install oh-my-zsh
# install plugins
# install lsp
# source ./zshrc
sudo apt install zsh &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
mv .zshrc.pre-oh-my-zsh .zshrc &&
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&
vim -c PluginInstall &&
source .zshrc
