load_common bundle/dzil_git

cpan_base="$HOME/progs/perl/cpan/Module"
git_base="$cpan_base"
repos="$cpan_base/perl-Module-Format"
trunk="$repos"
base="$repos/Module-Format/Module-Format"
this="$base"
remote_repo="$(_shlomif_github "perl-Module-Format")"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$cpan_base=$cpan_base" \
        "~=$HOME"
}

proj_name='Module-Format'
cd $this
