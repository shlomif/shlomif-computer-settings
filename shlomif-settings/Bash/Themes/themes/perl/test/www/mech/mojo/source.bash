load_common bundle/dzil_git
load_common ctags_this

base="$HOME/progs/perl/cpan/Test/WWW/Mechanize"
git_base="$base"
trunk="$base/trunk"
module="$trunk/Test-WWW-Mechanize-Mojo"
this="$module"
remote_repo="$(_shlomif_github "perl-test-www-mechanize-mojo")"

PATH="$inst_modules_dir/bin/:$PATH"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='Test-WWW-Mech-Mojo'
cd "$this"
