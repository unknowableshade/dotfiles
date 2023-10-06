#!/bin/bash

# Directory of the script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

ln -s -f "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc" # Link .zshrc
ln -s -f "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig" # Link .gitconfig
ln -s -f "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf" # Link .tmux.conf

mkdir -p "$HOME/.config/"
ln -s -f "$SCRIPT_DIR/.config/nvim" "$HOME/.config/nvim" # Link neovim
