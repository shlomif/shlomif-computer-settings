load_common bundle/dzil_git
load_common perl_system_tests

base="$HOME/progs/perl/cpan/App/Docmake"
git_base="$base"
trunk="$base/trunk"
module="$trunk/modules/App-XML-DocBook-Docmake"
this="$module"
test_dir="$HOME/Docs/Svn/Docs/programming/The-Perfect-IT-Workplace/docbook"
remote_repo="$(_shlomif_github "docmake")"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='docmake'

cd "$this"
