set -g fish_greeting

if status is-interactive
    # --- Integrations --- #
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source
    mise activate fish | source

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
    abbr kkr "sudo dnf remove"
    abbr kks "dnf search"
    abbr kku "sudo dnf upgrade"
    # Eza
    function lsi; command eza --group-directories-first $argv; end
    function ls; lsi --icons=auto $argv; end
    abbr lsa "ls -a"
    abbr ll "ls -l"
    abbr lla "ls -la"
    abbr lt "ls --tree"
    abbr lta "ls -a --tree"
    abbr l1 "ls -1"
    abbr l1a "ls -1 -a"
    abbr lsai "lsi -a"
    abbr lli "lsi -l"
    abbr llai "lsi -la"
    abbr lti "lsi --tree"
    abbr ltai "lsi -a --tree"
    abbr l1i "lsi -1"
    abbr l1ai "lsi -1 -a"
end
