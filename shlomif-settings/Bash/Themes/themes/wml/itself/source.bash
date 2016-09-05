load_common mymake
load_common completion
load_common prompt
load_common hg

base="$HOME/progs/wml/wml-itself"
core="$base/core"
hg_base="$core"
trunk="$core/trunk"
src="$trunk/src"
# this="$trunk/wml_backend/p2_mp4h"
# this="$trunk/wml_backend/p3_eperl"
# this="$trunk/src/wml_backend"
b="$trunk/B"
this="$b"

remote_repo="$(_shlomif_bitbucket "website-meta-language")"
cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$core=$core" \
        "\$base=$base" \
        "~=$HOME"
}

__ignore_cmake_gen_files()
{
    (cd "$trunk" ;
    for I in CMakeFiles cmake_install.cmake CMakeCache.txt ; do
        perl ~/bin/add-file-to-svn-ignore.pl "$I"
    done
    )
}

e()
{
    (cd "$this" ;
        gvim -p CMakeLists.txt ../p2_mp4h/CMakeLists.txt \
        Makefile.in configure.in
    )
}

t()
{
    (
        cd "$b"
        rm -fr tests/
        perl ../src/wml_test/run_test.pl
    )
}

proj_name='wml'

PATH="$HOME/apps/test/wml/bin/:$PATH"

