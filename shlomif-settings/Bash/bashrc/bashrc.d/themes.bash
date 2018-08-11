__themes_dir="$HOME/conf/Bash/Themes"
. "$__themes_dir/Source-Me.bash"
# edit theme
et()
{
    gvim -p $(__this_theme_source ) "$@"
}
