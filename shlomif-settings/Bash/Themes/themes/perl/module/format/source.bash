load_common mymake
load_common completion
load_common prompt
load_common git

cpan_base="$HOME/progs/perl/cpan"
git_base="$cpan_base"
repos="$cpan_base/git"
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
