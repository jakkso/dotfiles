# Source all dotfiles
for DOTFILE in `find ~/.dotfiles/`; do
    [[ -f "$DOTFILE" ]] && source "$DOTFILE"
done

command screenfetch
