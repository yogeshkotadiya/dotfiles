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

export EDITOR="nvim"
export GPG_TTY=$(tty)

# To add/remove paths, run `edx paths` or edit ~/.shell/paths.zsh
[[ ! -f ~/.shell/paths.zsh ]] || source ~/.shell/paths.zsh

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

# To add/remove variables, run `edx variables` or edit ~/.shell/variables.zsh
[[ ! -f ~/.shell/variables.zsh ]] || source ~/.shell/variables.zsh

# To add/remove plugins, run `edx plugins` or edit ~/.shell/plugins.zsh
[[ ! -f ~/.shell/plugins.zsh ]] || source ~/.shell/plugins.zsh

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

# To add/remove aliases, run `edx aliases configure` or edit ~/.shell/aliases.zsh
[[ ! -f ~/.shell/aliases.zsh ]] || source ~/.shell/aliases.zsh

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

# Source local zsh customizations.
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Source functions and aliases.
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

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

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(~/.stripe $fpath)

eval "$(zoxide init zsh --cmd cd)"
eval "$(atuin init zsh --disable-up-arrow)"

typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

autoload -Uz compinit && compinit -i

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.shell/p10k.zsh ]] || source ~/.shell/p10k.zsh
