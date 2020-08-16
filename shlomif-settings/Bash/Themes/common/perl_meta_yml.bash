# perl_meta_yml.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.

__dist_name()
{
    (cd "$this" &&
        cat META.yml | perl -lnE 'say if s/^name: //'
    )
}

__version()
{
    (cd "$this" &&
        cat META.yml | perl -lnE 'say if s/^version: //'
    )
}

