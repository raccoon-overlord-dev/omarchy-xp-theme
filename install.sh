#!/bin/bash
# Installs the Windows XP Omarchy theme (light + dark) and the ModernXP cursor.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing themes..."
mkdir -p ~/.config/omarchy/themes
cp -r "$ROOT/themes/windows-xp" ~/.config/omarchy/themes/
cp -r "$ROOT/themes/windows-xp-dark-mode" ~/.config/omarchy/themes/

echo "Installing ModernXP cursor..."
mkdir -p ~/.local/share/icons
rm -rf ~/.local/share/icons/ModernXP
cp -r "$ROOT/cursors/ModernXP" ~/.local/share/icons/

echo "Installing theme-set hook (switches the cursor with the theme)..."
omarchy hook install theme-set "$ROOT/hooks/theme-set.d/set-cursor-for-theme.sh"

echo
echo "Done. Apply with:"
echo "  omarchy theme set windows-xp"
echo "  omarchy theme set windows-xp-dark-mode"
