load_common bundle/git
load_common partests
load_common chdirs
load_common latemp

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
pristine_copy=~/Backup/Arcs/post-dest/post-incs

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
    diff -u -r "$pristine_copy" dest/post-incs/ | gvim -
}

fastdiff()
{
    local since="$1"
    shift

    git diff -r "$since" -r master .
}

up()
{
    (cd "$trunk" && gmake -j4 upload)
}

beta_up()
{
    (cd "$trunk" && gmake -j4 upload_var upload_local upload_beta)
}

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

# fast render
fr()
{
    (
        set -x
        set -e
        git ls-files t2 | grep wml | xargs touch
        gmake -j4 fastrender
        t
    )
}

mymv()
{
    for fn in "$@"
    do
        local new="${fn%%/index.html.wml}/index.xhtml.wml"
        git mv "$fn" "$new"
        perl -i -lpE 's/^#include.*template\K(\.wml)/5$1/' "$new"
    done
    rm -f lib/cache/STAMP.one
    ./gen-helpers
    t
}

ba()
{
    rm -fr "$pristine_copy"
    cp -a dest/post-incs/ "$pristine_copy"
}

# Update a story / screenplay repo based on the ci-generate config.
# See: https://github.com/shlomif/ci-gen-framework .
g()
{
    ( ci-generate && git au && git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/update-ci-gen-travis-yml.txt && p )
}

alias m=gmake

export TIDYALL_DATA_DIR="$HOME/Backup/Arcs/shlomif-homepage-tidyall.d"
# Commented out because it makes matters slower:
# export HTML_POST_INCS_DATA_DIR="$HOME/Backup/Arcs/shlomif-homepage-gezer.d"
export VNU_CACHE="$HOME/Backup/Arcs/shlomif-homepage-vnu-cache.json"

__add_to_path

proj_name='homepage'
