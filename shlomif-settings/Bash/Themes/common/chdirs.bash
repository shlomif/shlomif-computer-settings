# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.

c()
{
    cd "$this"
}

cb()
{
    cd "$b"
}

__cd_trunk()
{
    cd "$trunk"
}

ct()
{
    __cd_trunk "$@"
}
