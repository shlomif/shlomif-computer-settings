make()
{
    local target
    target="$1"
    shift
    if [ "$target" == "all" ] ; then
        target=build
    fi
    ./Build "$target"
}
