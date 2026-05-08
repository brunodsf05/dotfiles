#!/usr/bin/env bash

set -e

# --- RPM --- #

# --- Investigate if it is really needed ---
# echo "Making DNF faster..."
# CONF="/etc/dnf/dnf.conf"
# grep -q "^\[main\]" "$CONF" || echo "[main]" | sudo tee -a "$CONF"
# grep -q "^max_parallel_downloads=" "$CONF" || echo "max_parallel_downloads=20" | sudo tee -a "$CONF"
# grep -q "^fastestmirror=" "$CONF" || echo "fastestmirror=True" | sudo tee -a "$CONF"

echo "Adding Terra repositories..."
rpm -q terra-release || sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

echo "Adding RPM Fusion..."
rpm -q rpmfusion-free-release || sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
rpm -q rpmfusion-nonfree-release || sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# --- Flatpak --- #

echo "Installing flatpak..."
rpm -q flatpak || sudo dnf install -y flatpak

echo "Disabling fedora's flatpak repo..."
flatpak remotes | grep "fedora" && sudo flatpak remote-modify --disable fedora

echo "Adding flathub's flatpak repo..."
flatpak remotes | grep "fedora" || sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
