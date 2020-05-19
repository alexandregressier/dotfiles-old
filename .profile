# ~/.profile

# Source .bashrc
[ -n "$BASH" ] && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
[ -n "$ZSH" ] && [ -f "$HOME/.zshrc" ] && source "$HOME/.zshrc"

# Functions
function prepend_path { [ -d "$1" ] && PATH="$1:$PATH"; }
function append_path { [ -d "$1" ] && PATH="$PATH:$1"; }


# Homes
export CHROME_BIN="$(which chromium)"

export SDKMAN_DIR="$HOME/.sdkman"
export GRAALVM_HOME="$SDKMAN_DIR/candidates/java/current"
export JAVA_HOME="$GRAALVM_HOME"
export DOTTY_HOME="$HOME/.local/bin/dotty"

export M2_HOME="$SDKMAN_DIR/candidates/maven/current"

export CARGO_HOME="$HOME/.cargo"

export DENO_INSTALL="$HOME/.deno"

export CONDA_PREFIX="$HOME/bin/anaconda3"


# Path
prepend_path "$HOME/.local/bin"
prepend_path "$HOME/bin"

append_path "$GRAALVM_HOME/bin"
append_path "$DOTTY_HOME/bin"

prepend_path "$HOME/.cabal/bin"

prepend_path "$CARGO_HOME/bin"

prepend_path "$DENO_INSTALL/bin"

append_path '/usr/lib/dart/bin'

append_path "$HOME/.crc/bin"


# Flags
export ARCHFLAGS='-arch x86_64'
export MAKEFLAGS="-j$(nproc)"

# Editor
export EDITOR="$(which vim)"
export VISUAL="$(which vim)"

# Man
MANPATH="/usr/local/man:$MANPATH"
