install_cpan_modules()
{
    (
        set -x
        while test "$#" -ge "1"
        do
            flag="$1"
            shift
            if test "$flag" = "--cpanm-bin-path"
            then
                cpanm_bin_path="$1"
                shift
            elif test "$flag" = "--cpan-bin-path"
            then
                cpan_bin_path="$1"
                shift
            else
                printf "Wrong flag '%s'!\\n" "$flag"
                exit 1
            fi
        done

        exe="cpanm"
        inst="App::cpanminus"
        install_flags=""
        install_task_flags='-q'

        unrecommended_check_for-cpanplus()
        {
            if test "$P" = "1"
            then
                exe="cpanp"
                inst="CPANPLUS"
                install_flags="i"
                install_task_flags=""
            fi
        }

        cpanm_()
        {
            ${cpanm_bin_path}/"$exe" $install_flags "$@"
        }
        install_task_()
        {
            cpanm_ $install_task_flags Task::BeLike::SHLOMIF
        }
        workaround_()
        {
            cpanm_ -vvvf Variable::Magic && \
                true
        }
        if test \( -z "${HARNESS_OPTIONS}" \) -o \( "${HARNESS_OPTIONS}" = "c" \)
        then
            HARNESS_OPTIONS="c:j12"
        fi
        export HARNESS_OPTIONS
        ${cpan_bin_path}/cpan -i ${inst} && \
            install_task_ || \
            (
                # See https://rt.cpan.org/Ticket/Display.html?id=92600
                unset HARNESS_OPTIONS
                set -e
                cpanm_ -vvv Cache::Cache
            ) && \
            cpanm_ -vvvf HTML::TreeBuilder::LibXML && \
            cpanm_ -vvvf Code::TidyAll && \
            install_task_
    ) && \
    true
}
