# ~/.profile

# Source .bashrc
[ -n "$BASH" ] && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
[ -n "$ZSH" ] && [ -f "$HOME/.zshrc" ] && source "$HOME/.zshrc"

# Functions
function prepend_path { [ -d "$1" ] && PATH="$1:$PATH"; }
function append_path { [ -d "$1" ] && PATH="$PATH:$1"; }

# Homes
export SDKMAN_DIR="$HOME/.sdkman"
export GRAALVM_HOME="$SDKMAN_DIR/candidates/java/current"
export JAVA_HOME="$GRAALVM_HOME"

# Path
prepend_path "$HOME/.local/bin"
prepend_path "$HOME/bin"

append_path "$GRAALVM_HOME/bin"

# Flags
export ARCHFLAGS='-arch x86_64'
export MAKEFLAGS="-j$(nproc)"

# Editor
export EDITOR="$(which vim)"
export VISUAL="$(which vim)"

# Man
MANPATH="/usr/local/man:$MANPATH"
