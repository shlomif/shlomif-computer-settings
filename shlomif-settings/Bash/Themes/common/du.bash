an()
{
    analyze-du "$@"
}

ah()
{
    du -ah . | sort -h
}

-s()
{
    du -sh *
}

shs()
{
    du -sh * | sort -h
}

h()
{
    FACTOR='1024' ~/conf/trunk/shlomif-settings/home-bin-executables/bin/add-num-suffixes.pl
}
