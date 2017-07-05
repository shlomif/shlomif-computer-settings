export HARNESS_OPTIONS="j4:c" TEST_JOBS=4
cpan -i CPANPLUS && cpanp -i \
    Task::Sites::ShlomiFish \
    Task::FreecellSolver::Testing \
    Dist::Zilla::PluginBundle::SHLOMIF \
    Dist::Zilla::PluginBundle::Author::PERLANCAR \

