load_common mymake
load_common completion
load_common git
load_common perl_dzil

export AUTHOR_TESTING=1

base="$HOME/progs/perl/cpan/App/Notifier"
trunk="$base/App-Notifier"
this="$trunk"

remote_repo="$(_shlomif_github "app-notifier")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "~=$HOME"
}

proj_name='Notifier'
