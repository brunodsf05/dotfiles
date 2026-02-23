#!/usr/bin/env bash

set -e

# --- RPM --- #

echo "Adding Terra repositories..."
rpm -q terra-release || sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# --- Flatpak --- #

echo "Installing flatpak..."
rpm -q flatpak || sudo dnf install -y flatpak

echo "Disabling fedora's flatpak repo..."
flatpak remotes | grep "fedora" && sudo flatpak remote-modify --disable fedora

echo "Adding flathub's flatpak repo..."
flatpak remotes | grep "fedora" || sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
