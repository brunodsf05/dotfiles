set -g fish_greeting

function abbr2
    abbr $argv[1] "$argv[2] #$argv[1]"
end

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
    abbr kkr "sudo dnf remove"
    abbr kks "dnf search"
    abbr kku "sudo dnf upgrade"
    # Eza
    function lsi; command eza --group-directories-first $argv; end
    function ls; lsi --icons=auto $argv; end
    abbr2 lsa "ls -a"
    abbr2 ll "ls -l"
    abbr2 lla "ls -la"
    abbr2 lt "ls --tree"
    abbr2 lta "ls -a --tree"
    abbr2 l1 "ls -1"
    abbr2 l1a "ls -1 -a"
    abbr2 lsai "lsi -a"
    abbr2 lli "lsi -l"
    abbr2 llai "lsi -la"
    abbr2 lti "lsi --tree"
    abbr2 ltai "lsi -a --tree"
    abbr2 l1i "lsi -1"
    abbr2 l1ai "lsi -1 -a"
end
