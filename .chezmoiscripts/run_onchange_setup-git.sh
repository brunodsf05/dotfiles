#!/usr/bin/env bash

set -e

rpm -q git || sudo dnf install -y git
rpm -q git-filter-repo || sudo dnf install -y git-filter-repo

git config --global user.name "brunodsf05"
git config --global user.email "231746160+brunodsf05@users.noreply.github.com"
git config --global init.defaultBranch "main"
git config --global alias.authors 'shortlog -s -n -e'
