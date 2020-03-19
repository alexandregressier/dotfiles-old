# ~/.zshrc

# Settings

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE='true'

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE='true'

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE='true'

# Uncomment the following line to automatically update without prompting.
#DISABLE_UPDATE_PROMPT='true'

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
#DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS='true'

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE='true'

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION='true'

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS='true'

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY='true'

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
#HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=/path/to/new-custom-folder


# Antigen
# Source Antigen
source "$HOME/bin/antigen/antigen.zsh"

# Use the oh-my-zsh provided by Antigen
antigen use oh-my-zsh

# Themes
antigen theme bhilburn/powerlevel9k powerlevel9k

# Plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle command-not-found # Asks if you want to install the missing command

antigen bundle git 
antigen bundle debian 

antigen bundle zsh-users/zsh-docker
antigen bundle docker-compose

antigen bundle kubectl
antigen bundle minikube

antigen bundle matthieusb/zsh-sdkman

# Apply the Antigen configuration
antigen apply


# Aliases
# Aliases are meant to substitute something that already exists, in other cases define a function
alias zshconfig="mate ~/.zshrc"
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# GPG agent
export GPG_TTY="$(tty)"

# SSH agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# SDKMAN!
[ -f "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
