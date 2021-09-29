#!/bin/bash

########
# nvim #
########

mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"

ln -sf "$DOTFILES/nvim/spell" "$XDG_CONFIG_HOME/nvim/colors"
ln -sf "$DOTFILES/nvim/ftdetect" "$XDG_CONFIG_HOME/nvim/ftdetect"
ln -sf "$DOTFILES/nvim/ftplugin" "$XDG_CONFIG_HOME/nvim/ftplugin"
ln -sf "$DOTFILES/nvim/plugged" "$XDG_CONFIG_HOME/nvim/plugged"
ln -sf "$DOTFILES/nvim/spell" "$XDG_CONFIG_HOME/nvim/spell"
ln -sf "$DOTFILES/nvim/syntax" "$XDG_CONFIG_HOME/nvim/thesaurus"
ln -sf "$DOTFILES/nvim/ultsnips" "$XDG_CONFIG_HOME/nvim/ultsnips"

ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"

# install neovim plugin manager
[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"


# Install (or update) all the plugins
nvim --noplugin +PlugUpdate +qa

#######
# X11 #
#######

rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

######
# i3 #
######

rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

#######
# zsh #
#######

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

#########
# Fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

#########
# Dunst #
#########

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

########
# tmux #
########

mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

[ ! -d "$XDG_CONFIG_HOME/tmux/plugins" ] \
&& git clone https://github.com/tmux-plugins/tpm \
"$XDG_CONFIG_HOME/tmux/plugins/tpm"

########
# mutt #
########

mkdir -p "$XDG_CONFIG_HOME/mutt"
#mkdir -p "$XDG_CONFIG_HOME/mutt/accounts"
ln -sf "$DOTFILES/mutt/muttrc" "$XDG_CONFIG_HOME/mutt/muttrc"
ln -sf "$DOTFILES/mutt/accounts" "$XDG_CONFIG_HOME/mutt"

########
# task #
########

mkdir -p "$XDG_CONFIG_HOME/taskwarrior"
ln -sf "$DOTFILES/taskwarrior/taskrc" "$XDG_CONFIG_HOME/taskwarrior/taskrc"


