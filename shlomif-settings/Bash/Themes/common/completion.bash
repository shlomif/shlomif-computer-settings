__gvim_completion()
{
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -f -X '*~' -- "$cur" |
        grep -vE '(^|/)\.(svn|[^/]+\.swp)($|/)' )
        )
}

if test "$SHELL" = "/bin/bash" ; then
    complete -o filenames -F __gvim_completion gvim
fi
