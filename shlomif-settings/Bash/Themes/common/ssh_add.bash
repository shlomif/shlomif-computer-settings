__sa()
{
    ssh-add
    local f
    f="$HOME/.ssh/id_rsa_sh"
    if test -e "$f"
    then
        ssh-add "$f"
    fi
}

__sa
