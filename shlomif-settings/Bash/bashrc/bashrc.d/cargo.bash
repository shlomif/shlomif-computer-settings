# cargo.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#

PATH="$HOME/.cargo/bin:$PATH"

if test -e "$HOME/.cargo/env"
then
    . "$HOME/.cargo/env"
fi
