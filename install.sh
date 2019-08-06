#!/usr/bin/env bash

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

ln -s "$(realpath dotfiles)" ~/.dotfiles
for FILE in `find ~/.dotfiles -maxdepth 1 -type f`; do
	ln -s `realpath $FILE` $HOME
done


if [[ $(uname -s) == Darwin ]]; then
	source install-mac.sh
fi
