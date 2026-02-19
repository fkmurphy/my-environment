# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install

export SCRIPT_DIRECTORY="$HOME/scripts"
export EMOJI_CLI_KEYBIND=^e

export PATH="$PATH:$HOME/.foundry/bin"
export LARA_HOME=~/dev/lara
export PATH=$PATH:$LARA_HOME/docker
[[ -d "$HOME/.cargo" ]] && . $HOME/.cargo/env

# ------------------
# Secrets (not tracked in git, see .zshenv.local)
# ------------------

[[ -f "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
