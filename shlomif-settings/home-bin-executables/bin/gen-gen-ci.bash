#! /bin/bash
#
# gen-gen-ci.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

set -e
set -x

d=''
for i in *
do
    if test -d "$i"
    then
        d="$i"
    fi
done

fn='.gen-ci.bash'
cat > "$fn" <<EOF
#! /bin/bash
#
# .gen-ci.bash
# Copyright (C) 2018 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

set -e
set -x
ci-generate --theme dzil --param 'subdirs=$d'
EOF

git add "$fn"
bash "$fn"
git add .travis.yml
