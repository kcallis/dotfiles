fpath=($ZDOTDIR/external $fpath)

source "$XDG_CONFIG_HOME/zsh/aliases"

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files
source ~/.dotfiles/zsh/external/completion.zsh

autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using
setopt PUSHD_SILENT

bindkey -v
export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source ~/.dotfiles/zsh/external/bd.zsh

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# add Taskwarrior
# TASK WARRIOR INTO MY PROMPT
# this part is just fun-with-utf8
# https://twitter.com/pjf/status/852466839145795584
URGENT="2757"
DUETOMORROW="2690"
DUETODAY="2691"
OVERDUE="2639"
OK="2714"

# shows if any TaskWarrior tasks are in need of attention
function task_indicator {
    if [ `task +READY +OVERDUE count` -gt "0" ]  ; then
        printf "%b" "\u$OVERDUE"
    elif [ `task +READY +DUETODAY count` -gt "0" ]  ; then
        printf "%b" "\u$DUETODAY"
    elif [ `task +READY +DUETomorrow count` -gt "0" ]  ; then
        printf "%b" "\u$DUETOMORROW"
    elif [ `task +READY urgency \> 10 count` -gt "0" ]  ; then
        printf "%b" "\u$URGENT"
    else
        printf "%b" "\u$OK"
    fi
}
task="\$(task_indicator)"
addprompt=$task
PROMPT="$addprompt $PROMPT"

source $DOTFILES/zsh/scripts.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $DOTFILES/zsh/.zshenv

