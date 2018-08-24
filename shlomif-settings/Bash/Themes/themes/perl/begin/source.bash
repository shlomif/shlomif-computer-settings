load_common git
load_common meta_inc1

base="$HOME/Docs/programming/Perl/web-sites/perl-begin"
trunk="$base/trunk"
this="$trunk"
remote_repo="$(_shlomif_github "perl-begin")"

cd "$this"

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

t()
{
    (cd "$trunk" && make -j4 test)
}

proj_name='perl-begin'
