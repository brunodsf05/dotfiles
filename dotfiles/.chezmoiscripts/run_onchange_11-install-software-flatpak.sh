#!/usr/bin/env bash

to_install=(
    # --- Development --- #
    "io.github.MakovWait.Godots"
    # --- Entertainment --- #
    "com.heroicgameslauncher.hgl"
    "com.stremio.Stremio"
    "info.cemu.Cemu"
    "io.github.Faugus.faugus-launcher"
    "org.DolphinEmu.dolphin-emu"
    "org.prismlauncher.PrismLauncher"
    # --- Tools --- #
    "ai.lmstudio.lm-studio"
    "flathub org.localsend.localsend_app"
    "io.gitlab.theevilskeleton.Upscaler"
    "org.chromium.Chromium"
    "org.keepassxc.KeePassXC"
    "org.mozilla.firefox"
    "org.onlyoffice.desktopeditors"
    "org.qbittorrent.qBittorrent"
)

bash $CHEZMOI_SOURCE_DIR/.chezmoiscripts/.run-in-terminal.sh <<EOF
flatpak install -y flathub ${to_install[*]}
EOF
