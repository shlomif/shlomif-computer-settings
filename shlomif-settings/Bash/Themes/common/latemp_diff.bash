
backup_diff()
{
    if test -z "$pristine_copy"
    then
        echo "pristine_copy must be set"
        return
    fi
    mkdir -p "$pristine_copy"
    rm -fr "$pristine_copy"
    rsync -a --exclude '**/MathJax/**' "$_post_dest/" "$pristine_copy"
}

ba()
{
    backup_diff "$@"
}

restore()
{
    rsync -a --exclude '**/MathJax/**' $pristine_copy "$_post_dest/"
}

diff_to_pristine()
{
    if test -z "$pristine_copy"
    then
        echo "pristine_copy must be set"
        return
    fi
    bash "$latemp_trunk/bin/reduce-differences-in-diff-dash-r.bash" "$pristine_copy" "$pristine_copy_reduced"
    bash "$latemp_trunk/bin/reduce-differences-in-diff-dash-r.bash" "$_post_dest" "$this_copy_reduced"
    diff -u -r "$pristine_copy_reduced" "$this_copy_reduced" | gvim -
}

did()
{
    diff_to_pristine "$@"
}
