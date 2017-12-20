homepage="$HOME/Docs/homepage/homepage/trunk"
htdocs_base="$HOME/Download/unpack/prog/web"
htdocs_b2="$htdocs_base/validator-1.1"
htdocs_cat="$htdocs_b2/htdocs/sgml-lib/catalog.xml"
export XML_CATALOG_FILES="$homepage/rng/catalog.xml $htdocs_cat /etc/xml/catalog"

if ! test -e "$htdocs_cat" ; then
    mkdir -p "$htdocs_base"
    cd "$htdocs_base"
    git clone "https://github.com/periapt/w3c-sgml-lib" "$htdocs_b2"
fi
if ! test -e "$htdocs_cat" ; then
    echo "Cannot install '$htdocs_cat'" 1>&2
fi

if false ; then
(
    db_xsl_ns_dir="$HOME/Download/unpack/file/docbook"
    db_xsl_ns_base="docbook-xsl-ns-snapshot"
    db_xsl_base="docbook-xsl-snapshot"
    db_xsl_ns_complete="$db_xsl_ns_dir/$db_xsl_ns_base"
    db_xsl_complete="$db_xsl_ns_dir/$db_xsl_base"

    if ! test -d "$db_xsl_ns_complete" ; then
        (
            mkdir -p "$db_xsl_ns_dir"
            cd "$db_xsl_ns_dir"
            wget -c http://snapshots.docbook.org/docbook-xsl-ns-snapshot.tar.bz2
            tar -xvf docbook-xsl-ns-snapshot.tar.bz2
            rm -f docbook-xsl-ns-snapshot.tar.bz2
            touch "$db_xsl_ns_complete"/.profile.incl
        )
    fi
    if ! test -d "$db_xsl_complete" ; then
        (
            mkdir -p "$db_xsl_ns_dir"
            cd "$db_xsl_ns_dir"
            wget -c http://snapshots.docbook.org/docbook-xsl-snapshot.tar.bz2
            tar -xvf docbook-xsl-snapshot.tar.bz2
            rm -f docbook-xsl-snapshot.tar.bz2
        )
    fi
)
fi
