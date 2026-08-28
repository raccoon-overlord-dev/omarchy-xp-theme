#!/bin/bash
# Applies the ModernXP cursor theme for any windows-xp* omarchy theme,
# reverts to the system default cursor otherwise.
THEME_SLUG=$1

if [[ $THEME_SLUG == windows-xp* ]]; then
  CURSOR_THEME="ModernXP"
else
  CURSOR_THEME="default"
fi

hyprctl setcursor "$CURSOR_THEME" 24 >/dev/null 2>&1

if [[ -n ${DBUS_SESSION_BUS_ADDRESS:-} ]]; then
  gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME"
fi
