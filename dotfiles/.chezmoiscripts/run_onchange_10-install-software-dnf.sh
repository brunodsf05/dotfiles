#!/usr/bin/env bash

to_install=(
    # --- Art --- #
    "gimp"
    "inkscape"
    # --- Development --- #
    "gh"
    "git"
    "git-filter-repo"
    "zed"
    # --- Entertainment --- #
    "steam"
    # --- Fonts --- #
    "cascadia-fonts-all"
    "jetbrainsmono-nerd-fonts"
    "monaspace-nerd-fonts"
    # --- Terminal --- #
    "bat"
    "eza"
    "fastfetch"
    "fish"
    "fzf"
    "ghostty"
    "micro"
    "starship"
    "xdg-terminal-exec"
    "yazi"
    "zellij"
    "zoxide"
)

to_remove=(
    "@kde-pim"
    "@libreoffice"
    "firefox"
    "libreoffice-calc"
    "libreoffice-graphicfilter"
    "libreoffice-writer"
)

bash "$CHEZMOI_SOURCE_DIR/.chezmoiscripts/.run-in-terminal.sh" <<EOF
sudo dnf remove -y ${to_remove[*]};
sudo dnf install -y --skip-unavailable ${to_install[*]}
EOF
