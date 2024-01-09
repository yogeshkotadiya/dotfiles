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