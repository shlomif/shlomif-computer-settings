load_common bundle/git
load_common pypy

base="$HOME/Download/unpack/perl/p6"
rb="$base/rakudobrew"
rs="$base/rakudo-star"
export RAKUDO_ROOT=${RAKUDO_ROOT:-$rs}

export PATH="${RAKUDO_ROOT}/bin:$PATH"
PATH="$PATH:$HOME/Download/unpack/perl/p6/rakudo-star/rakudo-star-2018.04/install/bin:$HOME/Download/unpack/perl/p6/rakudo-star/rakudo-star-2018.04/install/share/perl6/site/bin"

# trunk="$base/doc"
git_base="$base"
trunk="$base/CI-Gen"
app_dir="$trunk/perl6-CI-Gen"
this="$app_dir"
rgm_dir="$base/s/rakudo-git-master-install"

__setup_rgm_installer()
{
    if ! test -e "$rgm_dir"
    then
        rgm_basedir="$(dirname "$rgm_dir")"
        mkdir -p "$rgm_basedir"
        (
            git clone 'https://github.com/shlomif/rakudo-git-master-install' "$rgm_dir"
        )
    fi
}

__setup_rgm_installer

update_all()
{
    bash "$rgm_dir/rakudo-git.bash"
}

u-()
{
    update_all "$@"
}

rw_repos_url="$(_shlomif_github "ci-gen-framework")"
remote_repo="$rw_repos_url"

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
