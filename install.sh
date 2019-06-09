#!/usr/bin/env bash

git clone https://github.com/jakkso/dotfiles.git
cd dotfiles
cp -r ./.gitignore ./.bash_profile ./.dotfiles/ ~

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
