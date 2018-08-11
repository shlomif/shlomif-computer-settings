load_common mymake
load_common completion

base="/home/shlomi/progs/perl/cpan/SVN-Pusher"
trunk="$base/svn/trunk"
module="$trunk/module"
this="$module"

. "$HOME/conf/Bash/disable-usr-local-apps-svn.sh"

cd "$this"
