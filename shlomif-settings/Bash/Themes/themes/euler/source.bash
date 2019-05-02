load_common bundle/git
load_common pypy

remote_repo="$(_shlomif_github "project-euler")"

base="$HOME/progs/riddles/project-euler/"
git_base="$base"
trunk="$base/git"
repo="$trunk"
src="$trunk/project-euler"
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
        b="$trunk/b"
        mkdir -p "$b"
        cd "$b" && \
        cmake "$src" && \
        make && rm -fr "$b"
    )
}

t()
{
    (
        cd "$src" && sh test.sh
    )
}

__next_func()
{
    local inc="$1"
    shift
    perl -MPath::Tiny=cwd -E "$(printf '$c = cwd(); @d = sort { $a->basename <=> $b->basename } grep{$_->is_dir} $c->parent->children(qr/\A[0-9]+\z/); my @i = grep { $d[$_]->basename == $c->basename } keys @d;say $d[$i[0]%s]->absolute;' "$inc")"
}

prev()
{
    cd "$(__next_func "-1")"
}

next()
{
    cd "$(__next_func "+1")"
}

alias ne=next pr=prev

proj_name='ProjEuler'
