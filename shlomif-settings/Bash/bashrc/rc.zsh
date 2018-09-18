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
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search
