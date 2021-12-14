load_common bundle/git
load_common pypy

remote_repo="$(_shlomif_bitbucket_git "project-euler-git")"

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

dir_hist_fn="$HOME/Arcs/temp/euler-dir-hist.sh"

rec_hist()
{
    echo "cd `pwd`" >> "$dir_hist_fn"
}

prev()
{
    cd "$(__next_func "-1")"
    rec_hist
}

next()
{
    cd "$(__next_func "+1")"
    rec_hist
}

last()
{
    . "$dir_hist_fn"
}

ff()
{
    xdg-open "https://projecteuler.net/problem=$(basename "`pwd`")"
}

runhelper()
{
    local prog="$1"
    shift
    if test -x "$prog"
    then
        time "./$prog" "$@"
    elif [[ $prog = *.py ]]
    then
        time pypy3 "$prog" "$@"
    elif [[ $prog = *.pl ]]
    then
        time perl "$prog" "$@"
    elif [[ $prog = *.rb ]]
    then
        time ruby "$prog" "$@"
    fi
}

r()
{
    runhelper "$@"
}

ct()
{
    cd "$trunk"
}
alias ne=next pr=prev

proj_name='ProjEuler'
export HARNESS_OPTIONS=j4:c
