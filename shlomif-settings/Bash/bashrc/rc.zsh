# See https://stackoverflow.com/questions/6715388
setopt SH_WORD_SPLIT
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
zstyle :compinstall filename '/home/shlomif/.zshrc'

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit

if test -n "$BASH_VERSION"
then
    PS1="\u@telaviv1:\\w\$ "
fi
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
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[PageUp]"   ]] && bindkey -- "$key[PageUp]"   up-line-or-beginning-search
[[ -n "$key[PageDown]" ]] && bindkey -- "$key[PageDown]" down-line-or-beginning-search
[[ -n "$key[Home]"   ]] && bindkey -- "$key[Home]"   beginning-of-line
[[ -n "$key[End]"   ]] && bindkey -- "$key[End]"   end-of-line
[[ -n "$key[Delete]"   ]] && bindkey -- "$key[Delete]"   delete-char

. ~/conf/trunk/shlomif-settings/Bash/bashrc/common.bash
prompt redhat
