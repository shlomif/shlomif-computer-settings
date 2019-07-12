history()
{
    if test $# -eq 0
    then
        builtin history 1
    else
        builtin history "$@"
    fi
}
