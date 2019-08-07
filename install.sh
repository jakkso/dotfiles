#!/usr/bin/env bash

# Define colors
RED="$(tput setaf 1)"
NORMAL="$(tput sgr0)"

colorEcho () {
    printf "${RED} $1${NORMAL}\n"
}

colorEcho "Downloading git autocompletion."
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

colorEcho "Installing git-so-diff"
source setup/git-so-diff-install.sh

colorEcho "Cloning dotfiles..."
git clone https://github.com/jakkso/dotfiles.git

colorEcho "Setting up dotfiles"
cd dotfiles/dotfiles/globals/
for FILE in $(ls); do
	rm -rf ~/.$FILE
	ln -s `realpath $FILE` ~/.$FILE
done
cd ..
ln -s dotfiles/dotfiles ~/.dotfiles


if [[ $(uname -s) == Darwin ]]; then
	colorEcho "Setting up Mac"
	cd ../../setup
	source install-mac.sh
fi
