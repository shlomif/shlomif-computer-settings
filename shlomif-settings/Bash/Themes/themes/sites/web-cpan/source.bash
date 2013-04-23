load_common completion
load_common hg

base="$HOME/progs/perl/www/Web-Cpan-Site/"
hg_base="$base"
trunk="$base/trunk"
site="$trunk/wml"

remote_repo="$($__themes_dir/common/bitbucket-hg-remote-repo.pl --user="shlomif" --repo="web-cpan-site")"

this="$site"
cd "$this"

