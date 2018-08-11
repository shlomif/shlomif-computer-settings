load_common mymake
load_common completion
load_common prompt
base="$HOME/progs/perl/cpan/MediaWiki/Parser"
trunk="$base/trunk"
__modules_dir="$trunk/modules"
module_dir="$__modules_dir/MediaWiki-Parser"
this="$module_dir"

__myctags()
{
    ( cd "$trunk"/build/build-tags && bash build-ctags.sh )
}

cd $this

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

e()
{
    (
        cd "$this" &&
            gvim \
                lib/MediaWiki/Parser.pm \
                lib/MediaWiki/Parser/State.pm \
                lib/MediaWiki/Parser/Token.pm \
                t/02-parse1.t
    )
}
