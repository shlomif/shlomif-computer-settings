#! /bin/bash
#
# gen-gen-ci.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

set -e
set -x

dd=''
for i in *
do
    if test -d "$i"
    then
        dd="$i"
    fi
done

d="${1:-$dd}"
shift || true

fn='.ci-gen.ini'
cat > "$fn" <<EOF
; .ci-gen.ini
; Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
;
; Distributed under terms of the MIT license.
;

theme = dzil

[param]
subdirs = $d
EOF

git add "$fn"
ci-generate
git add .appveyor.yml .travis.yml
