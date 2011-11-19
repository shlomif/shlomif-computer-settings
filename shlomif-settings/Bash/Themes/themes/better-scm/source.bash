load_common mymake

base="$HOME/Docs/programming/SCM/better-scm/site"
trunk="$base/trunk"
comparison="$trunk/src/comparison"

setup()
{
    (
        mkdir -p "$base"
        cd "$base"
        hg clone 'ssh://hg@bitbucket.org/shlomif/better-scm' "$trunk"
    )
}

cd $trunk

