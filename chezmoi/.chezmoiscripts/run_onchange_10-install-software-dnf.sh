#!/usr/bin/env bash

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

bash "$CHEZMOI_SOURCE_DIR/.chezmoiscripts/.run-in-terminal.sh" <<EOF
sudo dnf remove -y firefox;
sudo dnf install -y --skip-unavailable ${to_install[*]}
EOF
