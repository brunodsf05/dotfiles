#!/usr/bin/env bash

# --- Utilities --- #

dnf_install() {
    local missing=()

    # Collect missing packages
    for pkg in "$@"; do
        rpm -q "$pkg" >/dev/null 2>&1 || missing+=("$pkg")
    done

    # Install at once the missing
    if [ "${#missing[@]}" -gt 0 ]; then
        printf "Installing dnf:\n${missing[*]}\n"
        sudo dnf install -y --skip-unavailable "${missing[@]}"
    else
        echo "All packages already installed"
    fi
}

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

# --- Install packages --- #

dnf_packages=(
    # --- Art --- #
    "gimp"
    "inkscape"
    # --- Development --- #
    "gh"
    "git"
    "git-filter-repo"
    "nodejs"
    "pnpm"
    "zed"
    # --- Fonts --- #
    "cousine-nerd-fonts"
    "jetbrainsmono-nerd-fonts"
    "departuremono-nerd-fonts"
    # --- Terminal --- #
    "bat"
    "eza"
    "fastfetch"
    "fish"
    "fzf"
    "kitty"
    "micro"
    "starship"
    "yazi"
    "zellij"
    "zoxide"
)
flatpak_packages=(
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
    "org.qbittorrent.qBittorrent"
)

dnf_install "${dnf_packages[@]}"
flatpak_install "${flatpak_packages[@]}"

# --- Configuration --- #

sudo chsh -s /usr/bin/fish $USER
rpm -q konsole kf6-kconfig && kwriteconfig6 --file konsolerc --group "Desktop Entry" --key DefaultProfile Mine.profile
