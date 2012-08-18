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
