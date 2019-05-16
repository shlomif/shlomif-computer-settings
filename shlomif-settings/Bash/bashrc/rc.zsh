# See https://stackoverflow.com/questions/6715388
setopt SH_WORD_SPLIT
if alias which > /dev/null
then
    unalias which
fi
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
zstyle :compinstall filename '/home/shlomif/.zshrc'

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit

for f in ~/conf/trunk/shlomif-settings/Bash/bashrc/zshrc.d/*.zsh
do
    . "$f"
done
# Code for sane binding of keys and handling of terminal modes {{{
# Adapted from Debian's /etc/zshrc
typeset -A key
key=( BackSpace  "${terminfo[kbs]}"
      Home       "${terminfo[khome]}"
      End        "${terminfo[kend]}"
      Insert     "${terminfo[kich1]}"
      Delete     "${terminfo[kdch1]}"
      Up         "${terminfo[kcuu1]}"
      Down       "${terminfo[kcud1]}"
      Left       "${terminfo[kcub1]}"
      Right      "${terminfo[kcuf1]}"
      PageUp     "${terminfo[kpp]}"
      PageDown   "${terminfo[knp]}"
)

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
autoload -U edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

bindkey '^x^e' edit-command-line

# [[ -n "$key[PageUp]"   ]] && bindkey -- "$key[PageUp]"   up-line-or-beginning-search
# [[ -n "$key[PageDown]" ]] && bindkey -- "$key[PageDown]" down-line-or-beginning-search
[[ -n "$key[PageUp]"   ]] && bindkey -- "$key[PageUp]"   history-beginning-search-backward
[[ -n "$key[PageDown]" ]] && bindkey -- "$key[PageDown]" history-beginning-search-forward
[[ -n "$key[Home]"   ]] && bindkey -- "$key[Home]"   beginning-of-line
[[ -n "$key[End]"   ]] && bindkey -- "$key[End]"   end-of-line
[[ -n "$key[Delete]"   ]] && bindkey -- "$key[Delete]"   delete-char

# https://stackoverflow.com/questions/11670935/comments-in-command-line-zsh
setopt interactivecomments

. ~/conf/trunk/shlomif-settings/Bash/bashrc/common.bash

compl=~/conf/trunk/shlomif-settings/Bash/zsh-completions
if ! test -e "$compl"
then
    git clone https://github.com/zsh-users/zsh-completions.git "$compl"
fi
# fpath=("$compl/src" $fpath)
prompt redhat
