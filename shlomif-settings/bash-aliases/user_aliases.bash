source "$HOME/.common_aliases.bash"
alias myrsync='rsync -a --progress -v --inplace'

dc()
{
    echo "It's cd - not dc dammit!" 1>&2
}

disable_local_lib()
{
    unset MODULEBUILDRC PERL_MM_OPT
}
alias screen='screen -e "^^6"'
alias rem_up='HOMEPAGE_SSH_PATH="$__HOMEPAGE_REMOTE_PATH" make upload'
alias perlbug='perlbug -r shlomif@iglu.org.il -c shlomif@iglu.org.il -e "gvim -f"'
mdvsys()
{
    (
        disable_local_lib
        `which mdvsys` "$@"
    )
}
rpmbuild()
{
    (
        disable_local_lib
        `which rpmbuild` "$@"
    )
}
alias xz9='xz -9 --extreme'
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
alias ifconfig='/sbin/ifconfig'
alias caddy="ruby $HOME/progs/perl/Quizzes/Golf/golf.shinh.org/caddy-tool-for-golfers/caddy/caddy.rb"

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

inst_modules_dir="$HOME/apps/perl/modules"

_update_PERL5LIB()
{
    for I in $inst_modules_dir/{lib/{perl5/,}site_perl,lib/perl5}/{5.16.3,5.16.2,5.16.1,5.16.0} ; do
        if [ -z "$PERL5LIB" ] ; then
            # Do nothing
            true
        else
            PERL5LIB="$PERL5LIB:"
        fi
        PERL5LIB="$PERL5LIB$I"
    done
    export PERL5LIB
}
