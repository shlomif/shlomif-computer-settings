an()
{
    cat ~/du.txt | ~/bin/analyse-du.pl "$@"
}

regen()
{
    cd "$HOME"
    du -s . > du-new.txt 
}

cd "$HOME"

PS1="\\u[cleanup]:\\w\$ "

