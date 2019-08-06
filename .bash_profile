#!/usr/bin/env bash
# Source all dotfiles
for DOTFILE in `find ~/.dotfiles/common/`; do
    [[ -f "$DOTFILE" ]] && source "$DOTFILE"
done

for DOTFILE in `find ~/.dotfiles/$(uname -s)/`; do
	[[ -f "$DOTFILE" ]] && source "$DOTFILE"
done	


if type "$screenfetch" >/dev/null 2>&1; then
  screenfetch
fi
