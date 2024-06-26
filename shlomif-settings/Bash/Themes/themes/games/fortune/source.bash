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

__cmake()
{
    rm -fr CMakeCache.txt CMakeFiles || true
    cmake -DCMAKE_INSTALL_PREFIX="${SHLOMIF_FORTUNE_DIR:-$HOME/apps/to-del-fortune}" "$@" "$this"
}

build()
{
    (
        export HARNESS_BREAK=1
        create_build_dir
        cd "$build" && \
            __cmake && \
            make && \
            make install && \
            true
    )
}

b()
{
    build "$@"
}

__run_tests()
{
    for cmake_args in "" "-D USE_PCRE=TRUE"
    do
        (
        export HARNESS_BREAK=1
        export HARNESS_OPTIONS=j20:c
        create_build_dir
        cd "$build" && \
            __cmake $cmake_args && \
            make VERBOSE=1 && \
            make VERBOSE=1 check && \
            make VERBOSE=1 install && \
            true
        ) || break
    done
    n --msg "fortune Test Finished"
}

t()
{
    __run_tests "$@"
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

dup()
{
    git add -u
    git ci -m $'remove some copies of duplicates.\n\nThe same cookie existed in two different places ( possibly with small variations )'
}

cb()
{
    cd "$build"
}
