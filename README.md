# System_Config
Configuration files
vim:
-------
.vimrc

tmux:
-------
.tmux.conf
Basic yaml configuration for node dev(tmuxp)

### zsh:

.zshrc

### bash:

.bashrc(fallback shell)

### install ZSH:

apt install zsh

### install Curl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### install vundle:

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

### install all plugins from terminal:
vim +PluginInstall +qall
