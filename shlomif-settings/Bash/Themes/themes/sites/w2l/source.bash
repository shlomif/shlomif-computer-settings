load_common mymake
load_common completion

base="$HOME/Docs/IGLU/Welcome-to-Linux"
trunk="$base/trunk"

setup()
{
    (
    if ! test -e "$trunk" ; then
        mkdir -p "$base"
        cd "$base"
        svn checkout 'https://linux-israel.googlecode.com/svn/welcome-to-linux/site/trunk/'
    fi
    )
}
this="$trunk"
cd $this

