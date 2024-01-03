# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH=~/.npm-global/bin:$PATH

export EDITOR="nvim"
export GPG_TTY=$(tty)

# User or Hostname Name
HOSTNAME="yogesh"
USERHOME=/Users/yogesh

# Linux Brew PATH
export PATH=/Users/yogesh/.linuxbrew/bin:$PATH
export PATH=$PATH:/usr/local/mysql/bin/
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#export TERM="xterm-256color"
export VISUAL="vim"
# Path to your oh-my-zsh installation.
export ZSH=/Users/$HOSTNAME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git zsh-autosuggestions ssh-agent elixir
)

source $ZSH/oh-my-zsh.sh

# Powerline
if [[ -r /usr/share/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/share/powerline/bindings/zsh/powerline.zsh
fi

# =============================================================================
#                                   Variables
# =============================================================================
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=("rm -rf *" "fg=white,bold,bg=red")
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]="fg=white"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]="fg=grey"
ZSH_HIGHLIGHT_STYLES[alias]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[function]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[command]="fg=green"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=green"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=green"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[bracket-level-1]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-2]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-3]="fg=magenta,bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-4]="fg=yellow,bold"

# =============================================================================
#                                   Plugins
# =============================================================================
# Check if zplug is installed
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
#source ~/.zplug/init.zsh && zplug update
source ~/.zplug/init.zsh

#zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/enhancd", use:enhancd.sh
#zplug "b4b4r07/zsh-vimode-visual", defer:3
#zplug "bhilburn/powerlevel9k", use:powerlevel9k.theme
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme
#zplug "knu/zsh-manydots-magic", use:manydots-magic, defer:2
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

#zplug "plugins/bundler", from:oh-my-zsh, if:"which bundle"
#zplug "plugins/colored-man-pages", from:oh-my-zsh
#zplug "plugins/extract", from:oh-my-zsh
#zplug "plugins/fancy-ctrl-z", from:oh-my-zsh
#zplug "plugins/git", from:oh-my-zsh, if:"which git"
#zplug "plugins/globalias", from:oh-my-zsh
#zplug "plugins/gpg-agent", from:oh-my-zsh, if:"which gpg-agent"
zplug "plugins/httpie", from:oh-my-zsh, if:"which httpie"
#zplug "plugins/nanoc", from:oh-my-zsh, if:"which nanoc"
#zplug "plugins/vi-mode", from:oh-my-zsh

zplug "plugins/git",    from:oh-my-zsh, if:"which git"
zplug "plugins/golang", from:oh-my-zsh, if:"which go"
zplug "plugins/nmap",   from:oh-my-zsh, if:"which nmap"
zplug "plugins/sudo",   from:oh-my-zsh, if:"which sudo"
zplug "plugins/tmux",   from:oh-my-zsh, if:"which tmux"

# Supports oh-my-zsh plugins and the like
if [[ $OSTYPE = (linux)* ]]; then
	zplug "plugins/archlinux", from:oh-my-zsh, if:"which pacman"
	zplug "plugins/dnf",       from:oh-my-zsh, if:"which dnf"
	zplug "plugins/ubuntu",    from:oh-my-zsh, if:"which apt"
fi

if [[ $OSTYPE = (darwin)* ]]; then
	zplug "plugins/osx",      from:oh-my-zsh
	zplug "plugins/brew",     from:oh-my-zsh, if:"which brew"
	zplug "plugins/macports", from:oh-my-zsh, if:"which port"
fi

zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# =============================================================================
#                                   Options
# =============================================================================

# improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"

# Watching other users
#WATCHFMT="%n %a %l from %m at %t."
watch=(notme)         # Report login/logout events for everybody except ourself.
#watch=(all)         # Report login/logout events for everybody except ourself.
LOGCHECK=60           # Time (seconds) between checks for login/logout activity.
REPORTTIME=5          # Display usage statistics for commands running > 5 sec.
#WORDCHARS="\"*?_-.[]~=/&;!#$%^(){}<>\""
WORDCHARS="\"*?_-[]~&;!#$%^(){}<>\""

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.

# Changing directories
#setopt auto_pushd
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt pushd_minus              # Reference stack entries with "-".

setopt extended_glob

