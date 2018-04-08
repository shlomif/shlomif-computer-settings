# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

unalias c

c()
{
    cat /sys/kernel/debug/dri/0/i915_gem_objects
}

unalias d

d()
{
    mkdir -p ~/i-logs
    while true ; do
        c > ~/i-logs/i915--"$(date +"%s")".txt
        sleep 2
    done
}
