load_common mymake
load_common completion
# load_common gen_patch

base="$HOME/progs/perl/www/Catalyst/WWW-Books-Tracker"
trunk="$base/trunk"
this="$trunk/catalyst"
rw_repos_url="http://localhost:8080/svn/books-tracker/"
read_repos_url="http://localhost:8080/svn/books-tracker/"

# Make sure that gvim's filename completion ignores filenames that it should
# not edit.


cd $this

