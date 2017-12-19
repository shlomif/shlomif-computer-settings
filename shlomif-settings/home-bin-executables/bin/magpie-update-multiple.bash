update_multi()
{
    while read mod ; do
        (
            echo "$mod"
            pco "$mod" && \
                mu && \
                cd .. \
                rm -fr "$mod"
        )
    done
}
