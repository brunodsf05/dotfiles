#!/usr/bin/env bash

set -e

[ "$(hostname)" = "aorus" ] || exit 0

echo "Installing NVIDIA drivers..."
rpm -q akmod-nvidia || sudo dnf install -y akmod-nvidia
rpm -q xorg-x11-drv-nvidia-cuda || sudo dnf install -y xorg-x11-drv-nvidia-cuda
