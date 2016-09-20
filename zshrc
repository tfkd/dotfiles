# completion
# ----------
autoload -Uz compinit
compinit
setopt nolistbeep
setopt magic_equal_subst
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# prompt
# ------
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "${fg[yellow]}!${reset_color}"
zstyle ':vcs_info:git:*' unstagedstr "${fg[red]}+${reset_color}"
precmd() { vcs_info }
#PROMPT='${vcs_info_msg_0_}%~ %{$fg[blue]%}%%%{${reset_color}%} '
prompt__ok_emoji_=$'\U1f431 '
prompt__ng_emoji_=$'\U1f640 '
PROMPT='${vcs_info_msg_0_}%~ %(?.${prompt__ok_emoji_}.${prompt__ng_emoji_}) '
#RPROMPT=

# history
# -------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt append_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
#setopt hist_ignore_space

# alias
# -----
case "${OSTYPE}" in
darwin*)
	alias ls='ls -GF'
	;;
linux*)
	alias ls='ls -F --color'
	;;
esac

alias ee='emacsclient -nw'

# http://qiita.com/strsk/items/9151cef7e68f0746820d
function peco-src() {
	local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}
zle -N peco-src
bindkey '^_' peco-src

# env
# ---

# plenv
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

# java
export JAVA_HOME=$(/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v '1.8')

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# go
export GOPATH=$HOME/dev
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
