load_common mymake
load_common completion
load_common prompt

base="$HOME/progs/perl/www/NNTP-Iface"
trunk="$base/trunk"
modules_dir="$trunk/modules"
this="$modules_dir/CGI-Application-NetNewsIface"

inst_modules_dir="$HOME/apps/perl/modules"
modules_makefile="${__themes_dir}/themes/$__theme/Modules.mak"

prompt()
{
    __prompt_cmd "\$trunk=$trunk" "\$base=$base" "~=$HOME"
}

PS1="\\u:\$(prompt)\\$ "
cd $this
