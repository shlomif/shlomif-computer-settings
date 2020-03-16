download_and_install()
{
(
    set -e -x
    # p='pango'
    # vmaj=1.44
    # subv=7
    v="$vmaj.$subv"
    base="$p-$v"
    arc="$base.tar.${ext:-xz}"
    if test -n "$url_dir"
    then
        url="$url_dir/$arc"
    else
        url="${url:-https://ftp.gnome.org/pub/GNOME/sources/$p/$vmaj/$arc}"
    fi
    wget -c "$url"
    tar -xvf "$arc"
    cd "$base"
    if test "$buildsys" = "cpan"
    then
        cpanm .
    else
        mkdir -p "build"
        cd build
        meson -D libdir=lib ..
        ninja -j4
        sudo ninja -j4 install
        cd ..
    fi
    cd .. && rm -fr "$base"
)
}

install_tree_avl()
{
    p='Tree-AVL' vmaj=1 subv='077' ext=gz url_dir="https://www.cpan.org/modules/by-authors/id/M/MB/MBEEBE" buildsys=cpan download_and_install
}
