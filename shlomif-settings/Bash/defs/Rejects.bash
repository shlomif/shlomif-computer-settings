mikmod()
{
    (
        LD_LIBRARY_PATH="$HOME/apps/multimedia/libmikmod/lib" \
            $HOME/apps/multimedia/mikmod/bin/mikmod -d 1 "$@"
    )
}

_mikmodify()
{
    export LD_LIBRARY_PATH="/home/shlomif/apps/multimedia/libmikmod/lib:$LD_LIBRARY_PATH"
    PATH="$HOME/apps/multimedia/mikmod/bin:$PATH"
}
