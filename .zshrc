# Paths
export PATH="/snap/bin:$PATH"
export PATH=$(echo "$PATH" | tr ':' '\n' | grep -v '^/mnt/c/' | paste -sd ':' -)

# Aliases
alias bat='batcat'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vconfig='cd ~/.config/nvim/lua/cisco'
alias wlogout="kill $(who -u | awk 'NR==1 {print $6}')"

# Load extra aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# Vim mode in Zsh
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} == '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}
zle -N zle-line-init

echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Enable color support
if command -v dircolors &>/dev/null; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# Node (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Uncomment if you want tmux to auto-start
# if command -v tmux &> /dev/null; then
#   if [ -z "$TMUX" ]; then
#     if tmux ls &> /dev/null; then
#       exec tmux attach-session -t "$(tmux ls | awk 'NR==1{print $1}' | cut -d: -f1)"
#     else
#       exec tmux new-session -s main
#     fi
#   fi
# fi

# Uncomment if you want ibus to autostart
# pgrep -x ibus-daemon > /dev/null || ibus-daemon -drx

# Uncomment if you want zsh syntax highlighting
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

