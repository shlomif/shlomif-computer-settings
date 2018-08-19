load_common meta_inc1
load_common git

remote_repo="$(_shlomif_github "shlomif-email-signature")"

base="$HOME/Docs/Personal/email"
git_base="$base"
trunk="$base/signature"
repo="$trunk"
src="$trunk"
this="$src"

s="$src"
c="$s"
cd "$this"

prompt()
{
    __prompt_cmd \
        "\$src=$src" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

b()
{
    (
        cd "$trunk/b" && \
        cmake "$src" && \
        make
    )
}

t()
{
    (
        cd "$src" && sh test.sh
    )
}

e()
{
    cd "$src" && gvim -o gen-shlomif-sig shlomif-sig-quotes.txt
}

proj_name='EmailSignature'
