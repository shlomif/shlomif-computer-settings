# oh-my-zsh booboo
alias l='ls'
unset LESS
if test "$(hostname)" != "telaviv1.shlomifish.org"
then
    unalias g
    # For https://en.wikipedia.org/wiki/GraphicsMagick
    unalias gm
fi
# set **.c to work as well as **/*.c
setopt GLOB_STAR_SHORT
