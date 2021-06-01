proj_name='homepage'
load_common bundle/git
load_common partests
load_common chdirs

base="$HOME/Docs/homepage"
git_base="$base/homepage"
trunk="$git_base/trunk"
section_menus="$trunk/lib/Shlomif/Homepage/SectionMenu/Sects/"
this="$trunk"
fortunes="$trunk/src/humour/fortunes/"
blog="$HOME/Docs/homepage/blog"
logs="$HOME/Download/homesite-logs"
p4n="$trunk/lib/presentations/qp/perl-for-newbies"
remote_repo="$(_shlomif_github "shlomi-fish-homepage")"
export QUAD_PRES_CACHE_DIR=~/Arcs/temp/quad-pres-cache
export PERL_INLINE_DIRECTORY="${TMPDIR:-/tmp}/shlomif-hp-Inline"
if ! test -d "$PERL_INLINE_DIRECTORY"
then
    mkdir -p "$PERL_INLINE_DIRECTORY"
fi
pristine_copy=~/Backup/Arcs/post-dest/post-incs
pristine_copy_reduced=~/Backup/Arcs/post-dest/post-incs-reduced
this_copy_reduced=~/Backup/Arcs/post-dest/this-incs-reduced
_post_dest="dest/post-incs"

load_common latemp

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
ter="$trunk/lib/screenplay-xml/from-vcs/Terminator-Liberation/terminator--liberation/screenplay"
que="$trunk/lib/screenplay-xml/from-vcs/Queen-Padme-Tales/queen-padme-tales/screenplay"
padme="$que"
pad="$que"

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
        gvim -p src/open-source/anti/apple/index.html.tt2 \
            src/open-source/anti/mysql/index.html.tt2 \
            src/open-source/anti/windows-vista/index.html.tt2 \
            src/no-ie/index.html.tt2 \
            src/philosophy/case-for-file-swapping/index.html.tt2
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
            ~/Docs/Personal/email/signature/shlomif-sig-quotes.txt
    )
}

# fast render
_fast_render()
{
    (
        set -x
        set -e
        git ls-files src | grep -E '\.tt2$' | xargs touch
        gmake -j4 fastrender
        t
    )
}

fr()
{
    _fast_render "$@"
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

# Update a story / screenplay repo based on the ci-generate config.
# See: https://github.com/shlomif/ci-gen-framework .
update_a_story_ci_gen()
{
    ( ci-generate && git au && git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/update-ci-gen-travis-yml.txt && p )
}

alias g=update_a_story_ci_gen

partial_rebuild()
{
    (
        set -e -x
        cd "$trunk"
        prettier --parser scss --arrow-parens always --tab-width 4 --trailing-comma all --write lib/sass/*.scss
        gmake fastrender
        rm -f lib/cache/STAMP.post-dest
        t
    )
}

-p()
{
    partial_rebuild
}

_ack_with_no_lib_prefix()
{
    ack "${1##lib/}"
}

# alias y=_ack_with_no_lib_prefix

MAKEFLAGS+=" -s"
alias m=gmake
if test -x /usr/bin/dbtoepub
then
    export DBTOEPUB="/usr/bin/ruby $(which dbtoepub)"
fi

if test -d /usr/share/xml/docbook/stylesheet/docbook-xsl-ns
then
    export DOCBOOK5_XSL_STYLESHEETS_PATH=/usr/share/xml/docbook/stylesheet/docbook-xsl-ns
fi

_setup_node_modules_cache()
{
    (
    set -e
    local nm="$trunk/node_modules"
    local nmgit="$nm/.git"
    if ! test -e "$nmgit"
    then
        cd "$trunk"
        bash bin/install-npm-deps.sh
        cd "$nm"
        git init .
        cd "$trunk/bower_components"
        git init .
    fi
    )
    if test "$?" = 0
    then
        export SKIP_NODE_INST=1
    fi
}

_setup_node_modules_cache

partial_upload()
{
    (
        set -e -x
        partial_rebuild
        gmake upload_local upload_var
        test -z "$noremote" && gmake upload_beta
    )
}

-u()
{
    partial_upload "$@"
}

fedora_user_experience()
{
    export NOTIFIER_TO=sh SKIP_SPELL_CHECK=1
    export $(dbus-launch)
    MAKEFLAGS+=" -j8"
    unset NOTIFIER_TO
    # export NOTIFIER_TO=sh SKIP_SPELL_CHECK=1
}

fedora_ux()
{
    fedora_user_experience
}


debian_user_experience()
{
    export SKIP_SPELL_CHECK=1
    PATH+=:/home/shlomif/apps/test/bin:/home/shlomif/perl5/bin/
    MAKEFLAGS+=" --no-silent"
    # export $(dbus-launch)
    # MAKEFLAGS+=" -j8"
    # unset NOTIFIER_TO
    # export NOTIFIER_TO=sh SKIP_SPELL_CHECK=1
}

debian_ux()
{
    debian_user_experience
}

run_epubcheck()
{
    (
        set -e -x
        find . -name '*.epub' -delete
        -p
        java -jar ~/Download/unpack/to-del/epubcheck/target/epubcheck.jar  `fd -I .epub "$homepage/dest/post-incs" | sort` |& tee ~/Arcs/temp/epubcheck.txt
    )
}

# Commented out because it makes matters slower:
# export HTML_POST_INCS_DATA_DIR="$HOME/Backup/Arcs/shlomif-homepage-gezer.d"

# one can unset it.
# export SKIP_SPELL_CHECK=1
__add_to_path
