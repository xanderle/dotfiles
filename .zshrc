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
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

#####################
# Theme             #
#####################
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

#####################
# PLUGINS           #
#####################
# SSH-AGENT
zinit light bobsoppe/zsh-ssh-agent
# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
# ENHANCD
zinit ice wait"0b" lucid
zinit light b4b4r07/enhancd
export ENHANCD_FILTER=fzf:fzy:peco
# HISTORY SUBSTRING SEARCHING
zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# TAB COMPLETIONS
zinit ice wait"0b" lucid blockf
zinit light zsh-users/zsh-completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'
# FZF
zinit ice lucid wait'0b' from"gh-r" as"program"
zinit light junegunn/fzf
# FZF BYNARY AND TMUX HELPER SCRIPT
zinit ice lucid wait'0c' as"command" pick"bin/fzf-tmux"
zinit light junegunn/fzf
# BIND MULTIPLE WIDGETS USING FZF
zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zinit light junegunn/fzf
# FZF-TAB
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab
# SYNTAX HIGHLIGHTING
zinit ice wait"0c" lucid atinit"zpcompinit;zpcdreplay"
zinit light zdharma/fast-syntax-highlighting
# EXA
zinit ice wait"0" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit light ogham/exa
zinit ice wait blockf atpull'zinit creinstall -q .'
# DELTA
zinit ice lucid wait"0" as"program" from"gh-r" pick"delta*/delta"
zinit light 'dandavison/delta'
# BAT
zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias cat=bat"
zinit light sharkdp/bat
# BAT-EXTRAS
zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
zinit light eth-p/bat-extras
alias rg=batgrep.sh
alias bd=batdiff.sh
alias man=batman.sh
# RIPGREP
zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep
# FORGIT
zinit ice wait lucid
zinit load 'wfxr/forgit'
# LAZYGIT
zinit ice lucid wait"0" as"program" from"gh-r" mv"lazygit* -> lazygit" atload"alias lg='lazygit'"
zinit light 'jesseduffield/lazygit'
# LAZYDOCKER
zinit ice lucid wait"0" as"program" from"gh-r" mv"lazydocker* -> lazydocker" atload"alias lg='lazydocker'"
zinit light 'jesseduffield/lazydocker'
# RANGER
zinit ice depth'1' as"program" pick"ranger.py"
zinit light ranger/ranger
# FD
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd
# GH-CLI
zinit ice lucid wait"0" as"program" from"gh-r" mv"gh* -> gh" pick"gh/bin/gh"
zinit light "cli/cli"
# TMUXINATOR
#zinit ice as"completion"; zinit snippet ~/.nubem_dot_files/extras/tmuxinator/tmuxinator.zsh
# BIT
zinit ice lucid wait"1" as"program" from"gh-r" pick"bit"
zinit light "chriswalz/bit"
# ZSH MANYDOTS MAGIC
zinit autoload'#manydots-magic' for knu/zsh-manydots-magic
# ZSH DIFF SO FANCY
# zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
# zinit light zdharma/zsh-diff-so-fancy
# GIT-FLOW
# zinit light petervanderdoes/git-flow-completion
# RCLONE
# zinit ice lucid wait"0" as"program" from"gh-r" bpick='*-linux-amd64.deb' pick"usr/bin/rclone"
# zinit light 'rclone/rclone'

#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

#####################
# SETOPT            #
#####################
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
# setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
setopt vi

chpwd() exa --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale --icons
#####################
# ENV VARIABLE      #
#####################
export EDITOR='nvim'
export VISUAL=$EDITOR
export PAGER='less'
export SHELL='/bin/zsh'
export LANG='en_GB.UTF-8'
export LC_ALL='en_GB.UTF-8'
export BAT_THEME="gruvbox"

#####################
# COLORING          #
#####################
autoload colors && colors

#####################
# ALIASES           #
#####################
source $HOME/.zsh_aliases

#####################
# FANCY-CTRL-Z      #
#####################
function fg-fzf() {
	job="$(jobs | fzf -0 -1 | sed -E 's/\[(.+)\].*/\1/')" && echo '' && fg %$job
}
function fancy-ctrl-z () {
	if [[ $#BUFFER -eq 0 ]]; then
		BUFFER=" fg-fzf"
		zle accept-line -w
	else
		zle push-input -w
		zle clear-screen -w
	fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#####################
# FZF SETTINGS      #
#####################
export FZF_DEFAULT_OPTS="
--ansi
--layout=default
--info=inline
--height=50%
--multi
--preview-window=right:50%
--preview-window=sharp
--preview-window=cycle
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='λ -> '
--pointer='|>'
--marker='✓'
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {+})'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
####################
# Exports          #
####################
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.config/scripts"

##################
# Virtualenv wrp #
##################
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh
