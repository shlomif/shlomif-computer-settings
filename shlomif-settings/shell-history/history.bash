( . ~/bin/Dev-Path-Configs-Source-Me.bash && make )
( PATH=/home/shlomif/apps/python3/bin:$PATH ; export LD_LIBRARY_PATH=/home/shlomif/apps/python3/lib ; time python3 collect-stats.py 0fc-log.txt )
( b ; n --msg bm ) 2>&1 | tee ~/curl.bm.txt
( set -x ; export GIMPGITBUILD__BUILD_GIMP_USING_MESON=0 ; gimpgitbuild build ; notifier notify -m "gimp build" ) |& tee ~/gimpgitbuild-try-gnuautotools.txt
( set -x ; export GIMPGITBUILD__BUILD_GIMP_USING_MESON=0 GIMPGITBUILD__PAR_JOBS_FLAGS='-j8' ; gimpgitbuild build ; notifier notify -m "gimp build" ) |& tee ~/gimpgitbuild-try1.txt
( time make test ) 2>&1 | tee -a /home/shlomif/desk-time-oldpysol.txt
(git clone git@github.com:thewml/website-meta-language.git w && (cd w && mkdir b && cd b && cmake ../src && make) && rm -fr w )
(unset MAKEFLAGS; gmake test )
(unset MAKEFLAGS; gmake)
-l
-p
-s
-t 0fc
-t 3fc
-t better-scm
-t cognitive
-t dotfiles
-t euler
-t fcs
-t games/abc-path
-t games/black-hole
-t games/fortune
-t games/kpat
-t games/pysol
-t gimp/core
-t homepage
-t inkscape
-t nvim
-t perl/6
-t perl/begin
-t perl/core
-t perl/docmake
-t perl/ffo
-t perl/golf
-t perl/inifiles
-t perl/stats
-t perl/xml/libxml
-t prog/faq
-t qp
-t rinutils
-t rpm/mag
-t signature
-t sys/backup
-t sys/cleanup
-t todo
-t vim/begin
-t vlc
-t wml/cookie
-t wml/itself
-t wml/latemp
-t xml/fiction
. ../scripts/split-fcc-SOURCE-ME.bash
. ../scripts/test-regressions.bash
. ./run-me.bash
. /home/shlomif/conf/build/KDE/kdegames5-trunk-all-debug.sh ../kpat
. /home/shlomif/conf/build/pidgin.sh
. /home/shlomif/q.sh
. bin/db4db5.bash
. bin/spell.bash
. build.sh
. conf/trunk/shlomif-settings/home-bin-executables/shlomif-specific/fix-mga8-after-dnf.bash
. par-Source-Me.bash
. ~/bin/Dev-Path-Configs-Source-Me.bash
. ~/conf/trunk/shlomif-settings/home-bin-executables/bin/bitbucket-hg-to-git--source-me.bash
. ~/conf/trunk/shlomif-settings/home-bin-executables/bin/magpie-update-multiple.bash
. ~/h.bash
../board_gen/make_pysol_freecell_board.py -t 6240 freecell | /home/shlomif/progs/freecell/git/fc-solve/fc-solve/B/fc-solve -g freecell -l qs -fif 5 --flares-choice fcpro -p -t -sam \
../c-solver/Tatzer -l n2b --prefix=/home/shlomif/apps/test/bhs
../scripts/Tatzer
../scripts/Tatzer --break-back-compat-1
../scripts/Tatzer --fc-only --zero-freecells-mode --nfc=0
../scripts/Tatzer -l extra_speed2
../scripts/Tatzer -l n2b
../scripts/Tatzer -l n2t
../scripts/Tatzer -l n2t -p OBT
../source/Tatzer
../source/Tatzer --break-back-compat-1
../source/Tatzer -l extra_speed2
../source/Tatzer -l n2b
../source/Tatzer -l n2t
./Build
./Build disttest
./Build manifest
./Build test
./a.out
./arcanist/bin/arc diff
./arcanist/bin/arc diff master
./autogen.sh
./autotests/SolverFormatTest
./bin/kpat
./bin/kpat --start 1 --end 830910836 --solve Spider
./black-hole-solve --game golf --display-boards --rank-reach-prune --wrap-ranks boards/golf906.board | gvim -
./black-hole-solve --game golf --display-boards --rank-reach-prune ../Games-Solitaire-BlackHole-Solver/t/data/35.golf.board.txt
./bootstrap
./bwbasic fizz-buzz.bas
./bwbasic fizz-buzz.bas | gvim -
./configure
./configure --help
./dbm_fc_solver --offload-dir-path offl/ 11982.board
./e
./e451.exe 3-1000
./euler383_v3.exe
./fc-solve --read-from-file l.txt
./fc-solve -l cpb 24.board
./fc-solve -l ve 24.board
./fc-solve -s -i -to 0AB --freecells-num 0 24.board
./fc-solve 24.board
./freecell-solver-fork-solve 1 5000 1000 -l lg && echo goo
./freecell-solver-multi-thread-solve 1 10000000 1000 --num-workers 4 -l lg -mi 200000
./freecell-solver-multi-thread-solve 1 32000 400 -l lg
./freecell-solver-range-parallel-solve 1 1000 1 --freecells-num 0 -s -i -p -t -sam -mi 100000 --st-name nat -sp r:tf | tee ~/new.txt
./gen-helpers
./gen-helpers && -p
./gen-helpers.pl
./gen-shlomif-sig
./kpat
./kpat --start 1 --end 1000000 --solve Golf
./kpat --start 830910836 --end 830910836 --solve 3 | cat
./multi-bhs-solver --game golf --display-boards --rank-reach-prune boards/golf2.board
./node_modules/.bin/tsc abc-path.ts | gvim -
./perl -e 's((?{my sub f})())00'
./refresh
./scripts/code.sh
./snaptile.py
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 316-v1.py
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 396-v1.py
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 650/650-v1.py
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 gen_divs.py
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 gen_divs.py | tee -a o.txt
/home/shlomif/Download/unpack/prog/vscode/scripts/code.sh src/js/fcs-validate.ts
/home/shlomif/Download/unpack/to-del/bookmarks-manager/node_modules/.bin/web-ext run -s .
/home/shlomif/apps/KDE-dolphin/bin/dolphin /home/music/Music/mp3s/
/home/shlomif/apps/ff/64/firefox/firefox -no-remote 'https://www.shlomifish.org/fc-solve-temp/js-fc-solve/automated-tests/?alert=1'
/home/shlomif/apps/ff/66-nightly/firefox/firefox -no-remote 'https://www.shlomifish.org/fc-solve-temp/js-fc-solve/automated-tests/?alert=1'
/home/shlomif/apps/graphics/gimp-devel/bin/gimp-2.99
/home/shlomif/apps/julia-1.1.0/bin/julia -O2 506-v1.jl
/home/shlomif/apps/julia-1.1.0/bin/julia 506-v1.jl
/home/shlomif/apps/julia-1.1.0/bin/julia 506-v1.jl | head
/home/shlomif/apps/julia-1.1.0/bin/julia 506-v1.jl | less
/home/shlomif/apps/julia-1.1.0/bin/julia 512-v2.jl
/home/shlomif/apps/julia-1.1.0/bin/julia 658/e658_v3.jl
/home/shlomif/apps/julia-1.1.0/bin/julia 658/e658_v3.jl | tee -a jlog2.txt | timestamper
/home/shlomif/apps/julia-1.1.0/bin/julia 658/e658_v3.jl | tee -a jlog3.txt
/home/shlomif/apps/julia-1.1.0/bin/julia 658/e658_v3.jl | tee -a jlog3.txt | timestamper
/home/shlomif/apps/julia-1.1.0/bin/julia 658/e658_v3.jl | tee -a jlog4.txt
/home/shlomif/apps/julia-1.1.0/bin/julia e658_v4.jl
/home/shlomif/apps/perl/bleadperl-debug/bin/cpanp -i HTML::Widgets::NavMenu::ToJSON
/home/shlomif/apps/perl/bleadperl-debug/bin/cpanp -i Task::BeLike::SHLOMIF
/home/shlomif/apps/perl/bleadperl/bin/cpan5.29.9 -i Task::BeLike::SHLOMIF
/home/shlomif/apps/perl/bleadperl/bin/cpanp -i Task::BeLike::SHLOMIF
/opt/kde5-trunk/bin/kpat
/opt/vlc-3.0/inkscape-trunk/bin/inkscape
/usr/bin/time ./freecell-solver-range-parallel-solve 1 3200 100 --method random-dfs -to '[0123467j]=seq()' -sp r:tf -mi 100000
/usr/bin/time bin/rebuild
/usr/bin/time perl "$c_src"/run-tests.pl --glob='{clang-format,perltidy,py-flake8,style-trailing-space}*.t'\
/usr/bin/time perl bin/process.pl
1
80_chars_ruler
CFLAGS="-g" pypy3 setup.py install --force
Cancel_reminder
FCS_TEST_BUILD=1 t
FCS_TEST_SHELL=1 perl ../source/run-tests.pl
L
MIN=22 perl ../scripts/multi_config_tests.pl ; n --msg 'fcs test'
NODE_PATH="`pwd`"/lib/for-node/js /usr/bin/node `which qunit-cli` lib/for-node/test-code.js
NODE_PATH="`pwd`"/lib/for-node/js node `which qunit` lib/for-node/test-code-emcc.js\
NODE_PATH="`pwd`"/lib/for-node/js node `which qunit` lib/for-node/test-code.js 2>&1 | gvim -
NODE_PATH="`pwd`"/lib/for-node/js node inspect `which qunit` lib/for-node/test-code-emcc.js\
NODE_PATH="`pwd`"/lib/for-node/js node lib/for-node/test-code.js
NODE_PATH="`pwd`"/lib/for-node/js qunit lib/for-node/test-code-emcc.js
NODE_PATH="`pwd`"/lib/for-node/js qunit lib/for-node/test-code-emcc.js\
NODE_PATH="`pwd`"/lib/for-node/js qunit lib/for-node/test-code.js
NODE_PATH="`pwd`"/lib/for-node/js qunit-cli lib/for-node/test-code-emcc.js
NODE_PATH="`pwd`"/lib/for-node/js qunit-cli lib/for-node/test-code.js | gvim -
PATH+=:$PWD
PATH+=:/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin
PATH+=:/home/shlomif/Download/unpack/prog/python/pypy3.6-7.1.1-beta-linux_x86_64-portable/bin/
PATH+=:/home/shlomif/Download/unpack/prog/python/pypy3.6-v7.3.0-linux64/bin
PATH+=:/home/shlomif/apps/perl6-rakudo/bin
PATH="/home/shlomif/apps/golang/bin:/home/shlomif/.local/bin:/home/shlomif/apps/test/wml/bin:$PATH"
PYTHONPATH="`pwd`/src:$PWD" /home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 Tests/validate-html-using-vnu.py
PYTHONPATH="`pwd`/src:$PWD" python3 Tests/validate-html-using-vnu.py
PYTHONPATH="`pwd`/tests/lib:$PWD" python2 -mpdb tests/unit-generated/test__pysol_tests.scorpion_canMove__v3.py
PYTHONPATH="`pwd`/tests/lib:$PWD" python3 -mpdb tests/unit-generated/test__pysol_tests.scorpion_canMove__v3.py
PYTHONPATH="`pwd`/tests/lib:$PWD" python3 tests/unit-generated/test__pysol_tests.scorpion_canMove__v3.py
SKIP_EMCC=1 NODE_PATH="`pwd`"/lib/for-node/js qunit lib/for-node/test-code-emcc.js
V=1 bash /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/shlomif-specific/mr-register-all.bash
VirtualBox
WD=awe startx
WD=cin startx
WD=gnome startx
WD=jwm startx
WD=lxde startx
WD=xfce startx
\df
__myctags
a
a=/home/shlomif/Backup/Arcs/sites--perl-begin-post-dest/post-incs-reduced/links/index.html ; b=/home/shlomif/Backup/Arcs/sites--perl-begin-post-dest/this-incs-reduced/links/index.html ; cmp $a $b ; gvimdiff <(cut -b 1-5000000 -n $a) <(cut -b 1-5000000 -n $b) +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
a=`pwd`
a=dest/about.html ; cmp $a ../$a ; gvimdiff $a ../$a +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
a=dest/uses/qa/index.html; cmp $a ../$a ; gvimdiff $a ../$a +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
a=dest/uses/text-generation/index.html; cmp $a ../$a ; gvimdiff $a ../$a +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
ack --sort "\\bchar\\b" > ~/char.txt
ack -f
ack -h '^<h2_sect' | sort | uniq -c | sort -n
ack href=\"\\./'[^"]' dest/pre-incs/t2 | gvim -
ag ' $'
ag '[ \t]$'
ag -g index.html.wml t2
ag -g wml src
ag -l '\(\(\(inclu' post-dest/
ag rarr
ah
alias p='git push'
alias s='svn st'
an
autoreconf -s -i
b
b && t
b && t ; n
b ; n
b ; n --msg bm
ba
bash
bash --rcfile build.sh
bash --rcfile shlomif-build.sh
bash -c "export FCS_PATH=\"$b\"; export FCS_SRC_PATH=\"$c_src\"; time make -j4 -f par.mak"
bash -c 'rm -f ../foo/*'
bash -x /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/bin/sync-all-gits.bash
bash -x bin/install-npm-deps.sh
bash -x ~/f.sh
bash ../scripts/Bench-SS-Range.bash
bash ../scripts/c-subroutine-metrics-line-count.bash
bash ../scripts/fuzz-build.bash
bash ../scripts/fuzz-build.bash g
bash ../scripts/fuzz-build.bash g ; n -m fuzz
bash ../scripts/golf-bench-2.bash
bash ../scripts/golf-bench-3.bash | tee have.txt
bash ../scripts/golf-pat-perl-range-solve.bash
bash ../scripts/mint-new-release.bash ; n
bash ../scripts/mint-new-release.bash ; n -m 'fcs build'
bash ../scripts/mint-new-release.bash ; n -m 'new fcs release'
bash ../scripts/split-fcc--all-in-one.bash
bash ../scripts/test-regressions.bash
bash .gen-ci.bash
bash /home/shlomif/Backup/Arcs/backup.bash
bash /home/shlomif/Docs/homepage/homepage/trunk/bin/link-checker-for-shlomifish.org.bash
bash /home/shlomif/conf/build/KDE/kdegames5-trunk-all-debug.sh ../kpat
bash /home/shlomif/conf/build/gimp-git-all-deps.bash
bash /home/shlomif/conf/build/gplugin.sh
bash /home/shlomif/conf/build/perl/dzil-install.bash
bash /home/shlomif/conf/build/perl/install-to-apps-perl-modules.sh
bash /home/shlomif/conf/build/pidgin.sh
bash /home/shlomif/conf/build/vim.sh
bash /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/bin/gen-gen-ci.bash
bash /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/bin/trim-installed-rpms.bash
bash /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/shlomif-specific/reddit11-11.bash
bash /home/shlomif/progs/freecell/git/fc-solve/fc-solve/scripts/validate-html-using-vnu.bash dest
bash 492-v1-test1.bash
bash 658/par.bash | timestamper
bash 658/par2.bash | timestamper | tee -a ts2.txt
bash 660/660_v2-wrap.bash
bash 660/summmarize.bash
bash Install.bash
bash SPLIT_FCC/by-depth/2/active/AAAAAAAAAAAAAAAARA==/driver.bash
bash SPLIT_FCC/by-depth/3/active/AAAAAAAAAAAAAAABFA==/driver.bash
bash analyze.bash
bash analyze.bash | gvim -
bash bin/copy-web-fc-solve.bash
bash bin/install-npm-deps.sh
bash bin/link-checker-for-shlomifish.org.bash
bash bin/rebuild
bash bin/tot.bash
bash client.bash
bash conf/build/gimp-git-all-deps.bash
bash download-gtest.sh
bash filt.bash
bash fr.bash
bash fr.bash 2>l
bash gen_list.sh
bash h.bash
bash mix.bash
bash myrsync.bash
bash pgo.sh
bash rakudo-git.bash
bash run-me.bash
bash run-me.bash | less
bash run.bash
bash scripts/repack-min-cardsets.bash
bash shlomif-build.sh ; n -m icu2
bash shlomif-settings/home-bin-executables/bin/cpan-authors-distribution-counts.bash
bash shlomif-settings/home-bin-executables/bin/cpan-shlomif-list-distributions.bash
bash solve-more-3.bash | commify | timestamper
bash solve-more-6-gnupar.bash
bash t.bash
bash test.bash
bash update.sh
bash vendu-deploy-1.bash
bash ~/bin/backup-total.sh ; bash ~/bin/backup-extra-data.sh ; bash ~/bin/backup-total.sh ; bash ~/bin/backup-extra-data.sh ; n --msg "Backup finished"
bash ~/bin/backup-total.sh ; bash ~/bin/backup-extra-data.sh ; bash ~/bin/backup-total.sh ; bash ~/bin/backup-extra-data.sh ; n --msg "Backup finished"\
bash ~/bin/backup-total.sh ; n --msg "Backup finished"
bash ~/conf/trunk/shlomif-settings/home-bin-executables/bin/gen-gen-ci.bash
bash ~/conf/trunk/shlomif-settings/home-bin-executables/shlomif-specific/merge-prereqs-yml.bash
bash ~/conf/trunk/shlomif-settings/home-bin-executables/shlomif-specific/reddit11-11.bash
bash ~/h.sh
bat *.time
bat LICENSE
bat README.md
bat f
bat log.txt
bat weaver.ini
bd
bg
bin/spell-checker-iface > foo.txt
bm -l -p
bm -l -s
bm -s
bpat
buildbot start master
bundle exec bin/validate
c
c7
ca
caddy 2020-calendar.pl
caddy XorShift128Plus.pl 2>&1 | gvim -
caddy XorShift128Plus.py
caddy XorShift128Plus.py | less
caddy base-2-to-36.pl6
cargo build
cargo install
cargo test
cat .gitignore | perl -lpE 's#^/#ls #' | bash -e
cat /etc/resolv.conf
cat abstract.txt
cat f
cat foo.txt
cb
ccache -C
cd
cd $a
cd $arcs
cd $homepage
cd $mag_base
cd $this
cd -
cd .
cd ..
cd ../
cd ../..
cd ../../
cd ../../..
cd ../b
cd ../build-1
cd ../docs
cd ../extensions
cd ../scripts
cd .config
cd /home/shlomif/Docs/homepage/homepage/trunk/../_trunk--clones/
cd /home/shlomif/progs/freecell/extern/Solitairey/
cd 0fc-b
cd 2018
cd 2018/
cd 451
cd 492
cd 6
cd 655
cd 658
cd 660
cd 662
cd 665
cd 685
cd App-Deps-Verify/
cd App-gimpgitbuild
cd Arcs
cd B
cd BUILD
cd Backup
cd Backup/
cd Backup/Arcs
cd Desktop
cd Docs
cd Docs/Notes/Passwords
cd Docs/programming/irc/freenode-##programming/faq/FreenodesprogrammingWiki
cd Docs/programming/what-i-learned-from-porting-to-freebsd
cd Download/Arcs
cd Download/Arcs/ISOs
cd Download/Arcs/ISOs/mageia-beta
cd Download/Docs/Books/
cd Download/Video
cd Download/Video/
cd Download/unpack/
cd Download/unpack/kde/kdegames/git/kpat/
cd Download/unpack/kernel/from-git/linux
cd Download/unpack/office/gnumeric/
cd Download/unpack/perl/cpan/to-del/html-tidy5/
cd Download/unpack/prog/c
cd Download/unpack/to-del
cd Download/unpack/to-del/
cd Download/unpack/to-del/GitTutoring
cd Download/unpack/to-del/amigojapan.github.io/
cd Download/unpack/web-sites/awesome-opensource-israel
cd Games-Solitaire-BlackHole-Solver
cd Music/mp3s
cd PySolFC
cd SOURCES
cd Solitairey
cd VirtualBox\ VMs
cd XorShift128Plus
cd apps
cd apps/
cd b
cd bin
cd bin/
cd bin/private
cd bin/shlom.in-redirect
cd build
cd conf/trunk/
cd dest
cd disk-fs
cd english
cd extensions
cd extra-data
cd fc-solve/docs
cd git
cd hg
cd js
cd kpat
cd lib/blogs/shlomif-tech-diary
cd lib/repos/Solitairey
cd lib/repos/my-real-person-fan-fiction
cd lib/repos/putting-cards-2019-2020
cd lib/repos/shlomif-tech-diary
cd m
cd neovim
cd neovim-qt
cd perl
cd perl-byacc-2.0.orig
cd pidgin
cd primesieve-python
cd progs
cd progs/JS/greasemonkey-scripts/
cd progs/perl/cpan/
cd progs/perl/cpan/App/App-gimpgitbuild
cd progs/perl/snippets
cd progs/wml/Latemp/cookiecutter--shlomif-latemp-sites/\{\{cookiecutter.project_slug\}\}/
cd pysolfc-web-site/
cd rinutils
cd s
cd shlomif-settings
cd shlomif-settings/
cd site
cd site-assets
cd src
cd src/
cd t
cd to-del
cd todel
cd todel/
cd trunk
cd valgrind/
cd webwml
cd wml
cd wml-2.18.0
cd wml/
cd wml_include
cd wrapper
cd wrapper/
cdown-to 12:00:00 ; n --msg "12:00 meds"
cdown-to 12:00:00 ; n -m "12:00 medication"
cdown-to 18:09:40 ; n --msg "11:11 on #Reddit"
cdp
chromium-browser
chromium-browser 'http://localhost/shlomif/temp-Solitairey/dest/'
chromium-browser 'https://www.shlomifish.org/fc-solve-temp/js-fc-solve/automated-tests/'
chromium-browser --user-data-dir=del"$a"/ https://www.shlomifish.org/fc-solve-temp/js-fc-solve/text/ ; let ++a
chromium-browser https://www.shlomifish.org/fc-solve-temp/js-fc-solve/text/
ci
ci -m '- Add BRs'
ci -m '- New version'
ci -m '- Rebuild for new perl 5.28.0'
ci -m '- Rebuild for new perl'
ci -m '- Rebuild for python3 3.7'
ci -m '- add BRs'
ci -m '- fix reqs'
ci -m 'SILENT: add BRs'
ci -m 'SILENT: fix build'
ci -m 'add BRs'
ci -m 'add deps'
ci -m 'add docs'
ci -m 'mageiaify'
ci -m fix
ci-generate
civ
clang++ -Weverything -O3 -march=native -flto -fwhole-program e451-quasisphere.cpp
clang++ -Weverything -O3 -march=native -flto -fwhole-program e662-james-rauen.cpp -Ofast
clang-format -i ../source/board_gen/make_multi_boards.c
clang-format -i 492-v2-helper1.c
claws-mail
cloc
cmake -DFCS_DISABLE_DEBONDT_DELTA_STATES=1 ../source/
cmake -DWITH_BH_SOLVER=1 -DCMAKE_BUILD_TYPE=Debug ../kpat
cmake -DWITH_GOLF_SOLVER= -DCMAKE_BUILD_TYPE=Release ../kpat
cmake -DWITH_GOLF_SOLVER=1 -DCMAKE_BUILD_TYPE=Release ../kpat
cmake .
cmake ..
cmake ../source
cmake ../src
cmp dest/web-forums/index.html ../dest/web-forums/index.html
conf
coo PySolFC
coo cppcheck
coo curl
coo freecell-solver
coo libuv
coo pylint
coo wml
coo xterm
countdown 1000 ; sub
cp -a dest ..
cp -a dest/ ..
cp -a dest/ ~
cp -a dest/post-incs/t2/lecture/Perl/Lightning d
cp -a post-dest/ ~/Backup/Arcs/post-dest/
cp ../../../Selina-Mandrake/selina-mandrake/screenplay/tests/valid-html-tidy.t tests/
cp ../Star-Trek--We-the-Living-Dead/.gen-ci.bash .
cp ./pidgin/libpurple/protocols/facebook/.libs/libfacebook.so ~/.purple/plugins/
cp /home/shlomif/progs/perl/cpan/git/Module-Format/Module-Format/.tidyallrc .
cp installer/tests/perl/t/data/p4n5-copy/all-in/index.html installer/tests/perl/t/data/p4n5-copy/all-in/index.foo.xhtml && sky up installer/tests/perl/t/data/p4n5-copy/all-in/index.foo.xhtml
cpan -i HTML::T5
cpan-upload HTML-T5-0.001.tar.gz
cpan2pkg App::SerializeUtils
cpandb --CPAN /home/shlomif/Download/Arcs/Perl/minicpan/ --cpanid PERLANCAR | gvim -
cpandb --CPAN /home/shlomif/Download/Arcs/Perl/minicpan/ --cpanid SHLOMIF | gvim -
cpanm .
cpanp -i App::cpanminus
cpanp -i Task::BeLike::SHLOMIF ; n -m cpan
cppcheck . > g
cs
csv2chart
ct
ctags -R .
ctest -V -R svgz
cv
cython-3 *.pyx
d
date
date +%s
date +%s.%N
date ; date +%s
delta
deps-app commands
deps-app plinst -i bin/required-modules.yml -i bin/common-required-deps.yml
depth_run 0
depth_run 1
df
df -i
did
diff -u -r ../dest/ dest | gvim -
diff -u -r dest ../dest/ | gvim -
diff -u -r dest /home/shlomif/dest | gvim -
diff -u -r ~/Backup/Arcs/post-dest/post-dest/ post-dest/ | gvim -
diff -u j j2 | gvim -
diff -u j2 j | less
disp
docker rm fcsfed
docker stop fcsfed
dolphin .
dolphin /home/shlomif/Download/unpack/graphics/inkscape/extensions/tests/
dolphin /mnt/music/Music/dosd-mp3s /mnt/music/Music/mp3s /mnt/music/Music/shlomif-Download/
dolphin ~/Music/dosd-mp3s/ ~/Music/mp3s/ ~/Download/Video/
du *
du -a . | sort -h
du -ah . | sort -h
du -h .
du -h . | sort -h
du -ha . | sort -h
du -s *
du -s * | sort -h
du -s .
du -sh *
du -sh * | sort -h
du .
du . | sort -h
du .git
du /tmp | sort -h
du parts
dzil authordeps | xargs cpan -i
dzil build
dzil install
dzil release
dzil test
dzil test --all
dzil test --all ; n
e
echo $HARNESS_OPTIONS
echo $PATH
echo $PERL5LIB
emsdk install latest
emsdk list
emsdk list | head -20
env | grep PERL
eo
eslint -c .eslintrc.yml src/js/solitaire.js
eslint -c .eslintrc.yml src/js/solver-freecell.js
eslint src/js/solver-freecell.js
et
eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
eval $(ssh-agent)
ex
export $(dbus-launch)
export CC=/home/shlomif/apps/prog/gcc-9.2.0/bin/gcc CXX=/home/shlomif/apps/prog/gcc-9.2.0/bin/g++
export CC=/home/shlomif/bin/clang CXX=/home/shlomif/bin/clang++ FCS_CLANG=1
export DISPLAY=:1
export EMSDK_ENV=/home/shlomif/Download/unpack/prog/llvm-to-js/emsdk/emsdk_env.sh
export HARNESS_OPTIONS=c
export HARNESS_OPTIONS=j4:c
export HARNESS_VERBOSE=1
export LD_LIBRARY_PATH=/opt/vlc-3.0/pango-dev/lib64/ ; pidgin
export MAKEFLAGS="-j4"
export MAKEFLAGS="-r"
export MAKEFLAGS='-r'
export NOTIFIER_TO=lap
export NOTIFIER_TO=sh
export NUM_CPUS=2
export PATH="$PATH:/home/shlomif/.local/bin:$PWD"
export PATH="$PWD/node_modules/.bin:$PATH"
export PATH="/home/shlomif/.local/bin:/home/shlomif/apps/test/wml/bin:$PATH"
export PATH="/home/shlomif/apps/golang/bin:/home/shlomif/.local/bin:/home/shlomif/apps/test/wml/bin:$PATH"
export PATH=$HOME/apps/latemp/bin:$PATH
export VIMSYNT=1
export XZ_OPT="-T4"
f
f 1
f 2
f() { "$1" -l cpb 24.board } ; gvimdiff <(f fc-solve ) <(f ./fc-solve)
fd
fd \\.html ./d | xargs rename .html .xhtml
fd txt t2 | xargs touch
fd wml src | xargs gvim -p
fd wml t2 | sort > o
fedpkg local
fg
find
find . -name '*.so'
find . -name .git | xargs dirname | perl -nlE 'say unless -f "$_/.travis.yml"' | sort
find . -name home
find ../dest-xh -name '*.html' | xargs rename .html .xhtml
find dest/pre-incs/t2 -regex '.*\.x?html' | grep -vF -e philosophy/by-others/sscce -e WebMetaLecture/slides/examples -e homesteading/catb-heb -e t2/catb-heb.html | perl -lpe 's=\A(?:./)?dest/pre-incs/t2/?==' | grep -vE '^humour/fortunes' | APPLY_TEXTS=1 xargs perl -d:NYTProf bin/post-incs-v2.pl --mode=minify --minifier-conf=bin/html-min-cli-config-file.conf --texts-dir=lib/ads --source-dir=dest/pre-incs/t2 --dest-dir=dest/post-incs/t2 --
find | wc -l
finish-server
firefox
firefox -no-remote
firefox -no-remote 'http://localhost/shlomif/temp-Solitairey/dest/'
firefox -no-remote -profilemanager
firefox README.md
firefox http://www.shlomifish.org/Files/files/code/arrow-keys-for-accesskey.user.js
flake8 .
flake8 . | perl -lpE 's/:.*//' | uniq | xargs gvim -p
fmt
fmt && pt
fmt && t
for i in $(seq 1 30); do echo "line$i"; done
for i in $(seq 1 40); do echo "line$i"; done
for i in python-* ; do qv python3-${i#python-} ; done
force_u_rpms
fortune
fortune -c
fortune computers
fortune shlomif-shlomif
fortune shlomif-shlomif-fav
freecell-solver-range-parallel-solve 1 320000000 1 -l lg
g
g++ -O3 -march=native -flto -fwhole-program ecnerwala-e654.cpp
g++ -Wall -Wextra -O3 -march=native -flto -fwhole-program 660/e660-jfirester.cpp
g++ -Wall -Wextra -g 665_v1.cpp
g++ -g 665_v1.cpp
g++ -o e -Wall -Wextra -O3 -march=native -flto -fwhole-program 665-verify.cpp
g++ -o e.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program from-forum--rng_58.cpp
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program 663_v1.cpp -Ofast
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program e451-quasisphere.cpp
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program e451_v1.cpp
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program e662-james-rauen.cpp
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program e662-james-rauen.cpp -Ofast
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program e663-pwild.cpp -Ofast
g++ -o inc.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program 483-v3.cpp -lgmp -lgmpxx
g++ 665-verify.cpp
gcc -Wall -Wextra -O3 -march=native -flto -fwhole-program 492-v2-helper1.c
gdb --command=h.gdb ./fc-solve
gdb --command=~/cmds.gdb ./kpat
gdb -args ./black-hole-solve --game black_hole --display-boards --rank-reach-prune ../c-solver/t/data/26464608654870335080.bh.board.txt
gdb -args ./fc-solve --load-config video-editing -mi 1271 -p -t -sam -sel <(pi-make-microsoft-freecell-board -t 7186)
gdb -args python3 -m trace --trace ../../source/t/t/several-iter-limits.py
gdb -args python3 ../../source/t/t/several-iter-limits.py
gdb ./bin/drag-and-drop-svgz
gdb ./gdl/.libs/lt-test-dock
gdb ./kpat
gdb /opt/vlc-3.0/inkscape-trunk/bin/inkscape
gedit
gedit emo.txt
gedit ~/emo.txt
genf
gentags
get-telegram
get_nums | summary
ghc -O2 mniip.hs
gimp
gimpgitbuild build ; n -m "gimp build"
git
git add .gen-ci.bash
git add .gitignore
git add .tidyallrc
git add .travis.bash .travis.yml bin/install-tidyp-systemwide.bash .gen-ci.bash
git add .travis.yml
git add LICENSE
git add Makefile
git add README.md
git add bin/install-tidyp-systemwide.bash
git add tests/valid-html-tidy.t
git ai
git am --continue
git au
git au .
git bisect good
git branch -l
git branch -l -a
git ci
git ci -F add-more-to-log-commit-msg.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/POD-order-of-NAME-and-VERSION-sections.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/add-README-or-LICENSE.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/add-ci-gen-travis-yml.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/add-missing-deps-to-ci.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/add-travis-yml.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/avoid-predeclarations.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/convert-var-to-slot.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/dir-manifest.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/extract-a-class.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/extract-a-module.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/extract-common-expr-into-var.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/extract-method.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/fix-deps.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/fix-grammar.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/fix-indent.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/fix-markup-valid.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/hebrew-spelling-fix.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/move-to-cookiecutter-latemp.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/refactoring.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/remove-unused-var.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/rename-vars.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/reproducible-builds.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/semantic-markup.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/update-ci-gen-travis-yml.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/update-gitignore.txt
git ci -m 'CSS tweak'
git ci -m 'Convert a page to tt2'
git ci -m 'Convert pages to tt2'
git ci -m 'add a commit msg'
git ci -m 'add a test'
git ci -m 'add checks'
git ci -m 'add docs'
git ci -m 'add more to 701'
git ci -m 'add more'
git ci -m 'add test'
git ci -m 'add to gitignore'
git ci -m 'add translation'
git ci -m 'appveyor failure isolate/trim ; cmake'
git ci -m 'appveyor failure isolate/trim'
git ci -m 'appveyor isolate'
git ci -m 'bump version'
git ci -m 'c99 stdbool'
git ci -m 'cleanups'
git ci -m 'consolidate diffs w master'
git ci -m 'convert from wml to template toolkit'
git ci -m 'convert more pages to (x)html5'
git ci -m 'convert more pages to x/html5'
git ci -m 'convert to @shlomif'
git ci -m 'css fix'
git ci -m 'css tweaks - fortunes'
git ci -m 'css tweaks - mobile devices'
git ci -m 'debug emcc'
git ci -m 'debug emcc' .
git ci -m 'enable more warnings'
git ci -m 'eslint'
git ci -m 'fix build'
git ci -m 'fix deps; apt no recommends'
git ci -m 'fix for new perltidy'
git ci -m 'fix formatting'
git ci -m 'fix tests'
git ci -m 'fix'
git ci -m 'fixes'
git ci -m 'flake8-import-order compliance'
git ci -m 'from bitbucket-hg to github due to sunsetting'
git ci -m 'html/css tweaks'
git ci -m 'html5 semantic markup'
git ci -m 'jpeg2webp'
git ci -m 'made the license more github friendly'
git ci -m 'make portable - freebsd'
git ci -m 'make portable'
git ci -m 'make the html5 markup more semantic'
git ci -m 'merge some delta_states code'
git ci -m 'more cleanups: avoid braindead portability'
git ci -m 'more cleanups: avoid checking for portable stuff'
git ci -m 'more cleanups: generated a file'
git ci -m 'more convert away from wml'
git ci -m 'move away'
git ci -m 'move to cookiecutter'
git ci -m 'new release'
git ci -m 'optimisation'
git ci -m 'optimization'
git ci -m 'optimize'
git ci -m 'package.json'
git ci -m 'perltidy'
git ci -m 'progress'
git ci -m 'reduce more'
git ci -m 'refactor resume()'
git ci -m 'refactor'
git ci -m 'refactor: step toward get rid of eval'
git ci -m 'refactoring of the ci scripts'
git ci -m 'refactoring'
git ci -m 'remove old and unneeded'
git ci -m 'remove old&unused wml-related code'
git ci -m 'remove old'
git ci -m 'remove unused'
git ci -m 'reproducible builds'
git ci -m 'split unneeded deps for fastrender'
git ci -m 'still reproducing leak'
git ci -m 'tidyall'
git ci -m 'travis debug'
git ci -m 'travis xenial'
git ci -m 'travis: fix #1 - add dep'
git ci -m 'travis: fix'
git ci -m 'try debug for appveyor'
git ci -m 'ui/ux and css tweaks'
git ci -m 'update'
git ci -m 'use POST-incs instead of PRE-incs'
git ci -m 'validate more'
git ci -m 'win32 porting'
git ci -m fix
git ci -m fixes
git ci -m optimize
git ci -m refactor
git ci -t ~/conf/trunk/shlomif-settings/git/commit-messages/add-missing-deps-to-ci.txt
git ci -t ~/conf/trunk/shlomif-settings/git/commit-messages/convert-var-to-slot.txt
git ci -t ~/conf/trunk/shlomif-settings/git/commit-messages/extract-method.txt
git ci -t ~/conf/trunk/shlomif-settings/git/commit-messages/refactoring.txt
git ci .
git ci .travis.yml
git ci shlomif-settings/Bash/
git ci shlomif-settings/build-scripts/
git ci shlomif-settings/vim-conf/
git clean -dxf .
git clean -dxf ..
git clean -dxf lib/cache/
git clean -dxf lib/docbook/
git clean -dxf lib/docbook/5/
git clean -dxf lib/presentations/qp/
git clean -dxf lib/presentations/qp/Website-Meta-Lecture/
git clean -dxf lib/presentations/spork/
git clean -dxf lib/screenplay-xml/
git clean -dxf t2
git cnt
git co -b pr1
git co .
git co ..
git co ../../
git co elim-clang-warnings
git co fc-solve--deal-and-sol--preview
git co fix-tests
git co index.html
git co master
git co update-rand-gen
git co use-template-toolkit
git co web-fc-solve--animated-display
git co wml2tt
git com
git dh
git dh > ~/g1.diff
git dh shlomif-settings/Bash/
git dh | gvim -
git dh | less
git dhs
git di
git di --stat master
git di --stat releases/wml-2.18.0..master
git di fee560f | gvim -
git di master
git di master | gvim -
git format-patch -1
git hub
git hub apply-pr 1
git hub apply-pr 2
git hub create
git hub diff 60be69f90cd1d89f16bd60e0cc75bddd846eb891 master
git hub diff master master
git hub fork
git hub help
git i
git init .
git log
git log --stat
git log --stat | gvim -
git log --stat | less
git log -p
git log -p . | less
git log -p > ~/g.log
git log -p | gvim -
git log -p | head -1000 | gvim -
git log -p | less
git log .
git log . | less
git ls
git ls .
git ls | gvim -
git ls | xargs -n1 basename | sort | gvim -
git ls-files t2 | grep wml | xargs touch
git ls-files t2/humour/bits/facts/ | grep wml | xargs touch
git mv README README.md
git mv t/tests/* t/
git p
git pull --rebase origin master
git pull --rebase upstream master
git push
git push --all
git push --tags
git push -f
git push -u origin master
git push origin
git push shlomif
git push upstream
git pushu
git rebase --continue
git rebase --skip
git rebase -i master
git rebase master
git remote -v
git remote rm origin
git reset .
git rm -r inc
git rm -r inc/
git rm MANIFEST
git rm abstract.txt
git s o
git s u
git s u blead
git show
git show | less
git st
git st -s
git st -s -u
git stash
git stash apply
git stash clear
git stash drop
git stash list
git stash pop
git submodule update --init --recursive
git tag
git tag -l
gmake
gmake fastrender
gmake test
go build
go get -u github.com/tdewolff/minify/cmd/minify
go run main.go
gp 483-v2.pari
grep -F found ../l4.txt
grep -F found l1.txt
grep -F found l2.txt
gringotts
gvim
gvim $(__this_theme_source )
gvim +"mak VERBOSE=1"
gvim +"mak clean" +"mak"
gvim +Ack\ \'href=\"\\./'[^"\\#]'\'\ dest
gvim +mak
gvim -S a.sess
gvim -o $homepage/lib/make/main.mak lib/make/main.mak
gvim -o $homepage/lib/sass/style.scss lib/sass/style.scss
gvim -o .tidyallrc /home/shlomif/progs/perl/cpan/App/Sky/git/Sky-uploader/App-Sky/.tidyallrc
gvim -o .travis.yml /home/shlomif/Docs/homepage/homepage/trunk/.travis.yml
gvim -o .travis.yml /home/shlomif/Download/unpack/games/pysolfc/git/PySolFC/.travis.yml
gvim -o .travis.yml /home/shlomif/progs/freecell/git/fc-solve/.travis.yml
gvim -o /home/shlomif/*.time
gvim -o /home/shlomif/Docs/homepage/homepage/trunk/.travis.yml .travis.yml
gvim -o /home/shlomif/got1*.time
gvim -o 658/e658_v3.jl 658/658_v1.py
gvim -o README.md $homepage/t2/open-source/resources/israel/list-of-projects/index.xhtml.wml
gvim -o TheWML/Backends/*/Main.pm
gvim -o dist.ini /home/shlomif/progs/games/abc-path/trunk/abc-path/Games-ABC_Path-Solver/dist.ini
gvim -o dist.ini /home/shlomif/progs/perl/cpan/App/Sky/git/Sky-uploader/App-Sky/dist.ini
gvim -o dist.ini /home/shlomif/progs/perl/cpan/Dir/Manifest/Dir-Manifest/p5/Dir-Manifest/dist.ini
gvim -o dist.ini Changes
gvim -o gen-helpers /home/shlomif/Docs/homepage/homepage/trunk/gen-helpers
gvim -o lib/App/HTML/PostProc/Gezer.pm
gvim -o lib/hunspell/whitelist1.txt Tests/valid-html-tidy.t
gvim -o lib/hunspell/whitelist1.txt Tests/valid-html-tidy.t Tests/gmake-unit.t
gvim -o lib/hunspell/whitelist1.txt foo.txt y.txt
gvim -o lib/latemp/themes/sf.org1/template.wml lib/driver.wml
gvim -o lib/make/main.mak $homepage/lib/make/main.mak
gvim -o lib/sass/common-style.sass lib/sass/style.sass t2/index.xhtml.wml dest/post-incs/t2/index.xhtml
gvim -o lib/sass/common-style.scss lib/sass/style.scss t2/humour/TOWTF/index.xhtml.wml dest/post-incs/t2/humour/TOWTF/index.xhtml
gvim -o lib/sass/common-style.scss lib/sass/style.scss t2/meta/FAQ/index.xhtml.wml
gvim -o lib/sgml/shlomif-docbook/docbook-epub-preproc.xslt /usr/share/sgml/docbook/xsl-ns-stylesheets/epub/docbook.xsl
gvim -o src/js/fcs-validate.ts src/js/web-fc-solve-tests--fcs-validate.ts
gvim -o src/js/web-fc-solve.ts src/js/web-fc-solve-ui.ts
gvim -o y.txt lib/hunspell/whitelist1.txt
gvim -p t2/lecture/Pres-Tools/Perl-Point/slide00*.htm
gvim ../../docs/Freecell-Solver--Evolution-of-a-C-Program/text/fcs-book.xml
gvim ../../scripts/Makefile.to-javascript.mak
gvim ../.appveyor.yml
gvim ../c-solver/CMakeLists.txt
gvim ../c-solver/black_hole_solver.c
gvim ../scripts/TEST_OPTIMIZATIONS/cm-mod1.sh
gvim ../scripts/check-max-iters.pl
gvim ../scripts/fuzz-build.p6
gvim ../scripts/golf-pat-perl-range-solve.bash
gvim ../scripts/multi_config_tests.pl
gvim ../scripts/prepare-self-contained-dbm-etc-solvers-packages-for-hpc-machines/PrepareCommon.pm
gvim ../scripts/split-fcc--all-in-one.bash
gvim ../scripts/test-regressions.bash
gvim ../source/CMakeLists.txt
gvim ../source/Tatzer
gvim ../source/lib.c
gvim ../source/main_cl_callback_common.h
gvim ../source/t/t/fc-solve-output.t
gvim ../src/wml_test/run_test.pl
gvim ../src/wml_test/t/12-wml-params-conf.t
gvim .appveyor.cmd
gvim .appveyor.yml
gvim .ci-gen.ini
gvim .eslintrc.yml
gvim .gen-ci.bash
gvim .gitignore
gvim .hg/hgrc
gvim .travis.bash
gvim .travis.yml
gvim .vimrc
gvim .zshrc
gvim /home/shlomif/conf/build/pidgin.sh
gvim /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/bin/dnf-py-scan.bash
gvim 316-v1.py
gvim 630-v1.py
gvim 654_v1.py
gvim 657/657_v1.py
gvim 658/658_v1.py
gvim 658/e657.py
gvim 662_v1.py
gvim 665_v1.py
gvim CHANGELOG.rst
gvim CI-testing/continuous-integration-testing.pl
gvim CMakeLists.txt
gvim CONTRIBUTING.md
gvim ChangeLog
gvim Changes
gvim Docs/Notes/Passwords/steam-games-password.txt
gvim FAQ.mdwn
gvim HACKING.asciidoc
gvim LICENSE
gvim MANIFEST
gvim MANIFEST.SKIP
gvim META6.json
gvim Makefile
gvim Makefile.PL
gvim NEWS.asciidoc
gvim Number.java
gvim README
gvim README.asciidoc
gvim README.md
gvim Rakefile
gvim TODO.quicktask
gvim Tatzer
gvim Tests/content-docbook5-toc.t
gvim Tests/gmake-unit.t
gvim Tests/node-qunit-wrapper.t
gvim Tests/spell-check--hebrew.t
gvim Tests/spell-check.t
gvim Tests/style-trailing-space.t
gvim Tests/tidyall.t
gvim Tests/valid-html-tidy--5.t
gvim Tests/valid-html-tidy.t
gvim Tests/valid-xml.t
gvim Tests/validate-html-using-vnu.py
gvim XorShift128Plus.pl
gvim about-supporting-older-perl5-releases.pod
gvim apply-solve-more-3-log.pl
gvim bin/ci-generate
gvim bin/clean-up-docbook-xhtml-1.1.xslt
gvim bin/fix-spork.pl
gvim bin/gen-docbook-make-helpers.pl
gvim bin/gen-helpers-main.pl
gvim bin/gen-rpm-for-build-deps
gvim bin/gen-sect-nav-menus.pl
gvim bin/git-info
gvim bin/html-min-cli-config-file.conf
gvim bin/nav-data-as-json
gvim bin/post-incs-v2.pl
gvim bin/post-incs.pl
gvim bin/private/backup-exclude-list.txt
gvim bin/private/backup-extra-exclude-list-for-rsync.net.txt
gvim bin/process.pl
gvim bin/rebuild
gvim bin/rel-links-parse.pl
gvim bin/render
gvim bin/render-source.pl
gvim bin/render_v2-proto.pl
gvim bin/required-modules.yml
gvim bin/tot.bash
gvim bin/travis-ci-script.bash
gvim bin/tt-render.pl
gvim black_hole_solver.c
gvim blocks.tt2
gvim board_gen/gen-multiple-pysol-layouts.py
gvim board_gen/make_pysol_freecell_board.py
gvim build.sh
gvim content/2018/shlomif-if_pyth-cookbook.md
gvim d
gvim dealer.cpp
gvim debondt-compact-freecell-positions--document.asciidoc
gvim dest/index.html
gvim dest/js/qunit.js
gvim dest/post-incs/t2/css/materialize.min.css
gvim dest/pre-incs/t2/humour/TheEnemy/The-Enemy-Hebrew-v7.html
gvim diff.diff
gvim dist.ini
gvim e662-james-rauen.cpp
gvim euler-156-v2.pl
gvim euler-248-v1.py
gvim euler_474_v1.py
gvim f.json
gvim fcs_arch_doc.xml
gvim foo.txt
gvim fr.bash
gvim freecell.c
gvim gen-helpers
gvim generate_html.js
gvim gleitkommafreundefixed.pl
gvim h.bash
gvim human-hacking-field-guide-v2--english.db5.xml
gvim index.erb
gvim index.html
gvim installer/tests/perl/t/html-correctness.t
gvim instance.h
gvim irc.log
gvim irc2.log
gvim j
gvim l
gvim lib.c
gvim lib/App/Deps/Verify.pm
gvim lib/App/Git/Info.pm
gvim lib/App/HTML/PostProc/Gezer.pm
gvim lib/App/XML/DocBook/Docmake.pm
gvim lib/App/rshasum.pm
gvim lib/CI/Gen.pm6
gvim lib/Dir/Manifest.pm
gvim lib/Games/Solitaire/BlackHole/Solver/Golf/App.pm
gvim lib/Inc/proj_euler.wml
gvim lib/MyNavData.pm
gvim lib/NavDataRender.pm
gvim lib/Shlomif/Spelling/FindFiles.pm
gvim lib/Test/PerlTidy.pm
gvim lib/babel/js/web-fc-solve-tests.js
gvim lib/docbook/5/indiv-nodes/rindolf-spec/index.xhtml
gvim lib/docbook/5/xml/putting-cards-on-the-table-2019-2020.xml
gvim lib/driver.wml
gvim lib/factoids/gen-html.pl
gvim lib/factoids/shlomif-factoids-lists.xml
gvim lib/hunspell/whitelist1.txt
gvim lib/latemp/themes/sf.org1/template.wml
gvim lib/local-defs.wml
gvim lib/make/docbook/sf-homepage-db-gen.tt
gvim lib/make/main.mak
gvim lib/notes/quality-software--followup-2018.md
gvim lib/repos/Solitairey/src/js/application.js
gvim lib/repos/putting-cards-2019-2020/shlomif-putting-cards-on-the-table-2019-2020.docbook5.xml
gvim lib/rest-of-template.wml
gvim lib/sass/common-style.sass
gvim lib/sass/fortunes.scss
gvim lib/sass/style.sass
gvim lib/sass/style.scss
gvim lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-common.xsl
gvim lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-onechunk.xsl
gvim log.txt
gvim m.txt +cbuf
gvim m.txt +cbuf +cope
gvim main_cl_callback_common.h
gvim metacpan-arrowkeys.user.js
gvim mniip.hs
gvim myrsync.bash
gvim new-universal-solitaire-solutions-standard-format-proposal-v0.1.1.asciidoc
gvim o.txt
gvim package-lock.json
gvim patsolve/abstract_fc_solve_solver.cpp
gvim perl5/Shlomif/Quad/Pres/CmdLine.pm
gvim primesieve/array/_array.cpp
gvim primesieve/array/_array.pyx
gvim pysollib/hint.py
gvim rakefile
gvim rpm-qa.txt
gvim run-tests.pl
gvim scripts/all_games.py
gvim scripts/gen_individual_importing_tests.py
gvim setup
gvim setup.py
gvim shlom.in-refer.pl
gvim shlomif-settings/setup-all/setup-all.pl
gvim shlomif-sig-quotes.txt
gvim solve-more-3-log.txt
gvim solve-more-3.bash
gvim solve-more-4-log.txt
gvim solve-more-7-log.txt
gvim src/charts/fc-pro--4fc-deals-solvability--report/index.html.wml
gvim src/charts/fc-pro--4fc-intractable-deals--report/chart-using-flot.ts
gvim src/docs/this-site-is-irrelevant/index.html.wml
gvim src/download.html.wml
gvim src/faq.html.wml
gvim src/humour/index.html.wml
gvim src/index.html.wml
gvim src/js-fc-solve/automated-tests/index.html.wml
gvim src/js-fc-solve/automated-tests/my_htaccess.conf
gvim src/js-fc-solve/text/index.html.wml
gvim src/js/auto-tests-driver.js
gvim src/js/fcs-base-ui.ts
gvim src/js/find-fc-deal-ui.ts
gvim src/js/solver-freecell.js
gvim src/js/web-fc-solve--expand-moves.ts
gvim src/js/web-fc-solve-tests.ts
gvim src/js/web-fc-solve-ui.ts
gvim src/js/web-fc-solve.ts
gvim src/meta/FAQ/index.xhtml.tt2
gvim src/my_htaccess.conf
gvim src/uses/databases/index.html.tt2
gvim src/vnu_validator/__init__.py
gvim src/wml_test/run_test.pl
gvim state.c
gvim sums_of_powers.py
gvim svn.log
gvim t
gvim t/01-basic.t
gvim t/01-use.t
gvim t/black-hole-output.t
gvim t/lib/Code/TidyAll/Plugin/ClangFormat.pm
gvim t/module.t
gvim t/sort.t
gvim t2/art/index.xhtml.wml
gvim t2/humour/Selina-Mandrake/index.xhtml.wml
gvim t2/humour/fortunes/sharp-programming.xml
gvim t2/humour/fortunes/show.cgi
gvim t2/index.xhtml.wml
gvim t2/me/contact-me/index.xhtml.wml
gvim t2/me/rindolf/index.xhtml.wml
gvim t2/meta/FAQ/index.html.wml
gvim t2/meta/FAQ/index.xhtml.wml
gvim t2/open-source/projects/Spark/mission/index.xhtml.wml
gvim t2/open-source/resources/graphics-programs/index.xhtml.wml
gvim t2/open-source/resources/software-tools/index.xhtml.wml
gvim t2/personal.html.wml
gvim t2/philosophy/philosophy/putting-all-cards-on-the-table-2013/index.xhtml.wml
gvim tech-diary.xhtml
gvim templates/index.html
gvim test.js
gvim tests/valid-html-tidy.t
gvim threaded_range_solver.c
gvim tslint.json
gvim ver.txt
gvim w.st
gvim weaver.ini
gvim wml_aux/iselect/CMakeLists.txt
gvim wml_test/run_test.pl
gvim wml_test/t/03-p3_eperl.t
gvim wml_test/t/wml-stdin.t
gvim wrapper/Makefile
gvim wrapper/src/icu-with-prepost.js
gvim wrapper/src/usearch_wrapper.c
gvim y.txt
gvim ~/.gitconfig
gvim ~/.vimrc
gvim ~/char.txt +cbuf +cope
gvim ~/conf/trunk/shlomif-settings/home-bin-executables/bin/gen-gen-ci.bash
gvim ~/f
gvim ~/inkscape-ext-tests.txt
gvim ~/mageia-perl-magpie-modules-list.txt
gvim ~/o.txt
gvimdiff $homepage/bin/gen-sect-nav-menus.pl bin/gen-sect-nav-menus.pl
gvimdiff /tmp/exp.txt /tmp/got4.txt
gvimdiff 1.txt 2.txt
gvimdiff <(pi-make-microsoft-freecell-board -t 830910836 | fc-solve --load-config video-editing -p -t -sam -sel -mi 200000 | tail) <(pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -p -t -sam -sel -mi 200000 | tail)
gvimdiff bad--solve-more-7-log.txt solve-more-7-log.txt
gvimdiff black_hole_solver_main.c black_hole_solver_resume_api_main.c
gvimdiff delta_states_debondt_impl.h delta_states_impl.h
gvimdiff dest/web-forums/index.html ../dest/web-forums/index.html
gvimdiff dest/web-forums/index.html ../dest/web-forums/index.html +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
gvimdiff j j2
gvimdiff src/js-fc-solve/find-deal/index.html.wml src/js-fc-solve/text/index.html.wml
gwenview
gwenview .
gwenview Screenshot_20181109_184254.png
gwenview dest/images/fedora-logo.min.svg
gwenview f.svg
gwenview termtosvg_k3fbrw0s.svg
h
hc
hebrew-keymap.sh
help set
hexchat
hg ci -m 'add more'
hg ci -m 'dzil'
hg ci -m 'mark items as done'
hg clean --all
hg clean --all .
hg di
hg paths
hg pull
hg push
hg push git
hg push git:../git
hg st
hg up
history
hm
hostname
html-minifier dest/pre-incs/t2/humour/index.xhtml 2>&1 | less
htop
i
i=0; while bash SPLIT_FCC/by-depth/2/active/AAAAAAAAAAAAAAAARA==/driver.bash ; do let i++ ; done ; echo $i
i=0; while bash SPLIT_FCC/by-depth/3/active/AAAAAAAAAAAAAAABFA==/driver.bash ; do let i++ ; done ; echo $i
ifconfig -a
inkscape
inkscape fcsolve0.svg
iotop
java -jar /home/shlomif/Download/unpack/net/www/validator/build/dist/vnu.jar --format gnu --verbose --Werror --skip-non-html /tmp/zjzj/ 2>&1 | tee f
java -jar /home/shlomif/Download/unpack/net/www/validator/build/dist/vnu.jar --format json --Werror --skip-non-html /tmp/zjzj
java -jar /home/shlomif/Download/unpack/net/www/validator/build/dist/vnu.jar --format json --Werror --skip-non-html /tmp/zjzj 2>f.json
java -jar /home/shlomif/Download/unpack/net/www/validator/build/dist/vnu.jar --format json --Werror --skip-non-html d 2>&1 | json_pp - | gvim -
java -jar /home/shlomif/Download/unpack/net/www/validator/build/dist/vnu.jar --format json lib/presentations/qp/perl-for-newbies/4/all-in-one/index.html
java -jar build/dist/vnu.jar --skip-non-html ../dest-xh/
jing lib/sgml/relax-ng/docbook.rng $(ls lib/docbook/5/xml/*.xml | grep -v arabic)
jobs
json_pp < f.json > l.json
k
k5
kate
kate Backup/Arcs/emo.txt
kate lib/make/main.mak
kill %1
kill -9 %1
kmix
konversation
kpat
l
l ..
la
ld
ldd freecell-solver-multi-thread-solve
less .ci-gen.ini
less .tidyallrc
less .travis.bash
less .travis.yml
less CMakeCache.txt
less ChangeLog
less Changes
less INSTALL
less LICENSE
less Makefile
less Makefile.PL
less NEWS
less README
less README.md
less README.pod
less Tests/data/cache/vnu-html-validator.json
less db.txt
less dest/index.html
less dest/pre-incs/t2/rindolf/rindolf-spec/index.xhtml
less dist.ini
less f
less foo.txt
less htdocs/index.html
less l
less lib/docbook/5/essays/The-Enemy-English-v7/all-in-one.xhtml
less lib/docbook/5/essays/The-Enemy-English-v7/all-in-one.xhtml.temp.xml.xhtml
less lib/docbook/5/essays/c-and-cpp-elements-to-avoid/all-in-one.xhtml
less lib/docbook/5/essays/foss-and-other-beasts-v3/all-in-one.xhtml
less scripts/tag-release.pl
less weaver.ini
lftp sftp://192.168.1.232:
li
load_common du
locate .travis.yml
ls
ls *.webm | shuf -n 15 | xargs -d '\n' vlc
ls *.webm | shuf -n 5 | xargs -d '\n' vlc
ls -a
ls -d /tmp/* | grep -v tmux | grep -v 500 | grep -v systemd | grep -v cache | xargs rm -fr
ls -l
ls -l post-dest/t2/humour/bits/facts/images/
ls -lR
ls -lh
ls -lrS
ls -lrS l*
ls -lrS | commify
ls -lrt
ls -ltA
ls -rt
ls ..
ls BUILD
ls Tests/
ls bin
ls deals
ls foo/
ls reproducible-build-dir/run-t-*.bash
ls scripts
ls src/js
ls t
ls ~
lynx https://www.shlomifish.org/
lynx www.shlomifish.org
m
m 2>&1 | cat > /dev/null
m ; NODE_PATH="`pwd`"/lib/for-node/js ./qunit.js lib/for-node/test-code-emcc.js
m clean
m clean 2>&1 | cat > /dev/null
m clean all
make
make -d 0126-linuxexpo-amsterdam.en.html
make -f ../scripts/Makefile.gnu SRC_DIR=../source
make -f ../scripts/Makefile.gnu SRC_DIR=../source clean
make -f C_arraytest.mak
make -f modsum.mak
make -j4
make -j4 PROD=1 upload
make -j4 bzImage modules
make -j4 fastrender
make -j4 test
make -j4 upload_beta
make -j4 upload_var
make -j5
make -j5 bzImage modules
make -j8
make -j8 PROD=1
make -j8 PROD=1 docbook_extended
make -j8 docbook_extended
make -j8 install
make -j8 test
make -j8 upload
make -j8 upload_beta
make -j8 upload_local
make -j8 upload_local upload_beta
make -j8 upload_local upload_var upload_beta
make -j8 upload_var
make -j9
make 0126-linuxexpo-amsterdam.en.html
make 2>&1 | gvim -
make 2>&1 | less
make 2>&1 | tee f
make > m.txt 2>&1
make DEST_BABEL_JSES.show
make DEV=1 fastrender
make PROD=0 upload
make PROD=0 upload_beta
make PROD=1
make PROD=1 fastrender
make PROD=1 upload
make PROD=1 upload_beta
make SKIP_EMCC=0 test
make SKIP_EMCC=1 test
make T2_SVGS__MIN.show
make VERBOSE=1
make VERBOSE=1 2>&1 | gvim -
make VERBOSE=1 > m.txt 2>&1
make VERBOSE=1 test
make all_deps
make all_games_html
make check
make clean
make css_targets
make db.txt
make dest/js/web-fc-solve-ui.js
make dist
make disttest
make docbook_extended
make docs
make edit
make fastrender
make foo
make gen_divs
make install
make install_docbook5_epubs
make lib/cache/STAMP.post-dest
make lib/docbook/5/essays/The-Enemy-English-v7/all-in-one.xhtml
make lib/docbook/5/essays/foss-and-other-beasts-v3/all-in-one.xhtml
make manifest
make metafile
make oldconfig
make oldtime
make package_source
make package_source && unxz wml-2.18.0.tar.xz && xz9 wml-2.18.0.tar && rm -fr wml-2.18.0 && tar -xvf wml-2.18.0.tar.xz && (cd wml-2.18.0 && ah)
make presentations_targets
make reformat
make result
make resumes
make run
make sol
make test
make tests
make time
make upload
make upload_beta
make upload_home_remote
make upload_local
make upload_stable
make upload_var
man bash
man dnf
man inkscape
man test
man tidy
mcs -pkg:dotnet 630-v1.cs
mcs -pkg:dotnet 630-v1.cs 2>&1 | less
meson ..
mgarepo submit --define section=core/updates_testing
mgarepo submit --define section=core/updates_testing -t 6
mgarepo up
mi
mi ; n -m mi
mi6 build
mi6 test
minicpan
mkdir b
mkdir foo
mkdir old-hg
mkdir tests
mock $PWD/SRPMS/*.src.rpm
mock $PWD/SRPMS/*.src.rpm ; n
mono ./630-v1.exe
mono ./630-v1.exe 2>&1 | less
mplayer 01\ See\ Her\ Out.mp3
mpv --really-quiet --volume=50 Music/dosd-mp3s/Nelly\ Furtado\ -\ Powerless.mp3
mpv --vo=drm --quiet --volume=50 Music/mp3s/All\ About\ That\ Bass\ by\ Meghan\ Trainor\ \(cover\)-z6ogSL1QSjE.webm
mpv --vo=drm --volume=50 Music/mp3s/Girls\ Aloud\ -\ Can\'t\ Speak\ French\ -\ i0sezoBzESk.flv
mpv --vo=drm relax.jp2
mpv --vo=null --volume=50 Music/mp3s/Playlist\ -\ Girls\ On\ The\ Rise/003-1353450-Bohemian\ Hideaway-Brave\ Soul\ _ft.\ Juliet\ Lyons_.ogg
mpv --vo=null --volume=50 Music/mp3s/Playlist\ -\ Summer\ 2015/006\ -\ David\ Amber\ -\ Gnarly\ _feat.\ Devyn\ Rush_.ogg
mpv --volume=50 --vo=null Music/mp3s/Playlist\ -\ Girls\ On\ The\ Rise/003-1353450-Bohemian\ Hideaway-Brave\ Soul\ _ft.\ Juliet\ Lyons_.ogg
mpv --volume=50 --wid=0 Music/mp3s/Shine\ 4U\ -\ Carmen\ and\ Camille-B8ehY5tutHs.mp4
mpv --volume=50 Music/dosd-mp3s/George\ Harrison\ -\ I\'ve\ Got\ my\ Mind\ Set\ on\ you.mp3
mpv Music/mp3s/Playlist\ -\ Summer\ 2015/006\ -\ David\ Amber\ -\ Gnarly\ _feat.\ Devyn\ Rush_.ogg
mr run git clean -dxf .
mr st
mu
mv bookmarks-* ../Arcs/old-firefox-bookmarks/
mv du-new.txt du.txt
my_update
myrsync .config/gtk-3.0-fixed/ .config/gtk-3.0/
n
n -m foo
nano
ninja
ninja -j1
ninja -j1 install
ninja -j4
ninja -j4 ; n -m clang
ninja check
ninja clean
ninja install
ninja test
ninja tests
node inspect node_modules/.bin/qunit lib/for-node/test-code-emcc.js
node inspect test.js
node test.js
node test.js && echo succ
node test.js 2>&1 | tee f
node-inspect ./qunit.js lib/for-node/test-code-emcc.js
nopaste mniip.hs
npm audit
npm i
npm test
nvim
nvim -- dbm_solver.h
nvim -o e658log2par.txt 658/par2.bash
nvim ../source/CMakeLists.txt
nvim /home/shlomif/progs/Rpms/SPECS/giac.spec
nvim 658/par.bash
nvim d1.c
nvim l
nvim solve-more-7-gnupar.bash
nvim state.c
nvim-qt
nvim-qt -- -o TheWML/Backends/*/Main.pm
nvim-qt -- -o src/js/fcs-validate.ts src/js/web-fc-solve-tests--fcs-validate.ts
nvim-qt -- -o src/js/fcs-validate.ts src/js/web-fc-solve-ui.ts
nvim-qt -- -p `cat ../filelist.txt`
nvim-qt -- dbm_solver.h
nvim-qt ../c-solver/lib.c
nvim-qt ../src/wml_test/t/build-process.t
nvim-qt .travis.yml
nvim-qt 384-v1.py
nvim-qt CMakeLists.txt
nvim-qt README.asciidoc
nvim-qt a
nvim-qt d1.c
nvim-qt lib.c
nvim-qt o
nvim-qt pysollib/game/__init__.py
nvim-qt pysollib/pysolrandom.py
nvim-qt simpsim.c
nvim-qt state.c
ocaml nums.cma from-forum--mclo.ml
okteta libfreecell-solver.a
okular Humble-Bundle-Books-Linux-No-starch/howlinuxworks.pdf
p
p --tags
p -f
p upstream
partial_rebuild
patch -p1 < ~/g1.diff
perl -I ../source/t/lib ../scripts/fcc-delta-stater--test.pl
perl -I ../source/t/lib ../source/scripts/horne-autoplay-board.pl 24.board
perl -Ilib bin/git-info info
perl -Ilib t/001_routes.t
perl -MCarp::Always -Ilib t/001_routes.t
perl -c CI-testing/continuous-integration-testing.pl
perl -d -I ../source/t/lib ../scripts/fcc-delta-stater--test.pl
perl -d bin/process.pl
perl -d bin/tt-render.pl
perl -i -0777 -p bin/wml2tt.pl src/uses/databases/index.html.tt2
perl ../c-solver/run-tests.pl
perl ../c-solver/run-tests.pl --glob '[bc]la*.t'
perl ../c-solver/run-tests.pl --glob 'cla*.t'
perl ../run-tests.pl
perl ../scripts/cmd-line-compiler compile
perl ../scripts/cmd-line-compiler compile && m && y
perl ../scripts/docker-test.pl
perl ../scripts/multi_config_tests.pl ; n --msg 'fcs test'
perl ../scripts/multi_config_tests.pl ; n -m 'fcs multi test'
perl ../source/run-tests.pl
perl ../source/run-tests.pl --glob='*qual*'
perl ../src/Tatzer -l n2b
perl ../src/wml_test/run_test.pl
perl 658/summarize.pl
perl Build.PL
perl CI-testing/continuous-integration-testing.pl
perl CI-testing/continuous-integration-testing.pl test
perl Makefile.PL
perl Makefile.PL && make disttest
perl Tests/spell-check--hebrew.t
perl apply-solve-more-3-log.pl
perl bin/clean-up-xhtml5.pl t2/lecture/Pres-Tools/Perl-Point/slide00*.htm
perl bin/fetch-blogspot-feed.pl
perl bin/gen-build-deps --modules-conf /home/shlomif/Docs/homepage/homepage/trunk/bin/required-modules.yml
perl bin/gen-rpm-for-build-deps --modules-conf /home/shlomif/Docs/homepage/homepage/trunk/bin/required-modules.yml -o i
perl bin/gen-rpm-for-build-deps -o f.spec
perl bin/gen-rpm-for-build-deps -o f.spec --modules-conf bin/required-modules.yml
perl bin/gen-web-fc-solve-tests--texts-dictionary.pl
perl bin/process.pl
perl bin/process.pl ; echo
perl bin/rel-links-parse.pl $(find post-dest/ -name '*.html' -o -name '*.xhtml')
perl bin/sort -n --head 5 t/data/sort/ints1.txt
perl bin/sort-check-spelling-file
perl bin/tt-render.pl
perl gen-db.pl
perl github-dashboard
perl github-dashboard -a
perl script/tag-release.pl
perl scripts/tag-release.pl
perl shlomif-settings/setup-all/setup-all.pl
perl t/html-correctness.t
perl test-me.pl
perl test.pl
perl tests/installation/bin/wml -
perl tests/installation/lib64/wml/exec/wml_p1_ipp
perl tests/installation/lib64/wml/exec/wml_p1_ipp -
perl ~/Backup/Arcs/proc2.pl
perl ~/proc.pl
perl6 ../scripts/fuzz-build.p6
perl6 ../scripts/fuzz-build.p6 --rb
perl6 ../scripts/fuzz-build.p6 --rb -g ; n -m gcc
perl6 ../scripts/fuzz-build.p6 -g ; n -m clang
perl6 ../scripts/fuzz-build.p6 -g ; n -m gcc
perl6 ../scripts/fuzz-build.p6 ; n -m clang
perl6 ../scripts/fuzz-build.p6 ; n -m gcc
perlbrew list
perlbrew use perl-5.26.2
perlbrew use perl-5.28.0
perlbrew use perl-5.28.1
perldoc -l XML::Grammar::Screenplay::App::FromProto
perldoc IO::All
perldoc Path::Tiny
pi-make-microsoft-freecell-board -t 1109 | ./fc-solve -l ve -mi 6468
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi -1
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi -1 -s -i -p -t -sam -sel > bad
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi -1 | tail -3
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi -200000 | tail -3
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi 200000
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi 900000
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -p -t -sam -sel -mi 200000
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve -mi 20
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve -mi 20 > f
pi-make-microsoft-freecell-board -t 830910836 | fc-solve --load-config video-editing
pi-make-microsoft-freecell-board -t 830910836 | fc-solve --load-config video-editing -p -t -sam -sel -mi 200000 | tail
pi-make-microsoft-freecell-board -t 90291042 | ./fc-solve --freecells-num 0 -to 0AB
pidgin
ping 192.168.1.1
ping www.google.com
pip2 install --upgrade --user .
pip3 install --upgrade --user .
pkill -9 gvim
pkill -9 gvimdiff
pkill baloo_file
pkill claws-mail
pkill gvim
pkill hexchat
pkill pulseaudio
pkill sshd
pkill xfce4-screensav
pkill xscreensaver
pm-suspend
poweroff
prettier --parser babel --arrow-parens always --tab-width 4 --trailing-comma all --write bin/node_inspect_debugger_exec.js
prettier --parser scss --arrow-parens always --tab-width 4 --trailing-comma all --write lib/sass/*.scss
prettier --parser scss --arrow-parens always --tab-width 4 --trailing-comma all --write lib/sass/*.scss\
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write *.ts
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write abc-path.ts
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write src/js/*.ts
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write src/js/fcs-validate.ts
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write src/js/web-fc-solve--expand-moves.ts
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write src/js/web-fc-solve-tests--fcs-validate.ts
prompt fire
prove --timer Tests/case-insense-file-collision.t
prove -j1 Tests/*.t
prove -v Tests/validate-html-using-vnu.py 2>&1 | tee ~/f
prove ../t/factor.t
prove Tests/validate-html-using-vnu.py 2>&1 | tee ~/f
prove euler-156-v2.t
prove root-tests/t/perltidy.t 2> t
prove shlomif-settings/tests/*.t
prove t/unicode-plugin.t
ps
ps axo pid,cmd,etime | grep make
pt
pu
put
put ; p ; t
pwd
py.test-3 --pdb tests/test_gimp_xcf.py
py.test-3 --pdb tests/test_media_zip.py
py.test-3 --pdb tests/test_output_scour.py
py.test-3 tests/test_output_scour.py
pyco future
pydoc3 re
pymode
pypy euler_601_v1.py
pypy3 -i 658/658_v1.py
pypy3 -m vmprof -o out.log 685-v1.py
pypy3 -m vmprof -o out.log 685-v1.py 50 1
pypy3 324/e324_v1.py
pypy3 384-v1.py
pypy3 430-v1.py
pypy3 440-v1.py
pypy3 440-v1.py | grep ^gg | sus
pypy3 483-v1.py
pypy3 483-v1.py | tee -a log.txt | timestamper
pypy3 483-v3.py
pypy3 489-v1.py
pypy3 641-v1.py
pypy3 641-v1.py | perl -lnE 'say ++$h{$_}, " ", $_'
pypy3 654_v1.py
pypy3 655_v1.py
pypy3 657/657_v2.py
pypy3 658/658_v1.py
pypy3 658/658_v1.py | tee -a n
pypy3 658/658_v1.py| timestamper | tee -a e658-log0.txt
pypy3 658/e657.py| timestamper
pypy3 660_v1.py
pypy3 663_v1.py
pypy3 665_v1.py | timestamper
pypy3 675-v1.py
pypy3 676-v1.py
pypy3 676-v1.py | commify
pypy3 677-v1.py
pypy3 685-v1.py
pypy3 685-v1.py --top 120
pypy3 685-v1.py 10000
pypy3 685-v1.py 10000 | timestamper
pypy3 685-v1.py | tee -a l1.txt
pypy3 e451_v2_step2.py
pypy3 e451_v2_step2.py | less
pypy3 e685v1.py
pypy3 e685v1.py 10000 1
pypy3 e685v1.py 30 1
pypy3 e698v1.py
pypy3 e701v1.py
pypy3 euler-248-v1.py
pypy3 euler-248-v1.py | tee good
pypy3 euler_572_v2.py 1
pypy3 euler_572_v2.py 2
pypy3 euler_572_v2.py 200
pypy3 euler_659_v1.py
pypy3 pysol.py
pypy3 setup.py install
pypy3 setup.py install --force
pypy3 sums_of_powers.py
pypy3 sums_of_powers.py | grep -vE '^[2] '
pysol
python -m SimpleHTTPServer
python build/build.py all
python build/build.py jar
python build/build.py test
python refactor1.py
python2 650-fakesson.py
python2 sum.py
python2 t2/humour/fortunes/python-show.py && echo fii
python3
python3 -i 658/658_v1.py
python3 -m pdb 685-v1.py
python3 -m pdb e685v1.py 1000 1
python3 -m pdb e685v1.py 30 1
python3 -m pdb e701v1.py
python3 -m trace --trace ../../source/t/t/several-iter-limits.py >f
python3 -mpdb Tests/validate-html-using-vnu.py
python3 -mpdb filt.py
python3 -mpdb pysol.py
python3 ../../source/t/t/several-iter-limits.py
python3 ../source/board_gen/gen-multiple-pysol-layouts.py --dir foo/ --prefix "" --suffix .board 24
python3 483-v1.py
python3 650-fakesson.py
python3 650/650-v1.py
python3 654_v1.py
python3 657/657_v1.py
python3 657/657_v2.py
python3 657_v1.py
python3 658/658_v1.py
python3 658/658_v1.py | tee -a 658log.txt
python3 658/658_v1.py| timestamper | tee -a e658-log1.txt
python3 662_v1.py
python3 684-v1.py
python3 685-v1.py
python3 Tests/validate-html-using-vnu.py
python3 bin/split-lwall-facts.py
python3 e685v1.py
python3 e685v1.py 1000 1
python3 e695test1.py
python3 e698v1.py
python3 euler-248-v1.py
python3 gen-multiple-pysol-layouts --dir=deals/ --ms --prefix '' --suffix .board seq 1 32000
python3 lib/factoids/merge_into_fortunes.py
python3 lib/faq/split_into_sections.py
python3 pysol.py
python3 pysol.py -g FreeCell --deal ms100000
python3 refactor1.py
python3 setup.py build
python3 setup.py install --user
python3 setup.py sdist
python3 setup.py test
python3 setup.py test 2>&1 | gvim -
python3 setup.py test 2>&1 | tee ~/inkscape-ext-tests.txt
python3 shlomif-settings/home-bin-executables/bin/notifier-event-show-hook--pyqt5.py
python3 test1.py
pythonsetup.py sdist
q
qmmp 01\ See\ Her\ Out.mp3
qtb
quadp render -a
qvim
qvim -- -o dist.ini Changes ~/progs/perl/cpan/Dir/Manifest/Dir-Manifest/p5/Dir-Manifest/Changes
qvim -- -o foo.txt y.txt
qvim -- -o lib/hunspell/whitelist1.txt foo.txt y.txt
qvim -- -o lib/make/copies-source.mak lib/make/main.mak lib/Shlomif/Homepage/GenScreenplaysMak.pm lib/screenplay-xml/list.yaml
qvim ../scripts/benchmark--gen-multiple-layouts.bash
qvim .appveyor.yml
qvim .gitignore
qvim .travis.yml
qvim 685-v1.py
qvim CI-testing/continuous-integration-testing.pl
qvim CMakeLists.txt
qvim Changes
qvim Makefile
qvim README.asciidoc
qvim README.md
qvim TODO.quicktask
qvim dist.ini
qvim files.txt
qvim lib/App/gimpgitbuild/Command/build.pm
qvim lib/blocks.tt2
qvim lib/make/main.mak
qvim o
qvim runv1instead_v2.p6
qvim shlomif-putting-cards-on-the-table-2019-2020.docbook5.xml
qvim shlomif-settings/home-bin-executables/bin/notifier-event-show-hook--pyqt5.py
qvim src/meta/FAQ/index.xhtml.tt2
qvim testfiles/src/drag-and-drop-svgz.cpp
qvim wml_frontend/wmk.src
qvim ~/o.txt
r
r '- New version'
rake
rake prettier
rake test
ranger
reboot
rebuild
rebuild 2>&1 | tee ~/o.txt
rebuild 2>&1 | tee ~/o.txt ; n -m rebuild
rebuild ; n
rebuild ; n -m rebuild
rec .ORIG
rec .orig
regen
rehash
rej
reprb
rg '[ \t]$'
rg VERS
rgm i
rgm mi6 release
rgm perl6 e396_v1.p6
rgm t
rgm zef install --force-install .
rm *~
rm -f *.board
rm -f *.npy
rm -f *~
rm -f foo.txt y.txt
rm -f lib/docbook/5/essays/foss-licences-wars/all-in-one.xhtml docbook.css
rm -f offload/fcs_queue*
rm -f run-t-*
rm -f t/valgrind--*
rm -f t/verify-cache/*
rm -f t/verify-cache/nht.sha
rm -fr $TIDYALL_DATA_DIR
rm -fr *
rm -fr ../b
rm -fr ../bench-gen-multi*
rm -fr ../build-1
rm -fr ../dest-xh ; cp -a ../wml/dest ../dest-xh
rm -fr ../prerel-build
rm -fr .git
rm -fr .tidyall.d/
rm -fr B
rm -fr BUILD
rm -fr C*
rm -fr CM*
rm -fr CMake*
rm -fr RPMS/ SRPMS/ BUILD BUILDROOT/
rm -fr SPLIT_FCC
rm -fr _CPack_Packages
rm -fr _Inline
rm -fr b
rm -fr b/
rm -fr cache-consumed ; python3 483-v1.py
rm -fr cache-consumed ; python3 483-v1.py | less
rm -fr d
rm -fr dbm_fcs_dist*
rm -fr del*
rm -fr dest/
rm -fr dest/js/yui-unpack
rm -fr dest/pre-incs/t2/lecture/HTML-Tutorial/
rm -fr dest/t2/humour/fortunes/
rm -fr node_modules
rm -fr perl-*
rm -fr post-dest/
rm -fr t2/ipp.*
rm -fr tests/installation
rm -fr ~/Backup/Arcs/post-dest/post-dest/
rm -vfr cache-consumed ; pypy3 483-v1.py
rm -vfr cache-consumed ; pypy3 483-v1.py | tee -a log.txt
rm -vfr offload/deal*
rm Tests/data/cache/vnu-html-validator.json
rm a.out
rm backup.tar
rm cpandb.sql
rm du.txt
rm f
rm f.txt
rm foo.txt
rm foo.txt y.txt
rm g.log
rm g1.diff
rm git.log
rm golfs6.txt
rm htdocs/index.html~
rm inkscape-ext-tests.txt
rm irc2.log
rm l
rm lib/cache/STAMP.one
rm lib/cache/STAMP.post-dest
rm lib/cache/STAMP.two
rm lib/docbook/5/essays/c-and-cpp-elements-to-avoid/all-in-one.xhtml
rm lib/docbook/5/essays/foss-and-other-beasts-v3/all-in-one.xhtml
rm lib/docbook/5/indiv-nodes/rindolf-spec/index.xhtml
rm log.txt
rm mageia-perl-magpie-modules-list.txt
rm o.txt
rm out.log
rm y.txt
rpm -qa --qf '%{NAME}\t%{ARCH}\n' | grep 586
rpm -ql wml
rpmbuild --undefine=_disable_source_fetch -ba /home/shlomif/progs/Rpms/SPECS/lepton.spec
rpmbuild --undefine=_disable_source_fetch -ba /home/shlomif/progs/Rpms/SPECS/python-pywavelets.spec
rpmbuild --undefine=_disable_source_fetch -ba SPECS/diff-so-fancy.spec
rpmbuild --undefine=_disable_source_fetch -ba SPECS/gumbo.spec
rpmbuild -ba /home/shlomif/progs/Rpms/SPECS/cddlib.spec
rpmbuild -ba /home/shlomif/progs/Rpms/SPECS/cocoalib.spec
rpmbuild -ba /home/shlomif/progs/Rpms/SPECS/giac.spec
rpmbuild -ba /home/shlomif/progs/Rpms/SPECS/python-google-auth.spec
rpmbuild -ba SPECS/modules.spec
rpmbuild -ba f.spec
rpmbuild -tb freecell-solver-5.18.0.tar.xz
rshasum --digest=SHA-256
rsync -a dest/ docs
rsync -a dest/ docs/
rubocop -a ./Rakefile
rubocop -a Rakefile
rubocop ./Rakefile
rubocop Rakefile
ruby 1.rb
run
runspell
s
s *
sbt
sd
sensors
set +x
setup
sha256sum freecell-solver-* libfreecell-solver.* | sha256sum -
shs
shutter
simplescreenrecorder
sky up-r ../js
sky up-r js
solve 1
source apps/venv/buildbot/bin/activate
source myrsync.bash
spectacle
ssh -X 192.168.1.192
ssh -X 192.168.1.232
ssh -X sh
ssh hostgator
ssh lap
ssh shlomif@perlish.org
ssh-add ~/.ssh/id_rsa.sh
sshfs 192.168.1.232:/home/music m
startup
stdbuf -o 0 -i 0 pypy3 641-v1.py
strace -f -o w.st wml -p1-3 -D CUR_YEAR=2019 social_contract.wml
strace -f -o w.st wml -p1-3 -D CUR_YEAR=2019 social_contract.wml | less
strace -o f.st -f ../scripts/Tatzer -l extra_speed2
strip -s *
sub
sudo -i
sudo /usr/bin/restart-unbound
sudo /usr/bin/start-mandrake-everytime
sudo dnf -y --refresh upgrade
sudo dnf -y upgrade --refresh
sudo iotop
sudo mock `pwd`/SRPMS/*.rpm
sudo swapoff -a
sudo urpmi --auto --auto-update
sudo urpmi --auto --auto-update --split-length 1
sudo urpmi --auto-select --auto --auto-update
svn di
svn revert -R .
svn st
svn st python-*
svn up
systemsettings5
t
t 2>&1 | tee f.txt
t ; n -m wml
tail -100000 ~/.config/hexchat/logs/freenode-##programming.log > ~/irc2.log
tail -f 658log.txt | commify| timestamper | tee -a proclog.txt
tail -f du-new.txt
tail ~/d.txt
tar -tvf 2018-10-23-12.tar.xz
telegram-desktop
tidyall -a
time (fmt && t)
time (fmt)
time ./a.out
time ./e.exe
time ./e451.exe
time ./gen
time ./mniip
time ./multi_deal_freecell --dir ../foo --suffix .board seq 1 100000
time /home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 630-v1.py
time /home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 650/650-v1.py
time /home/shlomif/apps/julia-1.1.0/bin/julia -O2 506-v1.jl
time bash -c 'perl bin/sort -n -r --head 100 ~/d.txt'
time gmake
time make
time make fastrender
time perl 15/15.pl
time perl 24/24.pl
time perl 4.pl
time perl bin/tt-render.pl
time perl e694v1.pl
time perl runv1instead_v2.pl
time perl stats.pl 0fc-log.txt
time perl6 runv1instead_v2.p6
time pypy 630-v1.py
time pypy 675-v1.py
time pypy3 384-v1.py
time pypy3 6.py
time pypy3 641-v1.py
time pypy3 675-v1.py
time pypy3 676-v1.py
time pypy3 685-v1.py
time pypy3 685-v1.py --top=120
time pypy3 e655-brob26.py
time pypy3 e686v1.py
time pypy3 from-forum--ving.py
time pypy3 runv1instead_v2.py
time python3 6.py
time python3 630-v1.py
time python3 641-v1.py
time python3 650/650-v1.py
time python3 684-v1.py
time python3 e655-brob26.py
time python3 e694v1.py
time python3 e698v1.py
time pythone-brob.py
time rebuild
time rebuild ; n
time rebuild ; up
tmux
tmux a
tmux a -t 0
tmux a -t 1
tmux a -t 2
tmux ls
touch lib/blocks.tt2
touch lib/docbook/5/xml/*
touch lib/fc-solve-for-javascript-asmjs/libfreecell-solver-asm.js.mem
touch lib/presentations/spork/Perl/Lightning/Test-Run/Spork.slides
touch lib/template.jinja
touch lib/template.wml
touch lib/template.wml lib/template5.wml
touch src/js-fc-solve/text/index.html.wml
touch src/js/fcs-base-ui.ts
touch t2/*.wml
touch t2/humour/index.xhtml.wml
touch t2/index.xhtml.wml
touch t2/index.xhtml.wml t2/old-news.html.wml
touch t2/links.html.wml
ts
tsc --target es6 --moduleResolution node --module commonjs --outDir lib/for-node/js --rootDir src/js src/js/jq_qs.d.ts src/js/libfcs-wrap.d.ts src/js/web-fc-solve-tests.ts || echo fail
tsc --target es6 --moduleResolution node --module commonjs --outDir lib/for-node/js --rootDir src/js src/js/jq_qs.d.ts src/js/web-fc-solve-tests.ts || echo fail
u --buildrequires /home/shlomif/Download/unpack/Mageia/SPECS-only-for-deps/inkscape/SPECS/inkscape.spec
u --buildrequires /home/shlomif/Download/unpack/Mageia/SPECS-only-for-deps/kpat/SPECS/kpat.spec
u --buildrequires /home/shlomif/Download/unpack/mageia/SPECS-only-for-deps/gimp/SPECS/gimp.spec
u --buildrequires /home/shlomif/Download/unpack/mageia/SPECS-only-for-deps/kpat/SPECS/kpat.spec
u --buildrequires /home/shlomif/Download/unpack/mageia/SPECS-only-for-deps/wml/SPECS/wml.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/cocoalib.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/gfan.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/giac.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/python-aiohttp.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/python-autobahn.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/python-readme-renderer.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/python-sqlalchemy-migrate.spec
u /home/shlomif/progs/Rpms/RPMS/noarch/task-shlomif-homesite-0.0.1-1.mga7.noarch.rpm
u asciidoc
u lib64gdl-devel
u lib64gtkmm3.0-devel
u libreoffice
u magpie
u perl-App-Notifier-Service
u perl-Dist-Zilla-PluginBundle-Author-ETHER
u python3-flake8
u spamassassin-spamd
uas
uas --split-length
uas --split-length 1
ub
ulimit -c
uname -a
unset DBUS_SESSION_BUS_ADDRESS
unset HTML_VALID_VNU_JAR
unset MAKEFLAGS
unset QT_QPA_PLATFORMTHEME
unset TEST_JOBS
unxz < dbm.time.txt.xz | wc -c
unxz < golfs6.txt.xz| wc -c
unxz wml-2.18.0.tar.xz
unzip -l dest/arch_doc/fcs_arch_doc.epub
up
up $(dzil authordeps)
update_all
uptime
ur
uu
uu ; uas
valgrind -v ./black-hole-solve --game black_hole --display-boards --rank-reach-prune ../c-solver/t/data/26464608654870335080.bh.board.txt
valgrind -v ./black-hole-solve --game black_hole --display-boards --rank-reach-prune ../c-solver/t/data/26464608654870335080.bh.board.txt 2>&1 | gvim -
valgrind ./fc-solve 24.board
valgrind board_gen/pi-make-microsoft-freecell-board -t 1
vim 658/summarize.pl
vim d2.c
vim dbm_solver.c
vim t2/humour/fortunes/ver.txt
virt-manager
vlc *.{mp3,flv,ogg,mp4,avi,wmv,mpg,MP3,m4a,wma,webm}
vlc Arcs/vlc-all.xspf
vlc Arcs/vlc14.xspf
vlc Arcs/vlc25.xspf
vlc Arcs/vlc27.xspf
vlc Arcs/vlc32.xspf
vlc Arcs/vlc4.xspf
vlc Arcs/vlc5.xspf
vlc Arcs/vlc6.xspf
vlc Arcs/vlc8.xspf
vlc Download/Video/*4U*
vlc Download/Video/David_Amber_-_Wild_Hearts__feat._Ashley_Jana_.ogg
vlc Music/mp3s/01\ See\ Her\ Out.wav
vlc Music/mp3s/Playlist\ -\ Summer\ 2015/006\ -\ David\ Amber\ -\ Gnarly\ _feat.\ Devyn\ Rush_.ogg
vmprofshow --prune_percent 5 out.log
wc -l Backup/Arcs/msdeals-sha.txt
wc -l db.txt
wc -l o.txt
which deps-app
which depth_dbm_fc_solver
which fc-solve
which gcc
which gvim
which latemp-config
which node
which nvim
which quadp
which sass
which vim
which wml
wmd
wml -o UNDEFuEN:1997 /dev/null
wml f
xsetbg /mnt/music/Images/Women/hjZIPaw.jpg
xsetbg ~/Download/Images/Women/Y2YVNnu.jpg
xsetbg ~/Download/Images/Women/hjZIPaw.jpg
xsetbg ~/Download/Images/Women/rLUd3uL.jpg
xsltproc -o lib/docbook/5/indiv-nodes/case-for-drug-legalisation-v3/ --stringparam docmake.output.format xhtml --stringparam docmake.output.path_to_root ../../ --stringparam docmake.output.work_in_progress '' lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml.xsl lib/docbook/5/xml/case-for-drug-legalisation-v3.xml
xsltproc -o lib/docbook/5/indiv-nodes/case-for-drug-legalisation-v3/f,h --stringparam docmake.output.format xhtml --stringparam docmake.output.path_to_root ../../ --stringparam docmake.output.work_in_progress '' lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml.xsl lib/docbook/5/xml/case-for-drug-legalisation-v3.xml
xsltproc -o lib/docbook/5/indiv-nodes/case-for-drug-legalisation/ --stringparam docmake.output.format xhtml --stringparam docmake.output.path_to_root ../../ --stringparam docmake.output.work_in_progress lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml.xsl lib/docbook/5/xml/case-for-drug-legalisation.xml
xsltproc -v -o lib/docbook//indiv-nodes/case-for-drug-legalisation-v/ --stringparam docmake.output.format xhtml --stringparam docmake.output.path_to_root ../../ --stringparam docmake.output.work_in_progress '' lib/sgml/shlomif-docbook/xsl--stylesheets/shlomif-essays--xhtml.xsl lib/docbook//xml/case-for-drug-legalisation-v.xml
xsltproc -v -o lib/docbook/5/indiv-nodes/case-for-drug-legalisation-v3/ --stringparam docmake.output.format xhtml --stringparam docmake.output.path_to_root ../../ --stringparam docmake.output.work_in_progress '' lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml.xsl lib/docbook/5/xml/case-for-drug-legalisation-v3.xml
xterm
xz9 wml-2.18.0.tar
y
yarn
youtube-dl -U
yp
z
zef install --force-install .
zef install .
zsh
~/apps/vagrant/2.1.5/vagrant up ; n -m vagrant
