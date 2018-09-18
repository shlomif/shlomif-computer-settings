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
for f in ~/conf/trunk/shlomif-settings/Bash/bashrc/bashrc.d/*.bash
do
    . "$f"
done
PATH="$HOME/apps/neovim/bin:$HOME/apps/fop/fop-20140425:$HOME/apps/vim/bin:$PATH"
dedup_pathvar PATH

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

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search
