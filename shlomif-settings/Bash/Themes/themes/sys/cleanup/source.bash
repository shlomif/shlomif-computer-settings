load_common prompt

an()
{
    cat ~/du.txt | ~/bin/analyse-du.pl "$@"
}

regen()
{
    cd "$HOME"
    \du . > du-new.txt
}

cd "$HOME"

prompt()
{
    __prompt_cmd \
        "~=$HOME"
}

proj_name='cleanup'

