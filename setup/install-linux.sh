#!/usr/bin/env bash

reload
pyenv update
pyenv install 3.8.0
pyenv global 3.8.0
pip install black flake8 requests coverage
