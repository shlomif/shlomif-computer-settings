__berlios_https_url="https://svn.berlios.de/svnroot/repos"
__berlios_svnssh_url="svn+ssh://svn.berlios.de/svnroot/repos"

__BERLIOS_switch_to_svnssh()
{
    (
        cd "$trunk"
        svn switch --relocate "$__berlios_https_url" "$__berlios_svnssh_url"
    )
}

__BERLIOS_switch_to_https()
{
    (
        cd "$trunk"
        svn switch --relocate "$__berlios_svnssh_url" "$__berlios_https_url"
    )
}
