load_common bundle/dzil_git
load_common edit_perl_lib

base="$HOME/progs/perl/cpan/Config/IniFiles"
git_base="$base"
trunk="$base/git"
module="$trunk/config-inifiles"
remote_repo="$(_shlomif_github "perl-Config-IniFiles")"

this="$module"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='cfg-ini'
