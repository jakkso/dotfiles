#!/usr/bin/env bash

sudo apt update
sudo apt install build-essential nodejs \
  bzip2 libbz2-dev libreadline6 libreadline6-dev \
  libffi-dev libssl1.0-dev sqlite3 libsqlite3-dev \
  -y
curl https://pyenv.run | bash
reload
pyenv update
pyenv install 3.7.0
pyenv global 3.7.0
pip install black flake8 requests coverage
npm install -g diff-so-fancy
