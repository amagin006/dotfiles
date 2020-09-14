export PATH=$HOME/.nodebrew/current/bin:$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

DEFAULT_USER=$USER

autoload -Uz compinit
compinit

setopt no_beep
bindkey -v

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt share_history

# Two regular plugins loaded without tracking.
zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma/history-search-multi-word

# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# Load OMZ Git library
zinit snippet OMZL::git.zsh

# Load Git plugin from OMZ
zinit snippet OMZP::git
zinit cdclear -q

setopt promptsubst

# Load theme from OMZ
zinit snippet OMZT::gnzh
zinit light powerlevel10k/powerlevel10k
zinit light agnoster/agnoster-zsh-theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

setopt share_history

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias ls="ls -G"
alias la="ls -a"
alias ll="ls -lh"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shotaiwamoto/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shotaiwamoto/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shotaiwamoto/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shotaiwamoto/google-cloud-sdk/completion.zsh.inc'; fi
