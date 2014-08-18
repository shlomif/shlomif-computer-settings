all: /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Shlomif-Harness /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Run-CmdLine /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/backend/Test-Run-Plugin-ColorSummary /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/cmdline/Test-Run-CmdLine-Plugin-ColorSummary

/home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Shlomif-Harness: target1-step0

target1-step0: target1-step1
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Shlomif-Harness && make install)

target1-step1: target1-step2
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Shlomif-Harness && make test)

target1-step2: target1-step3
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Shlomif-Harness && make)

target1-step3: 
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Shlomif-Harness && perl Makefile.PL PREFIX="/home/shlomi/apps/perl/modules")

/home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Run-CmdLine: target2-step0

target2-step0: target2-step1
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Run-CmdLine && make install)

target2-step1: target2-step2
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Run-CmdLine && make test)

target2-step2: target2-step3
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Run-CmdLine && make)

target2-step3: 
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/Test-Run-CmdLine && perl Makefile.PL PREFIX="/home/shlomi/apps/perl/modules")

/home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/backend/Test-Run-Plugin-ColorSummary: target3-step0

target3-step0: target3-step1
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/backend/Test-Run-Plugin-ColorSummary && ./Build install prefix="/home/shlomi/apps/perl/modules")

target3-step1: target3-step2
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/backend/Test-Run-Plugin-ColorSummary && ./Build test)

target3-step2: target3-step3
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/backend/Test-Run-Plugin-ColorSummary && ./Build)

target3-step3: 
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/backend/Test-Run-Plugin-ColorSummary && perl Build.PL)

/home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/cmdline/Test-Run-CmdLine-Plugin-ColorSummary: target4-step0

target4-step0: target4-step1
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/cmdline/Test-Run-CmdLine-Plugin-ColorSummary && ./Build install prefix="/home/shlomi/apps/perl/modules")

target4-step1: target4-step2
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/cmdline/Test-Run-CmdLine-Plugin-ColorSummary && ./Build test)

target4-step2: target4-step3
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/cmdline/Test-Run-CmdLine-Plugin-ColorSummary && ./Build)

target4-step3: 
	(cd /home/shlomi/progs/perl/cpan/Test/Test-Harness/trunk/modules/plugins/cmdline/Test-Run-CmdLine-Plugin-ColorSummary && perl Build.PL)

