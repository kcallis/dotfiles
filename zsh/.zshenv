# For .dotfiles
#

path=('~/.local/bin' '~/.local/sbin' $path)
export PATH

# Add +in task on prompt
export PS1='$(task +in +PENDING count) '$PS1

export XDG_CONFIG_HOME="$HOME/.config"
# For user specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
# For user cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export XDG_RUNTIME_DIR="/run/user/$USER"

export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000

export DOTFILES="$HOME/.dotfiles"

# fzf and ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Access Field Nation Worklogs
export FN_WORKLOGS="$HOME/Documents/Markdown/Worklogs/Field_Nation/"

export TODAY=$(date +"%Y/%b/%d")

export TASKRC=~/.config/taskwarrior/taskrc
#export TASKDATA=~/.config/task
export TASKDATA="/home/kcc/.local/share/task"

# LESS
export LESSHISTFILE="$XDG_CONFIG_HOME/less/lesshst"
export LESSKEY="$XDG_CONFIG_HOME/less/keys"

# WGET
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# nodejs
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc


