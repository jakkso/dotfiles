#!/usr/bin/env bash

# Define colors
RED="$(tput setaf 1)"
NORMAL="$(tput sgr0)"

colorEcho () {
    printf "${RED} $1${NORMAL}\n"
}

if [[ $(uname -s) == Linux ]]; then
  colorEcho "Installing essential libs"

  packages="build-essential bzip2 curl git lib32readline-dev lib32readline7
  libbz2-dev libffi-dev liblzma-dev libncurses5-dev libncursesw5-dev
  libreadline-dev libsqlite3-dev libssl-dev llvm make nodejs node-gyp
  npm openssl python-openssl sqlite3 tk-dev wget xz-utils zlib1g zlib1g-dev"
  sudo apt-get build-dep python3.8
  sudo apt install ${packages} -y || (colorEcho "Critical package installation failed, see output;  Exiting..." && exit 1)
  sudo npm install -g diff-so-fancy
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
ln -s $(realpath dotfiles) $HOME/.dotfiles
source $HOME/.bash_profile
cd ../..
if [[ $(uname -s) == Darwin ]]; then
    colorEcho "Setting up Mac..."
    source setup/install-mac.sh
elif [[ $(uname -s) == Linux ]]; then
    colorEcho "Setting up Linux..."
    source setup/install-linux.sh
fi
