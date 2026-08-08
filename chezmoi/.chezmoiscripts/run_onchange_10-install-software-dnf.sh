#!/usr/bin/env bash

sudo dnf remove -y firefox;

to_install=(
    # --- Art --- #
    "gimp"
    "inkscape"
    # --- Development --- #
    "gh"
    "git"
    "git-filter-repo"
    # --- Terminal --- #
    "bat"
    "eza"
    "fastfetch"
    "fish"
    "fzf"
    "micro"
    "xdg-terminal-exec"
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
