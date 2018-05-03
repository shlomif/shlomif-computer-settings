load_common mymake
load_common completion
load_common prompt
load_common sys
# load_common gen_patch

base="$HOME/progs/perl/net/irc/bots/mozbot"
hg="$base/mozbot"
trunk="$hg"
cvs="$base/cvssrc/mozbot"

__myctags()
{
    (
        cd "$trunk" && \
        ctags -f tags --recurse --totals \
            --exclude='**/.hg/**' \
            --exclude='*~' \
            --languages=Perl --langmap=Perl:+.t
    )
}

prompt()
{
     __prompt_cmd \
        "\$hg=$hg" \
        "\$base=$base" \
        "~=$HOME"
}

check()
{
    (cd "$trunk" && perl -cT mozbot.pl)
}

run()
{
    (cd "$trunk" && perl -T mozbot.pl)
}

c()
{
    check "$@"
}

Pu()
{
    (
        cd "$trunk"
        _sys hg push 'ssh://hg@bitbucket.org/shlomif/mozbot-shlomif'
    )
}

proj_name='mozbot'

cd "$trunk"
