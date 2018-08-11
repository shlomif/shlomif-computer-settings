load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/cpan/CPANHQ/"
trunk="$base/cpanhq"
this="$trunk"

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}


serve()
{
    (cd "$trunk" && perl "$@" script/cpanhq_server.pl)
}

minicpan_local_dir()
{
    perl -Mstrict -Mwarnings -le 'use CPAN::Mini; my %conf = CPAN::Mini->read_config(); print $conf{"local"}'
}

prompt()
{
    __prompt_cmd \
        "\$plugins=$plugins" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

run_indexing()
{
    (cd "$trunk" && perl tmp/index.pl "$(minicpan_local_dir)" )
}

cd $this
