p5_base="$HOME/Download/unpack/perl/perl5"
this="$p5_base/bleadperl/bleadperl-for-work"

cd "$this"

function edit {
    if [ ! -e "$1.orig" ] ; then
        cp "$1" "$1.orig"
    fi
    gvim -f "$1"
}

function unedit {
if [ -L "$1".orig ]; then
    rm "$1"
    mv "$1".orig "$1"
fi
}

mkpatchorig() {
    local diffopts
    for f in `find . -name '*.orig' | sed s,^\./,,`
    do
        case `echo $f | sed 's,.orig$,,;s,.*\.,,'` in
            c)   diffopts=-p ;;
            pod) diffopts='-F^=' ;;
            *)   diffopts= ;;
        esac
        diff -du $diffopts $f `echo $f | sed 's,.orig$,,'`
    done
}

