#!/bin/bash
perl ~/conf/trunk/shlomif-settings/home-bin-executables/bin/find-version-control-repositories | (while read l; do mr register "$l" ; done)
