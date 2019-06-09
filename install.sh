#!/usr/bin/env bash

cp -r ./.gitignore ./.bash_profile ./.dotfiles/ ~

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
