load_common mymake
load_common completion
load_common prompt
load_common no_implicit_make
load_common git

remote_repo="$(_shlomif_github "fortune-mod")"
base="$HOME/progs/C/fortune-mod"
git_base="$base/git"
trunk="$git_base/fortune-mod"
this="$trunk"
build="$git_base/B"

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

find_ids()
{
    (
        cd "$c_src"
        local cmd='ruby ../scripts/find-ids.rb *.[ch] */*.[ch] patsolve-shlomif/patsolve/*.[ch] > ids.txt'
        echo "$cmd"
        eval "$cmd"
    )
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
            cmake "$trunk" && \
            make && \
            perl "$trunk"/run-tests.pl --src-dir="$trunk"
        n --msg "Freecell Solver Test Finished"
    )
}

# parallel-tests
pt()
{
    ( unset FCS_USE_TEST_RUN; t; )
}

make()
{
    if [ "$*" = "pgo" ]; then
        `which make` VERBOSE=1 "$@"
    else
        `which make` "$@"
    fi
}

_dzil_inst()
{
    (
        cd "$ai_path" && \
            dzil test --release && \
            dzil install --install-command='bash ~/conf/build/perl/install-to-apps-perl-modules.sh'
    )
}

c()
{
    cd "$c"
}

cb()
{
    cd "$b"
}

i()
{
    cd "$i"
}

cdp()
{
    cd "$pats"
}

pb()
{
    cd "$pats_b"
}

proj_name='fortune'
