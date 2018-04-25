# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

export HARNESS_OPTIONS="j4:c" TEST_JOBS=4
cpan -i CPANPLUS && cpanp -i \
    Task::Sites::ShlomiFish \
    Task::FreecellSolver::Testing \
    Dist::Zilla::PluginBundle::SHLOMIF \
    Dist::Zilla::PluginBundle::Author::PERLANCAR \
