#!/usr/bin/env bash

to_install=(
    # --- Development --- #
    "io.github.MakovWait.Godots"
    # --- Entertainment --- #
    "com.heroicgameslauncher.hgl"
    "com.stremio.Stremio"
    "io.github.Faugus.faugus-launcher"
    "org.prismlauncher.PrismLauncher"
    # --- Tools --- #
    "io.gitlab.theevilskeleton.Upscaler"
    "org.chromium.Chromium"
    "org.keepassxc.KeePassXC"
    "org.mozilla.thunderbird_esr"
    "org.mozilla.firefox"
    "org.qbittorrent.qBittorrent"
)

# Generate temporal script that runs in a new terminal
tmp_script="$(mktemp)"
cat > "$tmp_script" <<EOF
#!/usr/bin/env bash

flatpak install -y flathub ${to_install[*]}

pw-play /usr/share/sounds/freedesktop/stereo/complete.oga
printf '\\nPress Enter to close...'
read -r

rm -f "\$0"
EOF

chmod +x "$tmp_script"

xdg-terminal-exec -- bash "$tmp_script" &
