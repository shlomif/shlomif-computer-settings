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
local prompt_common="[\$(__prompt_proj_name)\$(__prompt_branch)]:\$(prompt)\\$ "
if test -n "$BASH_VERSION"
then
    PS1="\\u${prompt_common}"
elif test -n "$ZSH_VERSION"
then
    setopt PROMPT_SUBST
    PS1="%n${prompt_common}"
fi
