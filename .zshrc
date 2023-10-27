ZSH_THEME=starquake

ZSH=/usr/share/oh-my-zsh
if [[ ! -d $ZSH ]]; then
  ZSH=$HOME/.oh-my-zsh
fi

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
if [[ ! -d $ZSH_CUSTOM ]]; then
  mkdir -p $ZSH_CUSTOM
fi

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir -p $ZSH_CACHE_DIR
fi

export ZSH_CACHE_DIR
export EDITOR="nano"

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

if [[ -f "/etc/arch-release" ]]; then
  # Updating is done through AUR
  DISABLE_AUTO_UPDATE="true"
fi

HIST_STAMPS="yyyy-mm-dd"

case $HOST in
zoot) plugins=(archlinux copypath copyfile cp systemd) ;;
gonzo) plugins=(archlinux copypath copyfile cp flutter git git-auto-fetch git-flow github gitignore golang npm ripgrep rust systemd) ;;
php-dev.gonzo) plugins=(archlinux copypath copyfile cp flutter git git-auto-fetch git-flow github gitignore golang npm ripgrep rust systemd) ;;
fozzie) plugins=(archlinux copypath copyfile cp flutter git git-auto-fetch git-flow github gitignore golang npm ripgrep rust systemd) ;;
animal) plugins=(archlinux copypath copyfile cp flutter git git-auto-fetch git-flow github gitignore golang npm ripgrep rust systemd) ;;
camilla) plugins=(archlinux copypath copyfile cp git git-auto-fetch git-flow github gitignore golang npm ripgrep rust systemd) ;;
beaker.lan) plugins=(macos copypath copyfile cp flutter git git-auto-fetch git-flow github gitignore golang npm ripgrep rust) ;;
bunsen.lan) plugins=(macos copypath copyfile cp flutter git git-auto-fetch git-flow github gitignore golang npm ripgrep rust) ;;
esac

# Oh my ZSH
if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
  source $ZSH/oh-my-zsh.sh
fi

# Rust configuration
# System-wide installation
if [[ -f "/usr/bin/cargo" ]]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi
# User installation
if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

# Node JS / NPM configuration
if [[ -f "/usr/bin/npm" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
  export npm_config_prefix="$HOME/.local"
fi

# Chrome executable var for Flutter
if [[ -f "/usr/bin/google-chrome-stable" ]]; then
  export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
fi

# Android SDK / Android Studio
if [[ -d "$HOME/Android/Sdk" ]]; then
  export ANDROID_HOME="$HOME/Android/Sdk"
  export PATH="$PATH:$ANDROID_HOME/tools"
  export PATH="$PATH:$ANDROID_HOME/tools/bin"
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
fi

# Flutter SDK
if [[ -d "$HOME/Development/flutter" ]]; then
  export FLUTTER_HOME="$HOME/Development/flutter"
  export PATH="$PATH:$FLUTTER_HOME/bin"
fi

# Ruby using rbenv
if [[ -f "/usr/local/bin/rbenv" ]]; then
  eval "$(rbenv init - zsh)"
fi

# Set up Node Version Manager
if [[ -f "/usr/share/nvm/init-nvm.sh" ]]; then
  source /usr/share/nvm/init-nvm.sh
fi

# pkgfile command not found helper
if [[ -f "/usr/share/doc/pkgfile/command-not-found.zsh" ]]; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
fi
