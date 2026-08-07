#!/usr/bin/env bash

# Replace the current interactive Bash shell with fish.
# Fish inherits the login state so it behaves exactly as the Bash it replaces.
# Using exec avoids spawning a child shell, making fish the session shell.

case $- in
    *i*)
        command -v fish >/dev/null 2>&1 || return # Fish installed.
        grep -qv 'fish' /proc/$PPID/comm || return # Not already in fish.
        [[ ${SHLVL} == [1,2] ]] || return # First shell only.

        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION='' # Keep login state.
        exec fish $LOGIN_OPTION # Replace Bash.
        ;;
esac
