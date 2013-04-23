load_common mymake
load_common completion
load_common prompt
load_common hg

base="$HOME/progs/wml/wml-itself"
core="$base/core"
hg_base="$core"
trunk="$core/conversion-to-cmake"
src="$trunk/src"
# this="$trunk/wml_backend/p2_mp4h"
# this="$trunk/wml_backend/p3_eperl"
# this="$trunk/src/wml_backend"
this="$src"

remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="website-meta-language")"
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

PS1="\\u[wml]:\$(prompt)\\$ "

PATH="$HOME/apps/test/wml/bin/:$PATH"

