load_common mymake
load_common read_hist
load_common completion

this="$HOME/progs/quadpres/trunk/installer"
site="$HOME/progs/quadpres/trunk/site"

cd $this

read_hist "$theme"

switch_to_quadpres()
{
    local which mypath
    which="$1"
    mypath="$HOME/apps/test/quadpres/bin"
    if [ "$which" == "local" ] ; then
        if echo "$PATH" | grep -F "$mypath" ; then
            true # Do Nothing
        else
            PATH="$mypath:$PATH"
        fi
    elif [ "$which" == "global" ] ; then
        PATH="$(echo "$PATH" | sed "s!$mypath:?!!")"
    else
        echo "Unknown QP Target $which" 1>&2
    fi
}

svn_tag()
{
    # local qp_base="http://localhost:8080/svn/repos/progs/quad-pres/"
    local qp_base="https://stalker.iguide.co.il:8081/svn/lm-solve/quad-pres"
    local tag_url="$qp_base/tags/latest-devel"
    svn rm -m "Deleting Old Tag" "$tag_url"
    svn copy -m "Tagging the Latest Devel Version of Quad-Pres" "$qp_base/trunk" "$tag_url"
}

