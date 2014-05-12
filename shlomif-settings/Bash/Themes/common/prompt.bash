__prompt_cmd()
{
    "$__themes_dir/common/prompt-cmd.pl" "$(pwd)" "$@"
}
__prompt_proj_name()
{
    echo -n "$proj_name"
}
__prompt_branch()
{
    echo -n ''
}
PS1="\\u[\$(__prompt_proj_name)\$(__prompt_branch)]:\$(prompt)\\$ "
