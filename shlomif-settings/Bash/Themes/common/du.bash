export ANALYZE_DU_INPUT_FN="$HOME"/du.txt

an()
{
    analyze-du "$@"
}

ah()
{
    du -ah . | sort -h
}

-s()
{
    du -sh *
}

shs()
{
    du -sh * | sort -h
}

regen()
{
    (
        cd "$HOME"
        \du . > du-new.txt
    )
}
