find . -name '*.jinja' | sort | perl -lnE 'use Path::Tiny qw/ path /; my $p=path($_); $d=$p->dirname;say $d;$t=path("../rejects/$d");say $t;$t->mkdir;system "git mv $p $t/";'
