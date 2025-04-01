# oh my zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# vim
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


#my config
if command -v tmux &> /dev/null; then
   if [ -z "$TMUX" ]; then
     if tmux ls &> /dev/null; then
       exec tmux attach-session -t "$(tmux ls | awk 'NR==1{print $1}' | cut -d: -f1)"
     else
       exec tmux new-session -s main
     fi
   fi
 fi

# Enable color support for ls and grep
if command -v dircolors &>/dev/null; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Some useful ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vconfig='cd ~/.config/nvim/lua/cisco'

# Alias for logout
alias wlogout="kill $(who -u | awk 'NR==1 {print $6}')"

# Load additional aliases from ~/.zsh_aliases if available
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# Rust Cargo environment (if installed)
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Start ibus if not running
pgrep -x ibus-daemon > /dev/null || ibus-daemon -drx

#zsh syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
