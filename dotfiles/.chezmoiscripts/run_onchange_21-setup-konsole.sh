#!/usr/bin/env bash

set -e

command -v kwriteconfig6 && kwriteconfig6 --file konsolerc --group "Desktop Entry" --key DefaultProfile Mine.profile
