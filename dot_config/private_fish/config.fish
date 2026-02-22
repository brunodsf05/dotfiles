set -g fish_greeting

if status is-interactive
    # --- Integrations --- #
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # --- Commnads --- #
    # Navigation
    abbr cd z
    abbr zz fzf-cd-widget
    # Display
    abbr c clear
    abbr ff fastfetch
    abbr ffc "clear && fastfetch"
    # Git
    abbr gita "git add ."
    abbr --set-cursor gitc "git commit -m '%'"
    abbr gitca "git commit --amend"
    abbr gitl "git log --all --graph --oneline"
    abbr gits "git status"
    # PackageManagement
    abbr kki "sudo dnf install"
    abbr kkig "sudo dnf group install"
    abbr kku "sudo dnf upgrade"
    abbr kks "dnf search"
    # Eza
    set -l eza "eza --icons auto"
    abbr ls "$eza"
    abbr lsa "$eza -a"
    abbr ll "$eza -l"
    abbr lla "$eza -la"
    abbr lt "$eza --tree"
    abbr lta "$eza -a --tree"
    abbr l1 "$eza -1"
    abbr l1a "$eza -1 -a"
    abbr lsi "eza"
    abbr lsai "eza -a"
    abbr lli "eza -l"
    abbr llai "eza -la"
    abbr lti "eza --tree"
    abbr ltai "eza -a --tree"
    abbr l1i "eza -1"
    abbr l1ai "eza -1 -a"
end