# =============================================================================
#                                   Aliases
# =============================================================================

# In the definitions below, you will see use of function definitions instead of
# aliases for some cases. We use this method to avoid expansion of the alias in
# combination with the globalias plugin.

# Directory coloring
if [[ $OSTYPE = (darwin|freebsd)* ]]; then
	export CLICOLOR="YES" # Equivalent to passing -G to ls.
	export LSCOLORS="exgxdHdHcxaHaHhBhDeaec"

	[ -d "/opt/local/bin" ] && export PATH="/opt/local/bin:$PATH"

	# Prefer GNU version, since it respects dircolors.
	if which gls &>/dev/null; then
		alias ls='() { $(whence -p gls) -Ctr --file-type --color=auto $@ }'
	else
		alias ls='() { $(whence -p ls) -CFtr $@ }'
	fi
else
	alias ls='() { $(whence -p ls) -Ctr --file-type --color=auto $@ }'
fi

# Set editor preference to nvim if available.
if which nvim &>/dev/null; then
	alias vim='() { $(whence -p nvim) $@ }'
else
	alias vim='() { $(whence -p vim) $@ }'
fi

# Generic command adaptations.
alias grep='() { $(whence -p grep) --color=auto $@ }'
alias egrep='() { $(whence -p egrep) --color=auto $@ }'

# Directory management
alias ls='exa'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
alias d='dirs -v'
alias 1='pu'
alias 2='pu -2'
alias 3='pu -3'
alias 4='pu -4'
alias 5='pu -5'
alias 6='pu -6'
alias 7='pu -7'
alias 8='pu -8'
alias 9='pu -9'
alias pu='() { pushd $1 &> /dev/null; dirs -v; }'
alias po='() { popd &> /dev/null; dirs -v; }'

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# Ubuntu aliases
alias apd="sudo apt update"
alias apg="sudo apt upgrade"
alias apdg="sudo apt update && sudo apt upgrade"

# Git aliases
alias gitcm="git add . && git commit -m"
alias git="hub"
alias gco="git checkout"
alias gpo="git pull origin"
alias gpush="git push origin"
alias lgt="lazygit"


#kubectl

alias kubectx="kubectl ctx"
alias kubens="kubectl ns"
# Misc aliases

alias cat="bat"
# =============================================================================
#                                Key Bindings
# =============================================================================

# Common CTRL bindings.
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward

# Do not require a space when attempting to tab-complete.
bindkey "^i" expand-or-complete-prefix

# Fixes for alt-backspace and arrows keys
bindkey '^[^?' backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# =============================================================================
#                                 Completions
# =============================================================================

zstyle ':completion:*' rehash true
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''

# case-insensitive (all), partial-word and then substring completion
zstyle ":completion:*" matcher-list \
  "m:{a-zA-Z}={A-Za-z}" \
  "r:|[._-]=* r:|=*" \
  "l:|=* r:|=*"

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

# =============================================================================
#                                   Startup
# =============================================================================

