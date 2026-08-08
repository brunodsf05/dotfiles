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
    "org.mozilla.firefox"
    "org.mozilla.thunderbird_esr"
    "org.qbittorrent.qBittorrent"
)

bash $CHEZMOI_SOURCE_DIR/.chezmoiscripts/.run-in-terminal.sh <<EOF
flatpak install -y flathub ${to_install[*]}
EOF
