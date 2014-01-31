#!/bin/bash

if ! test -e MANIFEST ; then
    echo "Error! MANIFEST file not found." 1>&2
    exit 1
fi

sort_manifest()
{
    cat MANIFEST | sort | uniq > MANIFEST.new
    mv -f MANIFEST.new MANIFEST
}

# TODO :
# Lots of exactly duplicate code here - refactor.
if svn info > /dev/null 2>&1 ; then
    svn st |
        grep '^A' |
        sed 's!^A[ +]*!!' |
        perl -nle 'print if -f' \
        >> MANIFEST
    sort_manifest
elif svk info > /dev/null 2>&1 ; then
    svk diff -X -s |
        grep '^A' |
        sed 's!^A[ +]*!!' |
        perl -nle 'print if -f' \
        >> MANIFEST
    sort_manifest
else
    echo "Error! It doesn't seem to be a legal working copy" 1>&2
    exit 1
fi

