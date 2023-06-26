if status is-interactive
    # eval (zellij setup --generate-auto-start fish | string collect)
    # Commands to run in interactive sessions can go here 1
end

set -g fish_greeting ""

starship init fish | source
zoxide init fish | source
direnv hook fish | source


