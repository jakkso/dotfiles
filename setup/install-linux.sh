#!/usr/bin/env bash

pyenv update
pyenv install 3.8.0
pyenv global 3.8.0
pip install -U pip
pip install black flake8 requests coverage
