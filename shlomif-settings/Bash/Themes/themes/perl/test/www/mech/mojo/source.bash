load_common mymake
load_common completion
load_common prompt
load_common hg
# load_common gen_patch
load_common perl_dzil
load_common ctags_this

base="$HOME/progs/perl/cpan/Test/WWW/Mechanize"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/Test-WWW-Mechanize-Mojo"
this="$module"
remote_repo="$(_shlomif_bitbucket "perl-test-www-mechanize-mojo")"

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
