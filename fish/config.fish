set -g fish_greeting

if status is-interactive
    starship init fish | source
end

# List Directory
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias du="dust"
alias df="duf"
alias vim="nvim"

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# pnpm
set -gx PNPM_HOME "/home/xeron/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end


# Created by `pipx` on 2024-08-29 01:02:04
set PATH $PATH /home/xeron/.local/bin

thefuck --alias | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Load direnv for Fish
if type -q direnv
    eval (direnv hook fish)
end

set -U fish_user_paths $fish_user_paths $HOME/go/bin
