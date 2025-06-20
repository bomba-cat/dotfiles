#!/bin/bash

# Source dmenu colors
DMENU_CONF="$HOME/.config/i3/dmenu.conf"
[ -f "$DMENU_CONF" ] && . "$DMENU_CONF"

# Run flatpak picker with themed dmenu
flatpak run $(
  ls /var/lib/flatpak/exports/share/applications \
  | sed 's/\.desktop//' \
  | dmenu -fn "$DMENU_FONT" -nb "$DMENU_NB" -nf "$DMENU_NF" -sb "$DMENU_SB" -sf "$DMENU_SF" -l 10 -p "${DMENU_PROMPT:-Flatpak:}"
)
