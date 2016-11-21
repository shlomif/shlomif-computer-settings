load_common mymake
load_common completion
load_common prompt
load_common github

base="$HOME/Download/unpack/firefox"
trunk="$base/debugger.html"
module="$trunk"
this="$module"

git_remote_shlomif="$(_shlomif_github "debugger.html")"
git_remote_devtools='https://github.com/devtools-html/debugger.html.git'

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.

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

setup()
{
    (
        mkdir -p "$base"
        cd "$base"
        git clone "$git_remote_shlomif"
        cd "$trunk"
        git remote add ingy "$git_remote_devtools"
    )
}

y()
{
    local cmd="$1"
    shift
    if test "$cmd" = 'i' ; then
        yarn install "$@"
    elif test "$cmd" = 't'; then
        yarn test "$@"
    elif test "$cmd" = 'rt'; then
        yarn run test-all "$@"
    else
        yarn "$cmd" "$@"
    fi
}

proj_name='debugger.html'

