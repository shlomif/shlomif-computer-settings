source "$HOME/.common_aliases.bash"
inst_modules_dir="$HOME/apps/perl/modules"
dc()
{
    echo "It's cd - not dc dammit!" 1>&2
}
disable_local_lib()
{
    unset MODULEBUILDRC PERL_MM_OPT
}
rpmbuild()
{
    (
        disable_local_lib
        `which rpmbuild` "$@"
    )
}
cp_mods()
{
    touch "$@"
    cp -i "$@" /home/music/Music/mp3s/Mods/
}
mv_flv()
{
    touch "$@"
    mv -i "$@" /home/music/Music/mp3s/
}
# What this function does is cache the result of a command in a file, and
# use the file to output the results in case it exists.
# Format is: cache "$basename_to_cache_in" $cmd $arg1 $arg2 $arg3...
cache()
{
    local cache_fn="$1"
    shift

    local dir="${CACHE_DIR:-.}"

    if ! test -d "$dir"; then
        mkdir -p "$dir"
    fi

    local fn="$dir/$cache_fn"
    if ! test -f "$fn" ; then
        "$@" > "$fn"
    fi
    cat "$fn"
}
_update_PERL5LIB()
{
    local dir="$HOME/conf/trunk/shlomif-settings/bash-aliases"
    local bn="PERL5LIB_gen.sh"
    local fn="$dir/$bn"
    if ! test -e "$fn"
    then
        ( cd "$dir" && make )
    fi
    . "$fn"
}
_update_PERL5LIB
alias myrsync='rsync -a --progress -v --inplace' \
  rem_up='HOMEPAGE_SSH_PATH="$__HOMEPAGE_REMOTE_PATH" make upload' \
  xz9='xz -9 --extreme' ifconfig='/sbin/ifconfig'

rexz9()
{
    local fn="$1"
    unxz "$fn"
    xz9 "${fn%.xz}"
}
