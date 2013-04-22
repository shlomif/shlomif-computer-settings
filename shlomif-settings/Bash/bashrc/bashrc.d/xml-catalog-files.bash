homepage="$HOME/Docs/homepage/homepage/trunk"
htdocs_base="$HOME/Download/unpack/prog/web"
htdocs_cat="$htdocs_base/validator-1.1/htdocs/sgml-lib/catalog.xml"
export XML_CATALOG_FILES="$homepage/rng/catalog.xml $htdocs_cat /etc/xml/catalog"

if ! test -e "$htdocs_cat" ; then
    mkdir -p "$htdocs_base"
    cd "$htdocs_base"
    wget -c http://validator.w3.org/sgml-lib.tar.gz
    tar -xvf sgml-lib.tar.gz
fi
if ! test -e "$htdocs_cat" ; then
    echo "Cannot install '$htdocs_cat'" 1>&2
fi
