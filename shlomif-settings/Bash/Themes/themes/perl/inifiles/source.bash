load_common mymake
load_common completion
load_common prompt
load_common git
load_common perl_dzil

base="$HOME/progs/perl/cpan/Config/IniFiles"
git_base="$base"
trunk="$base/git"
module="$trunk/config-inifiles"
remote_repo="$(_shlomif_github "perl-Config-IniFiles")"

this="$module"

cd "$this"

e()
{
    (cd "$this" && gvim -p $(ack -f lib/))
}

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='cfg-ini'
