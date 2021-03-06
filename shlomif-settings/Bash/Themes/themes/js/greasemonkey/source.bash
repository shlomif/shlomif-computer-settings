load_common bundle/git
load_common chdirs

base=~/progs/JS/browser-userscripts/
trunk="$base"
this="$trunk/greasemonkey-scripts"
remote_repo="$(_shlomif_github "browser-userscripts")"

PATH="$PATH:$this/node_modules/.bin"
cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$base=$base" \
        "~=$HOME"
}

up()
{
    (
        set -e -x
        cd "$this"
        sky up arrow-keys-for-accesskey.user.js
        sky up metacpan-arrowkeys.user.js
        sky up validate-key.user.js
   )
}

t()
{
    (cd "$this" && make -j4 test)
}

proj_name='grease'