# Load SSH and GPG agents via keychain.
setup_agents() {
  [[ $UID -eq 0 ]] && return

  if which keychain &> /dev/null; then
	local -a ssh_keys gpg_keys
	for i in ~/.ssh/**/*pub; do test -f "$i(.N:r)" && ssh_keys+=("$i(.N:r)"); done
	gpg_keys=$(gpg -K --with-colons 2>/dev/null | awk -F : '$1 == "sec" { print $5 }')
    if (( $#ssh_keys > 0 )) || (( $#gpg_keys > 0 )); then
	  alias run_agents='() { $(whence -p keychain) --quiet --eval --inherit any-once --agents ssh,gpg $ssh_keys ${(f)gpg_keys} }'
	  [[ -t ${fd:-0} || -p /dev/stdin ]] && eval `run_agents`
	  unalias run_agents
    fi
  fi
}
setup_agents
unfunction setup_agents

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

if zplug check "seebi/dircolors-solarized"; then
  if which gdircolors &> /dev/null; then
	alias dircolors='() { $(whence -p gdircolors) }'
  fi
  if which dircolors &> /dev/null; then
    scheme="dircolors.256dark"
    eval $(dircolors ~/.zplug/repos/seebi/dircolors-solarized/$scheme)
  fi
fi

# History
if zplug check "zsh-users/zsh-history-substring-search"; then
	zmodload zsh/terminfo
	bindkey "$terminfo[kcuu1]" history-substring-search-up
	bindkey "$terminfo[kcud1]" history-substring-search-down
	bindkey "^[[1;5A" history-substring-search-up
	bindkey "^[[1;5B" history-substring-search-down
fi

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

# Source local zsh customizations.
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Source functions and aliases.
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

#autoload -Uz compinit
#compinit

#ZLE_RPROMPT_INDENT=0

# vim: ft=zsh
############################################
#	NVM
############################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault

eval $(thefuck --alias)

export PATH="$HOME/.poetry/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(direnv hook zsh)"

export PATH=~/.bin:$PATH 
export PATH=~/.yarn/bin:$PATH
export PATH="$PATH:$(yarn global bin)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(~/.stripe $fpath)

eval "$(zoxide init zsh --cmd cd)"

typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

autoload -Uz compinit && compinit -i

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=/opt/homebrew/bin:/nix/store/xrvfccx93yf7dca8gfk7drqg43i8ga3q-hugo-0.121.1/bin:/nix/store/vwh2qqal1q101wv4jy40giavp73q0msd-clang-wrapper-16.0.6/bin:/nix/store/3vzbr8yb4c233lhi1qz78b8kaaxrjqcj-clang-16.0.6/bin:/nix/store/pzajj7gw0nazs3vzp6jld53q8ird5izr-coreutils-9.4/bin:/nix/store/0i7w6qsij8akg6h39qn67w9ig5hirv1a-cctools-binutils-darwin-wrapper-16.0.6-973.0.1/bin:/nix/store/i4sfjfz08vmnrj84asl2j5imakga12za-cctools-binutils-darwin-16.0.6-973.0.1/bin:/nix/store/pzajj7gw0nazs3vzp6jld53q8ird5izr-coreutils-9.4/bin:/nix/store/6x5inimwy8rlvf678yy080zccbw71alb-findutils-4.9.0/bin:/nix/store/01bzxsyn8dqz9fsdhp9r6ya796g5ydmf-diffutils-3.10/bin:/nix/store/9z9k8dwhhiryr7z2pz70zca0vwa15yqc-gnused-4.9/bin:/nix/store/zsm4xd527427rnjfnvfhvsld2n57b822-gnugrep-3.11/bin:/nix/store/hhc2x65zvp89lh15grqk21r6dcvifggy-gawk-5.2.2/bin:/nix/store/gclclfhq9blxp32lv8kxm9iv5060rx5f-gnutar-1.35/bin:/nix/store/crpi4clk07gy760ydbb710f74dy8q6c9-gzip-1.13/bin:/nix/store/qay0pa86lb712162d6m5lyw62iczb71d-bzip2-1.0.8-bin/bin:/nix/store/zc9qsb0rzlw0ckhy7097frcwb4pkfx3d-gnumake-4.4.1/bin:/nix/store/6nxav88iiz0g8m598xy643f8hhdz5kkx-bash-5.2-p21/bin:/nix/store/kizmwlnj40d11ixbap74c0syaqxn05wc-patch-2.7.6/bin:/nix/store/xcy0fr1dangwh9r9isay6fqbg91g5b3h-xz-5.4.5-bin/bin:/nix/store/x1bzwj6pz7f3ajg5y36x07b1328jzx7r-file-5.45/bin:/Users/yogesh/lab/personal/yogeshkotadiya.com/.direnv/bin:/Users/yogesh/.yarn/bin:/Users/yogesh/.bin:/Users/yogesh/.poetry/bin:/Users/yogesh/.zplug/bin:/Users/yogesh/.pyenv/bin:/usr/local/opt/mysql-client@5.7/bin:/Users/yogesh/flutter/bin:/usr/lib/jvm/java-8-openjdk/bin:/Users/yogesh/.krew/bin:/Users/yogesh/.linuxbrew/bin:/Users/yogesh/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/mysql/bin/:/Users/yogesh/Android/Sdk/emulator:/Users/yogesh/Android/Sdk/tools:/Users/yogesh/Android/Sdk/tools/bin:/Users/yogesh/Android/Sdk/platform-tools
