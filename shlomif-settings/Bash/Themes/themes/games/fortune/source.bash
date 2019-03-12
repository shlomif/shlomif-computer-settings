load_common bundle/git
load_common chdirs

remote_repo="$(_shlomif_github "fortune-mod")"
base="$HOME/progs/C/fortune-mod"
git_base="$base/git"
trunk="$git_base/fortune-mod"
this="$trunk/fortune-mod"
build="$git_base/B"

c="$this"
b="$build"

export FCS_USE_TEST_RUN=1

cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$git_base=$git_base" \
        "\$base=$base" \
        "~=$HOME"
}

t()
{
    (
        export HARNESS_BREAK=1
        if ! test -e "$build"
        then
            mkdir "$build"
        fi
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

proj_name='fortune'
