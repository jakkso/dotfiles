#!/usr/bin/env bash

git clone https://github.com/
cd dotfiles
cp -r .dotfiles/ ~
cd ~/.dotfiles/
cp .bash_profile ~
cp .gitignore ~

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
