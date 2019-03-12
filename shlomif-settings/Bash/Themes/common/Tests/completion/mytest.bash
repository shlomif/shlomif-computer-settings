#!/usr/bin/env bash
cat input.txt | perl -ne 'print unless m{(?:^|/)\.svn(?:$|/)}' > perl-output.txt
if ! cmp perl-output.txt expected-output.txt ; then
    echo "Perl is incorrect" 1>&2
    exit 1
fi
cat input.txt | grep -vE '(^|/)\.svn($|/)' > grep-output.txt
if ! cmp grep-output.txt expected-output.txt ; then
    echo "Perl is incorrect" 1>&2
    exit 1
fi
