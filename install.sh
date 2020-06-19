#!/usr/bin/env bash

# Define colors
RED="$(tput setaf 1)"
NORMAL="$(tput sgr0)"

colorEcho () {
    printf "${RED} $1${NORMAL}\n"
}

origDir=$(pwd)
if [[ $(uname -s) == Linux ]]; then
  colorEcho "Installing essential libs"

  # Should be everything to get python compiled
  packages="build-essential bzip2 curl git libbz2-dev libffi-dev
  liblzma-dev libncurses5-dev libncursesw5-dev libreadline-dev
  libsqlite3-dev libssl-dev llvm make openssl python-openssl
  sqlite3 tk-dev wget xz-utils zlib1g zlib1g-dev"

  # Apt won't figure the dependencies out in a single command or, more likely, I don't care to find out how
  nodePkgs="nodejs nodejs-dev npm"

  sudo apt update
  sudo apt install -y ${nodePkgs} || exit 1
  sudo apt install -y ${packages} || exit 1
  sudo npm install -g diff-so-fancy
  sudo apt upgrade -y
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
cd ../..
ln -s $(realpath dotfiles) $HOME/.dotfiles
source $HOME/.bash_profile
if [[ $(uname -s) == Darwin ]]; then
    colorEcho "Setting up Mac..."
    source setup/install-mac.sh
elif [[ $(uname -s) == Linux ]]; then
    colorEcho "Setting up Linux..."
    source setup/install-linux.sh
fi
if [[ -e $HOME/.bashrc ]]; then
  mv $HOME/.bashrc $HOME/.bashrc-backup
fi
cd ${origDir}