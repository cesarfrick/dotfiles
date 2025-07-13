# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX=true

LLVM="/usr/local/opt/llvm@14/bin"
PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"

# Path to your oh-my-zsh installation.
export BREW="/usr/local/bin/brew"
export ZSH="$HOME/.oh-my-zsh"
export FLUTTER="$HOME/fvm/default/bin"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"
export XDG_CONFIG_HOME="$HOME/.config/"
export EDITOR=nvim
export GOPATH="$HOME/.local/share/mise/installs/go/latest"
export GOBIN="$GOPATH/bin"
export PUB="$HOME/.pub-cache/bin"
export TMUXIFIER="$HOME/.tmuxifier/bin"
export CARGO="$HOME/.cargo/bin"
export PYENV="/usr/local/bin/pyenv"
export LDFLAGS="-L$($BREW --prefix openssl)/lib -L$($BREW --prefix re2)/lib"
export CPPFLAGS="-I$($BREW --prefix openssl)/include -I$($BREW --prefix re2)/include"
export GRPC_BUILD_WITH_BORING_SSL_ASM=""
export GRPC_PYTHON_BUILD_SYSTEM_RE2=true
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=true
# export CFLAGS="-Wno-incompatible-function-pointer-types"
# export CLOUDSDK_PYTHON=python2
# export PATH="$FLUTTER:$PATH"
# export PATH="$GOPATH/bin:$PATH"
export PATH="$ZSH:$FLUTTER:$PUB:$TMUXIFIER:$GOPATH:$GOBIN:$PATH"
export PATH="$CARGO:$LLVM:$PYENV:$BREW:$PYTHON_BIN_PATH:$PATH"

. "$HOME/.zcompletion"
eval "$($BREW shellenv)"
eval "$(fzf --zsh)"
eval "$(mise activate zsh)"
eval "$(mise completion zsh)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion




#zsh-syntax-highlighting
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="amuse"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  # zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"
# export ARCHFLAGS="-arch arm64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh
#alias code="/usr/local/bin/code-insiders"
if [ -f "$HOME/.zsh_aliases" ]; then . "$HOME/.zsh_aliases"; fi


DEFAULT_USER="cfrick"
#prompt_context(){}
# prompt_context() {
#   # Custom (Random emoji)
#   emojis=("⚡️" "🔥" "💀" "👑" "😎" "🐸" "🐵" "🦄" "🌈" "🍻" "🚀" "💡" "🎉" "🔑" "🇹🇭" "🚦" "🌙")
#   RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
#   prompt_segment black default "${emojis[$RAND_EMOJI_N]} "
# }

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
#
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi


[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

PATH=~/.console-ninja/.bin:$PATH

eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/frickmijares/.local/share/mise/installs/gcloud/latest/path.zsh.inc' ]; then . '/Users/frickmijares/.local/share/mise/installs/gcloud/latest/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/frickmijares/.local/share/mise/installs/gcloud/latest/completion.zsh.inc' ]; then . '/Users/frickmijares/.local/share/mise/installs/gcloud/latest/completion.zsh.inc'; fi

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/frickmijares/.config/.dart-cli-completion/zsh-config.zsh ]] && . /Users/frickmijares/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

