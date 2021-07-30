# use
# sudo eatmydata bash myapt.bash
set -e -x
apt update
apt-fast -y --no-install-recommends install $(apt list --upgradable | grep -v task | tail -100 | perl -lapE 's#/.*##')
