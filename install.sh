#!/usr/bin/env bash

git clone https://github.com/
cd dotfiles
cp -r .dotfiles/ ~
cd ~/.dotfiles/
ln -sv .bash_profile ~
ln -sv .intputrc ~
ln -sv .gitignore ~

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
