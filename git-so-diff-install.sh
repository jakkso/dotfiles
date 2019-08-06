#!/bin/sh

# Configure git to use diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# Now use better colors than git's default ones
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# Change header chunks to a more human readable format
git config --bool --global diff-so-fancy.changeHunkIndicators false

# Strip leading symbols
git config --bool --global diff-so-fancy.stripLeadingSymbols false

