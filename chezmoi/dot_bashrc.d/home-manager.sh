#!/usr/bin/env bash

SCRIPT="$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
[ -f "$SCRIPT" ] && . "$SCRIPT" || true
