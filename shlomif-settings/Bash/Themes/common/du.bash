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
