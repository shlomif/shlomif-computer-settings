proj_name='wml'
load_common bundle/git
load_common chdirs
load_common data_caches

export MAKEFLAGS='-j100'
base="$HOME/progs/wml/wml-itself"
core="$base/core"
git_base="$core"
trunk="$core/trunk"
src="$trunk/src"
# this="$trunk/wml_backend/p2_mp4h"
# this="$trunk/wml_backend/p3_eperl"
# this="$trunk/src/wml_backend"
b="$trunk/B"
this="$b"
pbyacc_base="perl-byacc"
pbyacc_ver="2.0"
pbyacc_basever="$pbyacc_base-$pbyacc_ver.orig"
pbyacc_tarball_bn="${pbyacc_base}_$pbyacc_ver.orig.tar.bz2"
pbyacc_dir="$core/$pbyacc_basever"

remote_repo="$(_thewml_github "website-meta-language")"
cd "$this"

prompt()
{
    __prompt_cmd \
        "\$trunk=$trunk" \
        "\$core=$core" \
        "\$base=$base" \
        "~=$HOME"
}

e()
{
    (cd "$this" ;
        gvim -p \
            ../src/wml_include/WML_Frontends/Wml/Runner.pm \
            ../src/wml_include/WML_Backends/IPP/Main.pm \

    )
}

run_tests()
{
    (
        mkdir -p "$b"
        cd "$b"
        rm -fr tests/
        perl "$src"/wml_test/run_test.pl
    )
}

pt()
{
    run_tests "$@"
}

t()
{
    run_tests "$@"
}

build()
{
    mkdir -p "$b"
    cd "$b"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$HOME/apps/wml-from-source" "$src" && \
        make -j4 && \
        make install
}

b()
{
    build "$@"
}

i()
{
    build "$@"
}

mi()
{
    build "$@"
}

fmt()
{
    (
        unset WML_TEST_BUILD
        t
    )
}

c()
{
    cd "$src"
}

PATH="$HOME/apps/wml-from-source/bin/:$PATH:$pbyacc_dir"
rehash > /dev/null 2>&1

if ! which pbyacc > /dev/null 2>&1
then
    pushd "$(pwd)"
    mkdir -p "$core"
    cd "$core"
    deburl="http://deb.debian.org/debian/pool/main/p/$pbyacc_base"
    wget -c "$deburl/$pbyacc_tarball_bn"
    pbyacc_debian_tarball_bn="perl-byacc_2.0-8.debian.tar.xz"
    wget -c "$deburl/$pbyacc_debian_tarball_bn"
    tar -xvf "$pbyacc_tarball_bn"
    tar -xvf "$pbyacc_debian_tarball_bn"
    cd "$pbyacc_dir"
    patch -p1 < "../debian/patches/01-legacy.patch"
    perl -pi -0777 -E 's/\A/\/\* unistd provides unlink() \*\/\n#include <unistd.h>\n\n/ms' main.c
    make
    popd
    rehash > /dev/null 2>&1
fi
export WML_TEST_BUILD=1 WML_TEST_TIDY=1 HARNESS_OPTIONS="j9:c"
