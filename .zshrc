# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# my config
if command -v tmux &> /dev/null; then
  if [ -z "$TMUX" ]; then
    if tmux ls &> /dev/null; then
      exec tmux attach-session -t "$(tmux ls | awk 'NR==1{print $1}' | cut -d: -f1)"
    else
      exec tmux new-session -s main
    fi
  fi
fi

# Set a fancy prompt (with colors)
PROMPT='${debian_chroot:+($debian_chroot)}%F{green}%n@%m%f:%F{blue}%~%f$ '

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
