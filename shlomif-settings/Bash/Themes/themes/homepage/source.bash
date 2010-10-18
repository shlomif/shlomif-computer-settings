load_common mymake
load_common completion
load_common no_implicit_make
load_common prompt

base="$HOME/Docs/homepage"
trunk="$base/homepage/trunk"
section_menus="$trunk/lib/Shlomif/Homepage/SectionMenu/Sects/"
this="$trunk"
fortunes="$trunk/t2/humour/fortunes/"
blog="$HOME/Docs/homepage/blog"
logs="$HOME/Download/homesite-logs"
p4n="$trunk/lib/presentations/qp/perl-for-newbies"

cd $this

Edit_Styles()
{
    cd "$trunk"
    gvim common/style.css.ttml lib/*.css.ttml
}

anti()
{
    (
        cd "$trunk"
        gvim -p t2/open-source/anti/apple/index.html.wml \
            t2/open-source/anti/mysql/index.html.wml \
            t2/open-source/anti/windows-vista/index.html.wml \
            t2/no-ie/index.html.wml \
            t2/philosophy/case-for-file-swapping/index.html.wml
    )
}

prompt()
{
    __prompt_cmd \
        "\$p4n=$p4n" \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

# Generate the fortunes
genf()
{
    (cd $trunk && ./bin/gen-fortunes.pl)
}

fastdiff()
{
    local since="$1"
    shift

    svn diff -r "$since:HEAD" \
        "file://$HOME/Backup/svn-dumps/projectlocker/svnsync-repos/shlomif/homepage/trunk"
}

PS1="\\u[homepage]:\$(prompt)\\$ "

