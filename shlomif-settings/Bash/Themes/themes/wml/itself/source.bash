load_common bundle/git
load_common chdirs

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

t()
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
    t "$@"
}

b()
{
    mkdir -p "$b"
    cd "$b"
    cmake -DCMAKE_INSTALL_PREFIX="$HOME/apps/test/wml" "$src" && \
        make -j4 && \
        make install
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

PATH="$HOME/apps/test/wml/bin/:$PATH:$pbyacc_dir"

if ! which pbyacc
then
    pushd "$(pwd)"
    cd "$core"
    deburl="http://deb.debian.org/debian/pool/main/p/$pbyacc_base"
    wget -c "$deburl/$pbyacc_tarball_bn"
    pbyacc_debian_tarball_bn="perl-byacc_2.0-8.debian.tar.xz"
    wget -c "$deburl/$pbyacc_debian_tarball_bn"
    tar -xvf "$pbyacc_tarball_bn"
    tar -xvf "$pbyacc_debian_tarball_bn"
    cd "$pbyacc_dir"
    patch -p1 < "../debian/patches/01-legacy.patch"
    make
    popd
    rehash > /dev/null 2>&1
fi
proj_name='wml'
export WML_TEST_BUILD=1 WML_TEST_TIDY=1 HARNESS_OPTIONS="j9:c"
export TIDYALL_DATA_DIR="$HOME/Backup/Arcs/wml-itself-tidyall.d"

