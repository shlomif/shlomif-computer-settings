load_common bundle/git
load_common completion
load_common perl_dzil
load_common perl_system_tests

base="$HOME/progs/perl/www/Nav-Menu"
git_base="$base"
trunk="$base/trunk"
this="$trunk/module"
rw_repos_url="https://svn.berlios.de/svnroot/repos/web-cpan/nav-menu"
read_repos_url="http://svn.berlios.de/web-cpan/nav-menu"
test_dir="$trunk/tests/integration/sites-gen"
remote_repo="$(_shlomif_github "perl-HTML-Widgets-NavMenu")"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='NavMenu'

cd "$this"
