load_common prompt

export ANALYZE_DU_INPUT_FN="$HOME"/du.txt

an()
{
    analyze-du "$@"
}

regen()
{
    (
        cd "$HOME"
        \du . > du-new.txt
    )
}

cd "$HOME"

prompt()
{
    __prompt_cmd \
        "~=$HOME"
}

proj_name='cleanup'

