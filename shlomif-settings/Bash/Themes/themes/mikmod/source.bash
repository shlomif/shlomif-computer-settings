load_common mymake
load_common completion
load_common prompt
load_common hg
load_common ssh_add

mikmod="$HOME/progs/mikmod"
hg_base="$mikmod/hg"
trunk="$hg_base/mikmod"
libmikmod="$trunk/libmikmod"
site_repo="$mikmod/mikmod-website"
site="$site_repo/mikmod-website"
testing="$mikmod/testing/mikmod-test-suite/mikmod-test-suite"
proj_name="mikmod"

remote_repo='ssh://shlomif@mikmod.hg.sourceforge.net/hgroot/mikmod/mikmod'
this="$libmikmod"
# this="$dd_branch"

# This causes problems with the threaded solver.
unset MALLOC_CHECK_

cd $this

prompt()
{
    __prompt_cmd \
        "\$testing=$testing" \
        "\$site=$site" \
        "\$trunk=$trunk" \
        "~=$HOME"
}
