proj_name='homepage'
load_common bundle/git
load_common partests
load_common chdirs

_enable_git_info_prompt="always"

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
pristine_copy=~/Arcs/temp/shlomif-homepage/post-dest/post-incs
pristine_copy_reduced=~/Arcs/temp/shlomif-homepage/post-dest/post-incs-reduced
this_copy_reduced=~/Arcs/temp/shlomif-homepage/post-dest/this-incs-reduced
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

stable_upload()
{
    (
    set -e -x
    cd "$trunk"
    gmake -j4 upload
    )
}

up()
{
    stable_upload
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

partial_rebuild_and_stable_upload()
{
    partial_rebuild && \
        stable_upload
}

-u()
{
    partial_rebuild_and_stable_upload "$@"
}

_ack_with_no_lib_prefix()
{
    ack "${1##lib/}"
}

# alias y=_ack_with_no_lib_prefix

MAKEFLAGS+=" -s"
alias m=gmake
_local_dbtoepub="$trunk/lib/repos/xslt10-stylesheets/xsl/epub/bin/dbtoepub"
if test -e "$_local_dbtoepub"
then
    export DBTOEPUB="/usr/bin/ruby $_local_dbtoepub"
elif test -x /usr/bin/dbtoepub
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
        # gmake upload_local upload_var
        cd "$trunk"
        gmake upload_var
        test -z "$noremote" && gmake upload_beta
    )
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
        find . -name '*.epub' -not -name 'AMasqueOfDays.epub' -delete
        partial_rebuild
        java -jar ~/Download/unpack/office/epubcheck/target/epubcheck.jar  `fd -I .epub "$homepage/dest/post-incs" | sort` |& tee ~/Arcs/temp/epubcheck.txt
    )
}

edit_queen_padme_teaser()
{
    u()
    {
        (
        set -e -x
        export MAKEFLAGS="-r -j4"
        cd /home/shlomif/Docs/homepage/homepage/trunk/lib/repos/Star-Wars-opening-crawl-from-1977-Remake
        prettier --parser typescript --arrow-parens always --tab-width 2 --trailing-comma all --write ts/index.ts
        prettier --parser scss --arrow-parens always --tab-width 2 --trailing-comma all --write scss/*.scss
        make -f ffmpeg.mak
        git au
        cd "$homepage"
        rm -fr dest/post-incs/t2/humour/Queen-Padme-Tales/teaser
        partial_rebuild_and_stable_upload
        )
    }
}

upload_celestia()
{
    x()
    {
        (
        set -e -x
        cd "$trunk"
        local tfn=r.xhtml fn=ride-princess-celestia.xhtml
        screenplay-text-to-xhtml5 -o "$tfn" lib/screenplay-xml/txt/Who-will-ride-Princess-Celestia.txt
        xsltproc -o "$fn" bin/screenplay-xhtml5-add-stylesheet.xslt "$tfn"
        sky up -x "$fn"
        )
    }
}

diff_test()
{
    (
    set -e -x
    backup_diff
    rebuild |& tee "${HOME}/hp-rebuild-output1.txt"
    diff_to_pristine
    )
}

-r()
{
    diff_test "$@"
}

quadpres_system_test()
{
    (
    set -e -x
    backup_diff
    rm -fr "$QUAD_PRES_CACHE_DIR"
    rebuild |& tee "${HOME}/hp-rebuild-output1.txt"
    diff_to_pristine
    )
}

-q()
{
    quadpres_system_test "$@"
}

try_ncu()
{
    (
    set -e -x
    cd "$trunk"
    (
        cd node_modules/
        git clean -dfx .
    ) || true
    ncu --upgrade
    npm install
    rebuild |& tee "${HOME}/hp-rebuild-output1.txt"
    )
}

bleadperl_env()
{
    local _production="1"
    local _p="$1"
    shift
    if test "$_p" = "--noprod"
    then
        _production="0"
    fi
    (
        set -x
        unset PERL5LIB
        PATH="${HOME}/apps/perl/bleadperl/bin/:${PATH}"
        which perl
        rehash || true
        disable_local_lib
        __unmv()
        {
            local src="$1"
            shift
            local dest="$1"
            shift
            rm -fr "${src}"
            mv "${dest}" "${src}"
        }
        pdirs="${HOME}/perl5 ${HOME}/__bak-perl5"
        qdirs="${HOME}/apps/quadpres ${HOME}/apps/__bak-quadpres"
        wdirs="${HOME}/apps/wml-from-source ${HOME}/apps/__bak-wml-from-source"
        _apply()
        {
            local cmd="$1"
            shift
            "$cmd" $pdirs
            "$cmd" $qdirs
            "$cmd" $wdirs
        }
        if test "$_production" = "1"
        then
            _apply mv
            (
                deps-app plinst -i bin/required-modules.yml -i bin/common-required-deps.yml
                cpanm --notest https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git
                (
                    set -e
                    -t wml/itself
                    cd "$trunk"
                    git clean -dfx .
                    build
                ) || exit 1
                (
                    set -e
                    -t qp
                    cd "$trunk"
                    git clean -dfx .
                    __install
                ) || exit 1
                rebuild |& tee "${HOME}/hp-rebuild-output-bleadperl1.txt"
            )
        fi
        _apply __unmv
    )
}

delete_disk_caches()
{
    (
        set -e -x
        rm -fr "$QUAD_PRES_CACHE_DIR"
        rm -fr "$TIDYALL_DATA_DIR"
        rm -fr "$VNU_CACHE"
    )
}

PATH="$PATH:$HOME/apps/hypermail/bin"
# Commented out because it makes matters slower:
# export HTML_POST_INCS_DATA_DIR="$HOME/Arcs/temp/shlomif-homepage/shlomif-homepage-gezer.d"

# one can unset it.
# export SKIP_SPELL_CHECK=1
__add_to_path
