if status is-interactive
    # eval (zellij setup --generate-auto-start fish | string collect)
    # Commands to run in interactive sessions can go here 1
end

set -g fish_greeting ""

starship init fish | source
zoxide init fish | source
direnv hook fish | source
atuin init fish | source
/Users/huwl/.local/bin/mise activate fish | source

# Added by Windsurf
fish_add_path /Users/huwl/.codeium/windsurf/bin
