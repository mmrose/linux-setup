#! zsh

# basics
export EDITOR='vim'
# fixing zsh issues in tmux
bindkey -e
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export PATH="$HOME/.local/bin:$HOME/.npm-packages/bin:$PATH"
export LS_COLORS=$LS_COLORS:'di=0;36:'
# see here: https://gist.github.com/zanshin/4848f55ef103ac039531
export LSCOLORS=gxfxcxdxbxegedabagacad

export PURE_CMD_MAX_EXEC_TIME=1

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt HIST_VERIFY
setopt EXTENDED_HISTORY      # save each command's beginning timestamp and the duration to the history file
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY    # this is default, but set for share_history
setopt SHARE_HISTORY         # Share history file amongst all Zsh sessions

# tools
alias tm='tmux -2 attach || tmux -2 new'
alias ls='ls -lah --color'

# network and processes
alias psg='ps aux | grep -v grep | grep -i'
alias nsl='netstat -taupn | grep LISTEN'
alias nsg='netstat -taupn | grep -i'

# update shell
alias update-dotfiles="curl -sL https://raw.githubusercontent.com/mmrose/dotfiles/master/install.sh | sh"

# plugin stuff
export XDG_CACHE_HOME=${XDG_CACHE_HOME:=~/.cache}

typeset -A ZPLGM
ZPLG_HOME=$XDG_CACHE_HOME/zsh/zinit
ZPLGM[HOME_DIR]=$ZPLG_HOME
ZPLGM[ZCOMPDUMP_PATH]=$XDG_CACHE_HOME/zsh/zcompdump

if [[ ! -f $ZPLG_HOME/bin/zinit.zsh ]]; then
  git clone https://github.com/zdharma-continuum/zinit.git $ZPLG_HOME/bin
  zcompile $ZPLG_HOME/bin/zinit.zsh
fi
source $ZPLG_HOME/bin/zinit.zsh
load=light

# dependency: async jobs
zinit $load mafredri/zsh-async
# sane base options
zinit $load willghatch/zsh-saneopt
# jump around in popular directories
zinit $load rupa/z

# prompt
zinit $load sindresorhus/pure

# colors for ls
zinit ice nocompile:! pick:c.zsh atpull:%atclone atclone:'dircolors -b LS_COLORS > c.zsh'
zinit $load trapd00r/LS_COLORS

# autocomplete based on history
zinit ice silent wait:1 atload:_zsh_autosuggest_start
zinit $load zsh-users/zsh-autosuggestions
zinit ice blockf; zinit $load zsh-users/zsh-completions

# syntax highlighting
zinit ice silent wait!1 atload"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit"
zinit $load zdharma-continuum/fast-syntax-highlighting

# Print command exit code as a human-readable string
zinit $load bric3/nice-exit-code
export RPS1='%B%F{red}$(nice_exit_code)%f%b'

zinit snippet OMZ::lib/completion.zsh

zstyle :prompt:pure:path   color        cyan
zstyle ':completion:*'     special-dirs true

# add kubectl completions
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# npm
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

if [ -f ~/.zsh_alias_local ]; then
    source ~/.zsh_alias_local
fi