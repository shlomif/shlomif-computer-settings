load_common bundle/git
load_common partests
load_common chdirs

base="$HOME/Docs/homepage"
hg_base="$base"
trunk="$base/homepage/trunk"
section_menus="$trunk/lib/Shlomif/Homepage/SectionMenu/Sects/"
this="$trunk"
fortunes="$trunk/t2/humour/fortunes/"
blog="$HOME/Docs/homepage/blog"
logs="$HOME/Download/homesite-logs"
p4n="$trunk/lib/presentations/qp/perl-for-newbies"
remote_repo="$(_shlomif_github "shlomi-fish-homepage")"

export SCREENPLAY_COMMON_INC_DIR="$trunk/lib/screenplay-xml/from-vcs/screenplays-common"
sel="$trunk/lib/screenplay-xml/from-vcs/Selina-Mandrake/selina-mandrake/screenplay/"
pope="$trunk/lib/fiction-xml/from-vcs/The-Pope-Died-on-Sunday/Pope/text/"
humanity="$trunk/lib/screenplay-xml/from-vcs/Humanity-the-Movie/humanity/screenplay/"
we="$trunk/lib/screenplay-xml/from-vcs/Star-Trek--We-the-Living-Dead/star-trek--we-the-living-dead/screenplay/"
wtld="$we"
hhfg="$trunk/lib/fiction-xml/from-vcs/Human-Hacking-Field-Guide/HHFG/text/"
summer="$trunk/lib/screenplay-xml/from-vcs/Summerschool-at-the-NSA/summerschool-at-the-nsa/screenplay/"
earth="$trunk/lib/fiction-xml/from-vcs/The-Earth-Angel/The-Earth-Angel/text/"
buf="$trunk/lib/screenplay-xml/from-vcs/Buffy-a-Few-Good-Slayers/buffy--a-few-good-slayers/screenplay/"
towtf="$trunk/lib/screenplay-xml/from-vcs/TOW-Fountainhead/TOW_Fountainhead/screenplay"
blue="$trunk/lib/screenplay-xml/from-vcs/Blue-Rabbit-Log/Blue-Rabbit-Log/screenplay"
mup="$trunk/lib/screenplay-xml/from-vcs/The-Muppets-Show--The-New-Incarnation/Muppets-Show-TNI/screenplay"
qoh="$trunk/lib/screenplay-xml/from-vcs/So-Who-the-Hell-Is-Qoheleth/so-who-the-hell-is-qoheleth/screenplay"

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

did()
{
    diff -u -r  ../post-dest/ post-dest/ | gvim -
}

fastdiff()
{
    local since="$1"
    shift

    git diff -r "$since" -r master .
}

up()
{
    (cd "$trunk" && make -j4 upload)
}

beta_up()
{
    (cd "$trunk" && make -j4 upload_var upload_local upload_beta)
}

b()
{
    (cd "$trunk" && make -j16 && make test ; n --msg "make")
}

alias t='b'

# edit facts
efact()
{
    (
        cd "$trunk"
        gvim -o lib/factoids/shlomif-factoids-lists.xml \
            t2/humour/fortunes/shlomif-factoids.xml \
            ~/Docs/Personal/email/signature/shlomif-sig-quotes.txt
    )
}

rebuild()
{
    (
        set -x
        set -e
        cd "$trunk"
        time bin/rebuild
        n -m "rebuild"
    )
}

alias p='git push'
export PATH="$HOME/apps/quadpres/bin:$HOME/Download/unpack/xml/ebookmaker:$trunk/node_modules/.bin:$PATH:/usr/sbin" QUAD_PRES_QUIET=1
dedup_pathvar PATH
dedup_pathvar PERL5LIB
dedup_pathvar PYTHONPATH

export TIDYALL_DATA_DIR="$HOME/Backup/Arcs/shlomif-homepage-tidyall.d"
proj_name='homepage'
