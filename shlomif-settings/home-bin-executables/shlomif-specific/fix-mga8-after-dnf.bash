#
# fix-mga8-after-dnf.bash
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

(
-t rpm/mag
set -e -x
cd pango
force_u_rpms
cd ..

cd pulseaudio
force_u_rpms
cd ..
)
