#!/usr/bin/env bash

tmp_script="$(mktemp)"

cat > "$tmp_script" <<EOF
#!/usr/bin/env bash
$(cat)
pw-play /usr/share/sounds/freedesktop/stereo/complete.oga
printf '\nPress Enter to close...'
read -r || true
exit 0
EOF

chmod +x "$tmp_script"

if command -v xdg-terminal-exec >/dev/null 2>&1; then
    xdg-terminal-exec -- bash "$tmp_script" &
else
    bash "$tmp_script"
fi
