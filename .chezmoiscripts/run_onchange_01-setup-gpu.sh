#!/usr/bin/env bash

set -e

[ "$(hostname)" = "aorus" ] || exit 0

echo "Installing NVIDIA drivers..."
rpm -q akmod-nvidia || sudo dnf install -y akmod-nvidia
rpm -q xorg-x11-drv-nvidia-cuda || sudo dnf install -y xorg-x11-drv-nvidia-cuda

echo "Configuring podman integration..."
if ! rpm -q nvidia-container-toolkit; then
  sudo dnf copr enable -y @ai-ml/nvidia-container-toolkit
  sudo dnf install -y nvidia-container-toolkit
fi
NVIDIA_CDI_FILE="/etc/cdi/nvidia.yaml"
if [ ! -f "$NVIDIA_CDI_FILE" ]; then
  echo "Generating NVIDIA CDI config..."
  sudo nvidia-ctk cdi generate --output="$NVIDIA_CDI_FILE"
echo "Done!"
else
  echo "NVIDIA CDI config already exists"
fi
sudo setsebool -P container_use_devices true
