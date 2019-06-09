# Source all dotfiles
for DOTFILE in `find ~/.dotfiles/`; do
    [[ -f "$DOTFILE" ]] && source "$DOTFILE"
done


if type "$screenfetch" >/dev/null 2>&1; then
  screenfetch
fi
