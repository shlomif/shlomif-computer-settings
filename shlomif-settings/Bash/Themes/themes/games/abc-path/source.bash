load_common mymake
load_common completion
load_common prompt
load_common hg

# repos="https://svn.berlios.de/svnroot/repos/fc-solve/abc-path/"
# repos_trunk="${repos}trunk/"


mod="Games-ABC_Path-Solver"
base="$HOME/progs/games/abc-path"
hg_base="$base"
trunk="$base/trunk"
module="$trunk/abc-path/$mod/"
# c_src="$trunk/nurikabe-solver"
this="$module"

remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="abc-path")"

cd "$this"

t()
{
    cd "$this" && ./Build runtest
}

prompt()
{
    __prompt_cmd \
        "\$module=$module" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

proj_name='abc-path'
