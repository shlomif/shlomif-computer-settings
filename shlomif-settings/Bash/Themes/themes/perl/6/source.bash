load_common mymake
load_common completion
load_common prompt
load_common git
load_common pypy

# load_common gen_patch
base="$HOME/Download/unpack/perl/p6"
rb="$base/rakudobrew"
rs="$base/rakudo-star"
export RAKUDO_ROOT=${RAKUDO_ROOT:-$rs}

export PATH="${RAKUDO_ROOT}/bin:$PATH"
PATH="$PATH:$HOME/Download/unpack/perl/p6/rakudo-star/rakudo-star-2018.04/install/bin:$HOME/Download/unpack/perl/p6/rakudo-star/rakudo-star-2018.04/install/share/perl6/site/bin"

trunk="$base/doc"
app_dir="$trunk"
this="$app_dir"

rw_repos_url="$(_shlomif_github "Rx.pl")"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

# Rakudo git master
rgm()
{
    (
        PATH="$HOME/apps/perl6-rakudo/bin/:$PATH"
        eval "$@"
    )
}

proj_name='Perl6'
