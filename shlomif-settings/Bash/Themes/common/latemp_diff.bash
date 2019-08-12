ba()
{
    mkdir -p "$pristine_copy"
    rm -fr "$pristine_copy"
    rsync -a --exclude '**/MathJax/**' "$_post_dest/" "$pristine_copy"
}

did()
{
    bash "$latemp_trunk/bin/reduce-differences-in-diff-dash-r.bash" "$pristine_copy" "$pristine_copy_reduced"
    bash "$latemp_trunk/bin/reduce-differences-in-diff-dash-r.bash" "$_post_dest" "$this_copy_reduced"
    diff -u -r "$pristine_copy_reduced" "$this_copy_reduced" | gvim -
}
