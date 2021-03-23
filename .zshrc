#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

ZSH_THEME=robbyrussell
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load zgen
source "${HOME}/.zgen/zgen.zsh"
# if the init script doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

	# specify plugins here
    # Turn off zsh prompt for update
    DISABLE_AUTO_UPDATE=true
	zgen oh-my-zsh
	zgen oh-my-zsh plugins/ssh-agent
	zgen oh-my-zsh plugins/systemd
	zgen load zsh-users/zsh-completions src

	zgen load junegunn/fzf shell/completion.zsh
	#zgen load junegunn/fzf shell/key-bindings.zsh

	# generate the init script from plugins above
	zgen save
fi


export PAGER=less
export LESS="-F -R -S -X"

bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char


alias vi="vim -p"
alias vim="vim -p"
alias grep="grep --color=auto -d skip"
alias gdb="gdb --quiet"
alias ls='ls --color=tty -h'
export EDITOR=vim
# depth of the directory history
DIRSTACKSIZE=30
# simply type the directory name; zsh adds the 'cd' command
setopt AUTO_CD
# automatic pushd
setopt AUTO_PUSHD
# exchange meaning of + and -
setopt PUSHD_MINUS
# don't tell me about automatic pushd
setopt PUSHD_SILENT
# use $HOME when no arguments specified
setopt PUSHD_TO_HOME
# ignore duplicates
setopt PUSHD_IGNOREDUPS
# now the important part
alias -- +='pushd +0'
alias -- -='pushd -1'

export DOTNET_CLI_TELEMETRY_OPTOUT=1
unsetopt BEEP


unset HISTFILE
unsetopt share_history
bindkey -v
HISTSIZE=10000
if (( ! EUID )); then
    HISTFILE=~/.zsh_history_root
else
    HISTFILE=~/.zsh_history
fi
SAVEHIST=1000
set inc_append_history
set hist_save_no_dups
set HIST_IGNORE_DUPS

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

export PROMPT="${ret_status}%m:%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}"
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+='${ret_status}%n@%m: %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
export PROMPT

function path_prepend ()
{
    PATH=${PATH//":$1"/} #delete any instances in the middle or at the end
    PATH=${PATH//"$1:"/} #delete any instances at the beginning
    export PATH="$1:$PATH" #prepend to beginning
}


path_prepend "/opt/tanius/bin"
path_prepend "/home/paul/local/bin"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

function dstat
{
    /usr/bin/python3 /usr/bin/dstat
}
