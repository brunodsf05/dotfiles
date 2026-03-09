#!/usr/bin/env bash

set -e

rpm -q git || { echo "Git configuration skipped because it is not installed."; exit 0; }

echo "Configuring git..."
git config --global user.name "brunodsf05"
git config --global user.email "231746160+brunodsf05@users.noreply.github.com"
git config --global init.defaultBranch "main"
git config --global alias.authors 'shortlog -s -n -e'
