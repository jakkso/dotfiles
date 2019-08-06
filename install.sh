#!/usr/bin/env bash

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

ln -s "$(realpath dotfiles)" ~/.dotfiles
ln -s "$HOME/.dotfiles/.bash_profile" $HOME 



if [[ $(uname -s) == Darwin ]]; then
	source install-mac.sh
fi
