#! /bin/bash
#
# code.bash
#
# Based on https://fedoraproject.org/w/index.php?title=QA:Testcase_kernel_regression&action=edit
# while disclaiming all rights on the changes.



__bash_sudo_setup()
{
    (
        set -x
        sudo dnf $SHLOMIF_DNF_OPTS -y install gcc git make libtirpc libtirpc-devel policycoreutils-python-utils python3-fedora
        sudo semanage boolean -m --on selinuxuser_execheap
    )
}

__clone()
{
    git clone https://pagure.io/kernel-tests.git
}

__config()
{
    cp config.example .config
    vim .config
}
# Look for lines with "'''submit='''" and "'''username='''" and set these settings to "submit=authenticated" and "username=<your FAS login without quotes>".

__run()
{
    sudo ./runtests.sh
    sudo ./runtests.sh -t performance
}

__restore()
{
    sudo semanage boolean -m --off selinuxuser_execheap
}
