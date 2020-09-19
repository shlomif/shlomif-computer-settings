proj_name='fortune'
load_common bundle/git
load_common chdirs
load_common data_caches

remote_repo="$(_shlomif_github "fortune-mod")"
base="$HOME/progs/C/fortune-mod"
git_base="$base/git"
trunk="$git_base/fortune-mod"
this="$trunk/fortune-mod"
build="$git_base/B"

c="$this"
b="$build"

export FCS_USE_TEST_RUN=1
export FORTUNE_TEST_TIDY=1

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$git_base=$git_base" \
        "\$base=$base" \
        "~=$HOME"
}

create_build_dir()
{
    if ! test -e "$build"
    then
        mkdir "$build"
    fi
}

build()
{
    (
        export HARNESS_BREAK=1
        create_build_dir
        cd "$build" && \
            cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/to-del-fortune" "$this" && \
            make && \
            make install
    )
}

b()
{
    build "$@"
}

t()
{
    (
        export HARNESS_BREAK=1
        create_build_dir
        cd "$build" && \
            cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/to-del-fortune" "$this" && \
            make && \
            make check
        n --msg "fortune Test Finished"
    )
}

# parallel-tests
pt()
{
( unset FCS_USE_TEST_RUN; t; )
}

real_tidyall="$(which tidyall)"

tidyall()
{
"$real_tidyall" --data-dir="$TIDYALL_DATA_DIR" "$@"
}
