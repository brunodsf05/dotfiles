#!/usr/bin/env bash

set -e

# --- General --- #
echo "Making DNF faster... (/etc/dnf/dnf.conf)"
sudo dnf5 config-manager setopt max_parallel_downloads=10 fastestmirror=True

# echo "Adding Terra repositories..."
# rpm -q terra-release || sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

echo "Installing RPM Fusion and Flatpak..."
sudo dnf install -y \
    "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" \
    flatpak

# --- Flatpak --- #

echo "Disabling fedora's flatpak repo..."
flatpak remotes | grep "fedora" && sudo flatpak remote-modify --disable fedora

echo "Adding flathub's flatpak repo..."
flatpak remotes | grep "fedora" || sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
