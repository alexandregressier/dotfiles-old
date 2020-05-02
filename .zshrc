# ~/.zshrc

# Enable Powerlevel10k instant prompt
local p10k_instant_script="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[ -f "$p10k_instant_script" ] && source "$p10k_instant_script"

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

# History
HISTSIZE=
SAVEHIST=

setopt BANG_HIST                 # Treat the '!' character specially during expansion
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry
setopt HIST_VERIFY               # Don't execute immediately upon history expansion
setopt HIST_BEEP                 # Beep when accessing nonexistent history


# Antigen
# Source Antigen
source "$HOME/bin/antigen/antigen.zsh"

# Use the oh-my-zsh provided by Antigen
antigen use oh-my-zsh

# Powerlevel10k themes
antigen theme romkatv/powerlevel10k

# Plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle command-not-found # Asks if you want to install the missing command

antigen bundle git 
antigen bundle debian 

antigen bundle chisui/zsh-nix-shell
antigen bundle spwhitt/nix-zsh-completions

antigen bundle zsh-users/zsh-docker
antigen bundle docker-compose

antigen bundle kubectl
antigen bundle minikube
antigen bundle chmouel/oh-my-zsh-openshift

antigen bundle jackwish/bazel
antigen bundle gradle
antigen bundle mvn
antigen bundle sbt

antigen bundle matthieusb/zsh-sdkman

# Apply the Antigen configuration
antigen apply


# Aliases
# Aliases are meant to substitute something that already exists, in other cases define a function
alias zshconfig='mate ~/.zshrc'
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias diff='diff --color'
alias code='code-insiders'

# GPG agent
export GPG_TTY="$(tty)"

# SSH agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# SDKMAN!
local sdkman_script="$SDKMAN_DIR/bin/sdkman-init.sh"
[ -f "$sdkman_script" ] && source "$sdkman_script"

# Nix
local nix_script="$USER/.nix-profile/etc/profile.d/nix.sh"
[ -f "$nix_script" ] && source "$nix_script"

# Anaconda
__conda_setup="$("$CONDA_PREFIX/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    local conda_script="$CONDA_PREFIX/etc/profile.d/conda.sh"
    [ -f "$conda_script" ] && source "$conda_script" || prepend_path "$CONDA_PREFIX/bin"
fi
unset __conda_setup

# Powerlevel10k prompt
local p10k_prompt_script="$HOME/.p10k.zsh"
[ -f "$p10k_prompt_script" ] && source "$p10k_prompt_script"
