# edit_perl_lib.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.

__edit()
{
    (cd "$this" && gvim -p $(ack -f --sort lib/))
}

e()
{
    __edit "$@"
}
