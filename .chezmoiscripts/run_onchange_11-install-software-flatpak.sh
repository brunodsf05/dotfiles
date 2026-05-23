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
    "org.mozilla.Thunderbird"
    "org.mozilla.firefox"
    "org.qbittorrent.qBittorrent"
)

flatpak_install() {
    local missing=()

    # Collect missing Flatpak apps
    for app in "$@"; do
        flatpak info "$app" >/dev/null 2>&1 || missing+=("$app")
    done

    # Install at once the missing
    if [ "${#missing[@]}" -gt 0 ]; then
        printf "Installing flatpak:\n${missing[*]}\n"
        flatpak install -y flathub "${missing[@]}"
    else
        echo "All flatpak apps already installed"
    fi
}

flatpak_install "${to_install[@]}"
