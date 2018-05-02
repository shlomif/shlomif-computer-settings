load_common mymake
load_common completion
load_common prompt
load_common hg

base="$HOME/progs/perl/cpan/IO-Socket-INET6"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/modules/IO-Socket-INET6"
this="$module"

remote_repo="$(_shlomif_bitbucket "perl-io-socket-inet6")"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='inet6'
cd $this
