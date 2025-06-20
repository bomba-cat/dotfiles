#!/bin/bash

THEME_DIR="$HOME/.config/i3/theme"
STATE_FILE="$THEME_DIR/.current_theme"
AVAILABLE_THEMES=(akame madokami miku)

# Get current theme
if [ -f "$STATE_FILE" ]; then
    CURRENT_THEME=$(cat "$STATE_FILE")
else
    CURRENT_THEME="${AVAILABLE_THEMES[0]}"
fi

# Find next theme
NEXT_INDEX=0
for i in "${!AVAILABLE_THEMES[@]}"; do
    if [ "${AVAILABLE_THEMES[$i]}" = "$CURRENT_THEME" ]; then
        NEXT_INDEX=$(( (i + 1) % ${#AVAILABLE_THEMES[@]} ))
        break
    fi
done
NEXT_THEME="${AVAILABLE_THEMES[$NEXT_INDEX]}"

# Apply theme
echo "$NEXT_THEME" > "$STATE_FILE"
cp "$THEME_DIR/$NEXT_THEME/color.conf" "$THEME_DIR/theme.conf"
feh --bg-fill "$THEME_DIR/$NEXT_THEME/bg.png"

i3-msg reload
#i3-msg restart

# Optional: Apply kitty theme if exists
KITTY_CONF_SRC="$THEME_DIR/$NEXT_THEME/kitty.conf"
KITTY_CONF_DEST="$HOME/.config/kitty/theme.conf"

if [ -f "$KITTY_CONF_SRC" ]; then
    cp "$KITTY_CONF_SRC" "$KITTY_CONF_DEST"

    # Reload kitty theme for all running kitty instances
    pkill -USR1 kitty 2>/dev/null
fi

# Optional: Apply dmenu theme if exists
DMENU_CONF="$THEME_DIR/$NEXT_THEME/dmenu.conf"
if [ -f "$DMENU_CONF" ]; then
    cp "$DMENU_CONF" "$HOME/.config/i3/dmenu.conf"
fi

# sleep 0.5
# If theme has a picom.conf, copy it
PICOM_CONF_DEST="$HOME/.config/picom/picom.conf"

if [ -f "$THEME_DIR/$NEXT_THEME/picom.conf" ]; then
    cp "$THEME_DIR/$NEXT_THEME/picom.conf" "$PICOM_CONF_DEST"
fi
