# Taken from http://unix.stackexchange.com/questions/40749 - thanks!
# Deduplicate path variables
get_var () {
    eval 'printf "%s" "${'"$1"'}"'
}
set_var () {
    eval "$1=\"\$2\""
}
dedup_pathvar () {
    pathvar_name="$1"
    pathvar_value="$(get_var "$pathvar_name")"
    deduped_path="$(perl -e 'print join(":",grep { my $p = $_; ((not $seen{$p}++) and ($p =~ /\S/ms)) } split(/:/, $ARGV[0]))' "$pathvar_value")"
    set_var "$pathvar_name" "$deduped_path"
}
