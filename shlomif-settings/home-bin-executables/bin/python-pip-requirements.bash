#! /usr/bin/env bash
#
# req.bash
# Copyright (C) 2021 Shlomi Fish < https://www.shlomifish.org/ >
#
# Distributed under the terms of the MIT license.
#

# Set the requirements file to update: requirements-dev.txt or requirements-doc.txt
target_requirements=requirements_dev.txt

# mkvirtualenv pynwb-requirements

# Install updated requirements
pip install -U -r $target_requirements

# If relevant, you could pip install new requirements now
# pip install -U <name-of-new-requirement>

# Check for any conflicts in installed packages
# pip check

# Update list of pinned requirements
pip freeze > $target_requirements

    if false
    then
deactivate
rmvirtualenv pynwb-requirements
    fi
