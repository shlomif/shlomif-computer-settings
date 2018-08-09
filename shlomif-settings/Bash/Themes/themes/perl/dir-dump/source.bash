load_common mymake
load_common completion
load_common prompt
load_common git
load_common perl_dzil
load_common edit_perl_lib

base="$HOME/progs/perl/cpan/File/Dir-Dumper"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/File-Dir-Dumper"
remote_repo="$(_shlomif_github "perl-File-Dir-Dumper")"
this="$module"

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='dir-dump'
