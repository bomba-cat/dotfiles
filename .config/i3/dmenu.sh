#!/bin/bash

# Load dmenu colors
DMENU_CONF="$HOME/.config/i3/dmenu.conf"
[ -f "$DMENU_CONF" ] && . "$DMENU_CONF"

# Run dmenu_run with theme
dmenu_run -fn "$DMENU_FONT" -nb "$DMENU_NB" -nf "$DMENU_NF" -sb "$DMENU_SB" -sf "$DMENU_SF" -l 10 -p "${DMENU_PROMPT:-Run:}"
