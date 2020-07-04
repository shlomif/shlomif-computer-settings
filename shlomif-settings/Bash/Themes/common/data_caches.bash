#!/usr/bin/env bash
#
# data_caches.bash
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under the terms of the MIT license.
#
temp_data_caches_base_dir="${temp_data_caches_base_dir:-$HOME/Arcs/temp/caches/projects/}"
temp_data_caches_project_dir="${temp_data_caches_project_dir:-$temp_data_caches_base_dir/$proj_name}"
if test -z "$TIDYALL_DATA_DIR"
then
    export TIDYALL_DATA_DIR="$temp_data_caches_project_dir/tidyall.d"
fi

if test -z "$VNU_CACHE"
then
    export VNU_CACHE="$temp_data_caches_project_dir/vnu-cache.json"
fi

if test -z "$LATEMP_SPELL_CACHE_DIR"
then
    export LATEMP_SPELL_CACHE_DIR="$temp_data_caches_project_dir/spelling-cache"
fi
mkdir -p "$LATEMP_SPELL_CACHE_DIR"
