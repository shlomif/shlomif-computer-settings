load_common du

export ANALYZE_DU_INPUT_FN="$HOME"/du.txt

regen()
{
    (
        cd "$HOME"
        \du . > du-new.txt
    )
}
