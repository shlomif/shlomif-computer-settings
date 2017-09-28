load_common git
load_common mymake
load_common prompt
load_common completion
load_common no_implicit_make

base="$HOME/Docs/programming/Perl/web-sites/perl-begin"
trunk="$base/trunk"
this="$trunk"
remote_repo="$(_shlomif_github "perl-begin")"

cd $this


prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

up()
{
    (cd "$trunk" && make -j4 upload upload_hexten)
}

proj_name='perl-begin'

