#!/usr/bin/env bash

to_install=(
    # --- Art --- #
    "gimp"
    "inkscape"
    # --- Development --- #
    "gh"
    "git"
    "git-filter-repo"
    "mise"
    "zed"
    # --- Fonts --- #
    "cousine-nerd-fonts"
    "jetbrainsmono-nerd-fonts"
    "departuremono-nerd-fonts"
    # --- Terminal --- #
    "alacritty"
    "bat"
    "eza"
    "fastfetch"
    "fish"
    "fzf"
    "micro"
    "starship"
    "xdg-terminal-exec"
    "yazi"
    "zellij"
    "zoxide"
)

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

dnf_install "${to_install[@]}"
