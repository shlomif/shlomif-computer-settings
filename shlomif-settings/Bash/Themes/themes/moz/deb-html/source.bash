load_common bundle/inc1
load_common github
load_common ctags_all_langs

base="$HOME/Download/unpack/firefox"
trunk="$base/debugger.html"
module="$trunk"
this="$module"

git_remote_shlomif="$(_shlomif_github "debugger.html")"
git_remote_devtools='https://github.com/firefox-devtools/debugger.git'

cd "$this"

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
        git remote add upstream "$git_remote_devtools"
    )
}

y()
{
    local cmd="$1"
    shift
    if test "$cmd" = 'i' ; then
        yarn install "$@"
    elif test "$cmd" = 's'; then
        yarn start "$@"
    elif test "$cmd" = 't'; then
        yarn test "$@"
    elif test "$cmd" = 'rt'; then
        yarn run test:all "$@"
    elif test "$cmd" = 'f'; then
        yarn run firefox -- --location 'http://localhost/shlomif/fc-solve-temp/'
    else
        yarn "$cmd" "$@"
    fi
}

proj_name='debugger.html'
PATH="$trunk/node_modules/.bin:$PATH:/usr/sbin"
