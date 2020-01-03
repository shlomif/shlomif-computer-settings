load_common mymake
load_common completion
load_common git
load_common perl_dzil
load_common prompt

export AUTHOR_TESTING=1

base="$HOME/progs/perl/cpan/App"
trunk="$base/CSV2Chart"
this="$trunk/App-CSV2Chart"

remote_repo="$(_shlomif_github "CSV2Chart")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$this=$this" \
        "\$trunk=$trunk" \
        "~=$HOME"
}

proj_name='CSV2Chart'
