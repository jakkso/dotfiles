#!/usr/bin/env bash

# Define colors
RED="$(tput setaf 1)"
NORMAL="$(tput sgr0)"

colorEcho () {
    printf "${RED} $1${NORMAL}\n"
}

colorEcho "Creating ~/bin"
mkdir $HOME/bin/ &> /dev/null
cd $HOME/bin/

colorEcho "Cloning dotfiles..."
git clone https://github.com/jakkso/dotfiles.git
cd dotfiles

colorEcho "Installing git-so-diff"
source setup/git-so-diff-install.sh

colorEcho "Downloading git autocompletion."
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

colorEcho "Setting up dotfiles"
cd dotfiles/globals
for FILE in $(ls); do
    rm -rf ~/.${FILE}
    ln -s $(realpath ${FILE}) ~/.${FILE}
done
cd ../..

ln -s $(realpath dotfiles) ~/.dotfiles

if [[ $(uname -s) == Darwin ]]; then
    colorEcho "Setting up Mac"
    source setup/install-mac.sh
fi
