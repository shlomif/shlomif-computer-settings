#! /usr/bin/env bash
#
# act-on-fedora.bash
#
# Based on https://github.com/nektos/act/issues/303#issuecomment-882069025
# - thanks!

set -x

systemctl enable --now --user podman.socket
systemctl start --user podman.socket
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock

set +x
