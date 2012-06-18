load_common mymake
load_common completion
load_common prompt
load_common hg

base="$HOME/progs/perl/cpan/File/Dir-Dumper"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/File-Dir-Dumper"
remote_repo='ssh://hg@bitbucket.org/shlomif/perl-file-dir-dumper'
this="$module"

cd "$this"

t()
{
    cd "$this" && ./Build runtest
}

e()
{
    (cd "$this" && gvim -p $(ack -f lib/))
}

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u:\$(prompt)\\$ "

