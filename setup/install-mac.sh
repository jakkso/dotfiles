#!/bin/sh

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  colorEcho "Installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
colorEcho "Updating homebrew"
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
colorEcho "Installing Brewfile contents"
brew bundle

# Install global NPM packages
colorEcho "Installing node global packages"
npm install --global eslint
npm install --global yarn

# Install python and set global version
reload
pyenv update
pyenv install 3.7.0
pyenv global 3.7.0
pip install black flake8 requests coverage

# Set macOS preferences
# We will run this last because this will reload the shell
source macos
