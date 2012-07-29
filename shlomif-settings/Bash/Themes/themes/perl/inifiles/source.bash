load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/cpan/Config/IniFiles"
hg_base="$base/hg"
trunk="$hg_base/config-inifiles"
module="$trunk/config-inifiles"

this="$module"

cd "$this"

setup()
{
    mkdir -p "$hg_base"
    cd "$hg_base"
    hg clone 'ssh://hg@bitbucket.org/shlomif/perl-config-inifiles'
    # svn co 'https://config-inifiles.svn.sourceforge.net/svnroot/config-inifiles/trunk/'
    cd "$trunk"
}

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
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

PS1="\\u[cfg-ini]:\$(prompt)\\$ "

