load_common completion
load_common hg

base="$HOME/progs/perl/www/Web-Cpan-Site/"
hg_base="$base"
trunk="$base/trunk"
site="$trunk/wml"

remote_repo='ssh://hg@bitbucket.org/shlomif/web-cpan-site'

this="$site"
cd "$this"

