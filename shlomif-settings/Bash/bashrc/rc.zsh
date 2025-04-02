logg()
{
    return 0
    local str="$1"
    shift
    local param="$1"
    shift
    printf "time = %s ; < %s > param=%s\\n" "$(date +"%s.%N")" "$str" "$param" >> /tmp/zsh-shlomify-logg-0.1.txt
}

# See https://stackoverflow.com/questions/6715388
logg "start" "s"
setopt SH_WORD_SPLIT
if alias which > /dev/null
then
    unalias which
fi
HISTFILE=~/.histfile
HISTSIZE=200000
SAVEHIST=200000
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
if test -f /etc/debian_version
then
    export SHLOMIF_FORTUNE_DIR=~/apps/to-del-fortune--debian
else
    export SHLOMIF_FORTUNE_DIR=~/apps/to-del-fortune--redhat
fi
PATH="$SHLOMIF_FORTUNE_DIR/games:$SHLOMIF_FORTUNE_DIR/bin:$PATH"

logg "befloop" "s"
for f in ~/conf/trunk/shlomif-settings/Bash/bashrc/zshrc.d/*.zsh
do
    logg "in-loop" "$f"
    . "$f"
done
logg "aft-loop" "s"
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

logg "bef-common" "s"
. ~/conf/trunk/shlomif-settings/Bash/bashrc/common.bash
logg "aft-common" "s"

compl=~/conf/trunk/shlomif-settings/Bash/zsh-completions
if ! test -e "$compl"
then
    git clone https://github.com/zsh-users/zsh-completions.git "$compl"
fi
logg "aft-git" "s"
# fpath=("$compl/src" $fpath)
prompt redhat
logg "aft-prompt" "s"
if false
then
    # kwin / kde / plasma5 xkb map experiments:
    # failed so far
    export KWIN_XKB_DEFAULT_KEYMAP="us-acentos"
    export KWIN_XKB_DEFAULT_KEYMAP="il"
    unset KWIN_XKB_DEFAULT_KEYMAP
fi


# bun completions
[ -s "/home/shlomif/.bun/_bun" ] && source "/home/shlomif/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
