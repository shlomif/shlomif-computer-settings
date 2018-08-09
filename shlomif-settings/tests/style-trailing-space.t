#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

use Test::TrailingSpace 0.0201;

{
    my $finder = Test::TrailingSpace->new(
        {
            root => '.',
            filename_regex =>
qr/(?:(?:\.(?:bash|atom|c|cfg|cgi|cmake|conf|cook|cpp|css|desktop|dsl|dtd|ent|fo|ggr|h|hs|htm|ini|m|mak|markdown|md|ml|opml|pod|pov|quicktask|rb|rc|rng|Rss|sass|scm|sh|slides|spec|svg|t|tex|tt|ttml|txt|vim|wml|wmlrc|xsl|xslt|yaml|yml|t|pm|pl|PL|yml|json|(?:x?html)|wml|xml|js|mak))|README|Changes|Makefile)\z/,
            abs_path_prune_re => qr%
            \A(?:
            (?:
                shlomif-settings/vim-conf/dot-vim/
            ))
            %msx,
        },
    );

    # TEST
    $finder->no_trailing_space("No trailing space was found.");
}
