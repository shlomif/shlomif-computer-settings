load_common bundle/git
load_common pypy

base="$HOME/Download/unpack/perl/p6"
rb="$base/rakudobrew"
rs="$base/rakudo-star"
export RAKUDO_ROOT=${RAKUDO_ROOT:-$rs}

export PATH="${RAKUDO_ROOT}/bin:$PATH"
PATH="$PATH:$HOME/Download/unpack/perl/p6/rakudo-star/rakudo-star-2018.04/install/bin:$HOME/Download/unpack/perl/p6/rakudo-star/rakudo-star-2018.04/install/share/perl6/site/bin"

# trunk="$base/doc"
trunk="$base/CI-Gen/perl6-CI-Gen"
app_dir="$trunk"
this="$app_dir"

u-()
{
    bash "$base/s/rakudo-git-master-install/rakudo-git.bash"
}

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
        r="$HOME/apps/perl6-rakudo"
        PATH="$r/bin/:$r/share/perl6/site/bin:$PATH"
        eval "$@"
    )
}

proj_name='Perl6'

t()
{
    mi6 test
}

ci()
{
    git add -u . && \
    git commit "$@"
}

i()
{
    zef install --force-install . && \
    rgm zef install --force-install .
}

e()
{
    gvim -o lib/CI/Gen.pm6 t/01-basic.t bin/ci-generate
}
