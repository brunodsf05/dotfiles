#!/usr/bin/env bash

set -e

sudo chsh -s /usr/bin/fish $USER
rpm -q konsole kf6-kconfig && kwriteconfig6 --file konsolerc --group "Desktop Entry" --key DefaultProfile Mine.profile
