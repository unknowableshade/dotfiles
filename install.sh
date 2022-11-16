#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ~

ln -s $SCRIPT_DIR/.config

ln -s $SCRIPT_DIR/.gitconfig

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $SCRIPT_DIR/.tmux.conf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s $SCRIPT_DIR/.zshrc

if [ -x "$(command -v dnf)" ]; then
    sudo sh $SCRIPT_DIR/pkgs/dnf.sh
fi
