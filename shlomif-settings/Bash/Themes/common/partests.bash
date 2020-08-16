# partests.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
export TEST_JOBS="$(nproc)"
export HARNESS_OPTIONS="j${TEST_JOBS}:c"
