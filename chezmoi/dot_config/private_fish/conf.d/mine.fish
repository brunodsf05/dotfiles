set -g fish_greeting

function ifexists
    type -q $argv[1]; or return 0
    command $argv
end

if status is-interactive
    # --- Integrations --- #
    ifexists starship init fish | source
    ifexists zoxide init fish | source
    ifexists fzf --fish | source
    ifexists mise activate fish | source

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
    abbr gitp "git push"
    abbr gitpo "git push origin"
    abbr gitpom "git push origin main"
    # PackageManagement
    abbr kki "sudo dnf install"
    abbr kkig "sudo dnf group install"
    abbr kkr "sudo dnf remove"
    abbr kks "dnf search"
    abbr kku "sudo dnf upgrade"
    # Eza
    function lsi; command eza --group-directories-first $argv; end
    function ls; lsi --icons=auto $argv; end
    alias lsa "ls -a"
    alias ll "ls -l"
    alias lla "ls -la"
    alias lt "ls --tree"
    alias lta "ls -a --tree"
    alias l1 "ls -1"
    alias l1a "ls -1 -a"
    alias lsai "lsi -a"
    alias lli "lsi -l"
    alias llai "lsi -la"
    alias lti "lsi --tree"
    alias ltai "lsi -a --tree"
    alias l1i "lsi -1"
    alias l1ai "lsi -1 -a"
end
