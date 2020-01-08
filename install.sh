#!/usr/bin/env bash

# Define colors
RED="$(tput setaf 1)"
NORMAL="$(tput sgr0)"

colorEcho () {
    printf "${RED} $1${NORMAL}\n"
}

if [[ $(uname -s) == Linux ]]; then
  colorEcho "Installing essential libs"
  sudo apt install build-essential npm nodejs bzip2 libbz2-dev \
    libreadline6 libreadline6-dev libffi-dev libssl1.0-dev \
    sqlite3 libsqlite3-dev git curl -Y
  npm install -g diff-so-fancy
  curl https://pyenv.run | bash
fi

colorEcho "Creating ~/bin"
mkdir $HOME/bin/ &> /dev/null
cd $HOME/bin/

colorEcho "Cloning dotfiles..."
git clone https://github.com/jakkso/dotfiles.git
cd dotfiles

colorEcho "Installing git-so-diff..."
source setup/git-so-diff-install.sh

colorEcho "Downloading git autocompletion..."
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

colorEcho "Setting up dotfiles..."
cd dotfiles/globals
for FILE in $(ls); do
    rm -rf ~/.${FILE}
    ln -s $(realpath ${FILE}) ~/.${FILE}
done
source $HOME/.bash_profile
cd ../..
ln -s $(realpath dotfiles) ~/.dotfiles
if [[ $(uname -s) == Darwin ]]; then
    colorEcho "Setting up Mac..."
    source setup/install-mac.sh
elif [[ $(uname -s) == Linux ]]; then
    colorEcho "Setting up Linux..."
    source setup/install-linux.sh
fi
