#!/usr/bin/env sh
# GNOME Keybindings and Settings Setup
# Run this script after first login to apply custom settings

set -eu

echo "Setting up GNOME keybindings and settings..."

# Enable fractional scaling
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Close window keybind
dconf write /org/gnome/desktop/wm/keybindings/close "['<Super>q', '<Alt>F4']"

# Declare custom keybindings
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/']"

# Nautilus (Super+E)
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Nautilus'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'nautilus --new-window'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Super>e'"

# Terminal (Super+T)
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'Terminal'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'blackbox-terminal'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Super>t'"

# Emojis (Super+.)
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/name "'Emojis'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/command "'flatpak run it.mijorus.smile'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/binding "'<Super>.'"

# Screenshot (Super+Print)
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/name "'Screenshot'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/command "'flatpak run be.alexandervanhee.gradia --screenshot'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/binding "'<Super>Print'"

# Firefox (Super+W)
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/name "'Firefox'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/command "'flatpak run org.mozilla.firefox'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/binding "'<Super>w'"

# Keybindings and Adjustments
flatpak override --user --filesystem=xdg-config/gtk-4.0:ro
flatpak override --user --filesystem=xdg-config/gtk-3.0:ro

echo "✓ Keybindings and adjustments configured!"
