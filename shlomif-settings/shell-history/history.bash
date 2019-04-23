( . ~/bin/Dev-Path-Configs-Source-Me.bash && make )
(git clone git@github.com:thewml/website-meta-language.git w && (cd w && mkdir b && cd b && cmake ../src && make) && rm -fr w )
-s
-t 0fc
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
-t perl/begin
-t perl/core
-t perl/docmake
-t perl/golf
-t perl/inifiles
-t perl/stats
-t perl/xml/libxml
-t qp
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
. /home/shlomif/conf/build/KDE/kdegames5-trunk-all-debug.sh ../kpat
. /home/shlomif/conf/build/pidgin.sh
. bin/spell.bash
. build.sh
. par-Source-Me.bash
. ~/bin/Dev-Path-Configs-Source-Me.bash
. ~/conf/trunk/shlomif-settings/home-bin-executables/bin/magpie-update-multiple.bash
. ~/h.bash
../c-solver/Tatzer -l n2b --prefix=/home/shlomif/apps/test/bhs
../scripts/Tatzer
../scripts/Tatzer --break-back-compat-1
../scripts/Tatzer -l extra_speed2
../scripts/Tatzer -l n2t
../source/Tatzer
../source/Tatzer --break-back-compat-1
../source/Tatzer -l extra_speed2
../source/Tatzer -l n2b
../source/Tatzer -l n2t
./Build disttest
./Build manifest
./Build test
./a.out
./arcanist/bin/arc diff
./arcanist/bin/arc diff master
./autogen.sh
./autotests/SolverFormatTest
./black-hole-solve --game golf --display-boards --rank-reach-prune --wrap-ranks boards/golf906.board | gvim -
./bwbasic fizz-buzz.bas
./bwbasic fizz-buzz.bas | gvim -
./configure
./dbm_fc_solver --offload-dir-path offl/ 11982.board
./e
./e451.exe 3-1000
./euler383_v3.exe
./fc-solve -l ve 24.board
./fc-solve 24.board
./freecell-solver-fork-solve 1 5000 1000 -l lg && echo goo
./gen-helpers
./kpat
./kpat --start 830910836 --end 830910836 --solve 3 | cat
./multi-bhs-solver --game golf --display-boards --rank-reach-prune boards/golf2.board
./node_modules/.bin/tsc abc-path.ts | gvim -
./refresh
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 316-v1.py
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 396-v1.py
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 650/650-v1.py
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 gen_divs.py
/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 gen_divs.py | tee -a o.txt
/home/shlomif/Download/unpack/to-del/bookmarks-manager/node_modules/.bin/web-ext run -s .
/home/shlomif/apps/ff/66-nightly/firefox/firefox -no-remote 'https://www.shlomifish.org/fc-solve-temp/js-fc-solve/automated-tests/?alert=1'
/home/shlomif/apps/julia-1.1.0/bin/julia 658/e658_v3.jl
/home/shlomif/apps/julia-1.1.0/bin/julia 658/e658_v3.jl | tee -a jlog2.txt | timestamper
/home/shlomif/apps/julia-1.1.0/bin/julia 658/e658_v3.jl | tee -a jlog3.txt
/home/shlomif/apps/julia-1.1.0/bin/julia 658/e658_v3.jl | tee -a jlog4.txt
/home/shlomif/apps/julia-1.1.0/bin/julia e658_v4.jl
/home/shlomif/apps/perl/bleadperl-debug/bin/cpanp -i Task::BeLike::SHLOMIF
/home/shlomif/apps/perl/bleadperl/bin/cpanp -i Task::BeLike::SHLOMIF
/opt/kde5-trunk/bin/kpat
/opt/vlc-3.0/inkscape-trunk/bin/inkscape
/usr/bin/time bin/rebuild
/usr/bin/time perl "$c_src"/run-tests.pl --glob='{clang-format,perltidy,py-flake8,style-trailing-space}*.t'\
/usr/bin/time perl bin/process.pl
80_chars_ruler
Cancel_reminder
FCS_TEST_BUILD=1 t
FCS_TEST_SHELL=1 perl ../source/run-tests.pl
L
MIN=22 perl ../scripts/multi_config_tests.pl ; n --msg 'fcs test'
NODE_PATH="`pwd`"/lib/for-node/js /usr/bin/node `which qunit-cli` lib/for-node/test-code.js
NODE_PATH="`pwd`"/lib/for-node/js node `which qunit` lib/for-node/test-code.js 2>&1 | gvim -
NODE_PATH="`pwd`"/lib/for-node/js node lib/for-node/test-code.js
NODE_PATH="`pwd`"/lib/for-node/js qunit lib/for-node/test-code-emcc.js
NODE_PATH="`pwd`"/lib/for-node/js qunit lib/for-node/test-code.js
NODE_PATH="`pwd`"/lib/for-node/js qunit-cli lib/for-node/test-code-emcc.js
NODE_PATH="`pwd`"/lib/for-node/js qunit-cli lib/for-node/test-code.js | gvim -
PATH+=:$PWD
PATH+=:/home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin
PATH+=:/home/shlomif/apps/perl6-rakudo/bin
PATH="/home/shlomif/apps/golang/bin:/home/shlomif/.local/bin:/home/shlomif/apps/test/wml/bin:$PATH"
PYTHONPATH="`pwd`/src:$PWD" /home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 Tests/validate-html-using-vnu.py
PYTHONPATH="`pwd`/src:$PWD" python3 Tests/validate-html-using-vnu.py
PYTHONPATH="`pwd`/tests/lib:$PWD" python2 -mpdb tests/unit-generated/test__pysol_tests.scorpion_canMove__v3.py
PYTHONPATH="`pwd`/tests/lib:$PWD" python3 tests/unit-generated/test__pysol_tests.scorpion_canMove__v3.py
SKIP_EMCC=1 NODE_PATH="`pwd`"/lib/for-node/js qunit lib/for-node/test-code-emcc.js
VirtualBox
WD=awe startx
WD=cin startx
WD=gnome startx
WD=jwm startx
WD=lxde startx
WD=xfce startx
__myctags
a
a=/home/shlomif/Backup/Arcs/sites--perl-begin-post-dest/post-incs-reduced/links/index.html ; b=/home/shlomif/Backup/Arcs/sites--perl-begin-post-dest/this-incs-reduced/links/index.html ; cmp $a $b ; gvimdiff <(cut -b 1-5000000 -n $a) <(cut -b 1-5000000 -n $b) +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
a=`pwd`
a=dest/about.html ; cmp $a ../$a ; gvimdiff $a ../$a +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
a=dest/uses/qa/index.html; cmp $a ../$a ; gvimdiff $a ../$a +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
a=dest/uses/text-generation/index.html; cmp $a ../$a ; gvimdiff $a ../$a +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
ack -f
ack href=\"\\./'[^"]' dest/pre-incs/t2 | gvim -
ag ' $'
ag -g index.html.wml t2
ag -g wml src
ah
alias p='git push'
alias s='svn st'
an
b
b ; n --msg bm
ba
bash
bash --rcfile build.sh
bash -x bin/install-npm-deps.sh
bash ../scripts/c-subroutine-metrics-line-count.bash
bash ../scripts/fuzz-build.bash
bash ../scripts/fuzz-build.bash g
bash ../scripts/fuzz-build.bash g ; n -m fuzz
bash ../scripts/golf-bench-2.bash
bash ../scripts/golf-pat-perl-range-solve.bash
bash ../scripts/mint-new-release.bash ; n -m 'new fcs release'
bash ../scripts/split-fcc--all-in-one.bash
bash ../scripts/test-regressions.bash
bash .gen-ci.bash
bash /home/shlomif/Backup/Arcs/backup.bash
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
bash 658/par.bash | timestamper
bash 658/par2.bash | timestamper | tee -a ts2.txt
bash 660/660_v2-wrap.bash
bash 660/summmarize.bash
bash Install.bash
bash SPLIT_FCC/by-depth/2/active/AAAAAAAAAAAAAAAARA==/driver.bash
bash SPLIT_FCC/by-depth/3/active/AAAAAAAAAAAAAAABFA==/driver.bash
bash analyze.bash
bash bin/copy-web-fc-solve.bash
bash bin/install-npm-deps.sh
bash bin/rebuild
bash download-gtest.sh
bash filt.bash
bash fr.bash
bash fr.bash 2>l
bash gen_list.sh
bash h.bash
bash myrsync.bash
bash pgo.sh
bash rakudo-git.bash
bash run.bash
bash shlomif-build.sh ; n -m icu2
bash solve-more-3.bash | commify | timestamper
bash test.bash
bash update.sh
bash vendu-deploy-1.bash
bash ~/bin/backup-total.sh ; bash ~/bin/backup-extra-data.sh ; bash ~/bin/backup-total.sh ; bash ~/bin/backup-extra-data.sh ; n --msg "Backup finished"
bash ~/conf/trunk/shlomif-settings/home-bin-executables/bin/gen-gen-ci.bash
bash ~/h.sh
bat README.md
bat f
bd
bg
bin/spell-checker-iface > foo.txt
bm -l -p
bm -l -s
bpat
buildbot start master
bundle exec bin/validate
c
c7
ca
caddy XorShift128Plus.pl 2>&1 | gvim -
caddy XorShift128Plus.py
caddy XorShift128Plus.py | less
cargo build
cat .gitignore | perl -lpE 's#^/#ls #' | bash -e
cat /etc/resolv.conf
cat abstract.txt
cat f
cat foo.txt
cd
cd $arcs
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
cd ../docs
cd ../extensions
cd ../scripts
cd /home/shlomif/Docs/homepage/homepage/trunk/../_trunk--clones/
cd /home/shlomif/progs/freecell/extern/Solitairey/
cd 0fc-b
cd 2018
cd 451
cd 658
cd 662
cd 665
cd Arcs
cd B
cd BUILD
cd Backup
cd Backup/
cd Backup/Arcs
cd Docs/Notes/Passwords
cd Docs/programming/irc/freenode-##programming/faq/FreenodesprogrammingWiki
cd Docs/programming/what-i-learned-from-porting-to-freebsd
cd Download/Arcs
cd Download/Docs/Books/
cd Download/unpack/
cd Download/unpack/kernel/from-git/linux
cd Download/unpack/to-del
cd Download/unpack/to-del/
cd Download/unpack/to-del/amigojapan.github.io/
cd Download/unpack/web-sites/awesome-opensource-israel
cd Games-Solitaire-BlackHole-Solver
cd Music/mp3s
cd SOURCES
cd Solitairey
cd apps
cd bin
cd bin/
cd bin/private
cd build
cd conf/trunk/
cd dest
cd english
cd extensions
cd git
cd hg
cd kpat
cd lib/blogs/shlomif-tech-diary
cd lib/repos/Solitairey
cd neovim
cd perl-byacc-2.0.orig
cd progs
cd progs/JS/greasemonkey-scripts/
cd progs/perl/snippets
cd progs/wml/Latemp/cookiecutter--shlomif-latemp-sites/\{\{cookiecutter.project_slug\}\}/
cd pysolfc-web-site/
cd s
cd shlomif-settings
cd site
cd src
cd src/
cd to-del
cd todel
cd todel/
cd trunk
cd webwml
cd wml
cd wml_include
cd wrapper
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
ci -m 'add BRs'
ci -m fix
ci-generate
clang++ -Weverything -O3 -march=native -flto -fwhole-program e451-quasisphere.cpp
clang++ -Weverything -O3 -march=native -flto -fwhole-program e662-james-rauen.cpp -Ofast
claws-mail
cmake -DFCS_DISABLE_DEBONDT_DELTA_STATES=1 ../source/
cmake -DWITH_BH_SOLVER=1 -DCMAKE_BUILD_TYPE=Debug ../kpat
cmake -DWITH_GOLF_SOLVER=1 -DCMAKE_BUILD_TYPE=Release ../kpat
cmake .
cmake ../src
cmp dest/web-forums/index.html ../dest/web-forums/index.html
conf
coo cppcheck
coo freecell-solver
coo libuv
coo wml
countdown 1000 ; sub
cp -a dest ..
cp -a dest/ ~
cp -a dest/post-incs/t2/lecture/Perl/Lightning d
cp -a post-dest/ ~/Backup/Arcs/post-dest/
cp ../../../Selina-Mandrake/selina-mandrake/screenplay/tests/valid-html-tidy.t tests/
cp ../Star-Trek--We-the-Living-Dead/.gen-ci.bash .
cp /home/shlomif/progs/perl/cpan/git/Module-Format/Module-Format/.tidyallrc .
cp installer/tests/perl/t/data/p4n5-copy/all-in/index.html installer/tests/perl/t/data/p4n5-copy/all-in/index.foo.xhtml && sky up installer/tests/perl/t/data/p4n5-copy/all-in/index.foo.xhtml
cpan-upload HTML-T5-0.001.tar.gz
cpandb --CPAN /home/shlomif/Download/Arcs/Perl/minicpan/ --cpanid PERLANCAR | gvim -
cpanm .
cpanp -i App::cpanminus
cpanp -i Task::BeLike::SHLOMIF ; n -m cpan
cppcheck . > g
cs
csv2chart
ct
ctags -R .
cv
cython-3 *.pyx
d
date
date +%s
date +%s.%N
date ; date +%s
depth_run 1
df
df -i
did
diff -u -r ../dest/ dest | gvim -
diff -u -r dest ../dest/ | gvim -
diff -u -r dest /home/shlomif/dest | gvim -
diff -u -r ~/Backup/Arcs/post-dest/post-dest/ post-dest/ | gvim -
disp
dolphin /home/shlomif/Download/unpack/graphics/inkscape/extensions/tests/
dolphin ~/Music/dosd-mp3s/ ~/Music/mp3s/ ~/Download/Video/
du -a . | sort -h
du -ah . | sort -h
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
dzil authordeps | xargs cpan -i
dzil build
dzil release
dzil test
dzil test --all
e
echo $PATH
echo $PERL5LIB
emsdk list
emsdk list | head -20
eo
eslint -c .eslintrc.yml src/js/solitaire.js
eslint -c .eslintrc.yml src/js/solver-freecell.js
eslint src/js/solver-freecell.js
et
eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
ex
export CC=/home/shlomif/bin/clang CXX=/home/shlomif/bin/clang++ FCS_CLANG=1
export EMSDK_ENV=/home/shlomif/Download/unpack/prog/llvm-to-js/emsdk/emsdk_env.sh
export HARNESS_OPTIONS=c
export HARNESS_OPTIONS=j4:c
export HARNESS_VERBOSE=1
export NOTIFIER_TO=lap
export PATH="$PATH:/home/shlomif/.local/bin:$PWD"
export PATH="$PWD/node_modules/.bin:$PATH"
export PATH="/home/shlomif/.local/bin:/home/shlomif/apps/test/wml/bin:$PATH"
export PATH="/home/shlomif/apps/golang/bin:/home/shlomif/.local/bin:/home/shlomif/apps/test/wml/bin:$PATH"
export VIMSYNT=1
export XZ_OPT="-T4"
f 1
f() { "$1" -l cpb 24.board } ; gvimdiff <(f fc-solve ) <(f ./fc-solve)
fd
fd \\.html ./d | xargs rename .html .xhtml
fd txt t2 | xargs touch
fd wml src | xargs gvim -p
fg
find
find ../dest-xh -name '*.html' | xargs rename .html .xhtml
find dest/pre-incs/t2 -regex '.*\.x?html' | grep -vF -e philosophy/by-others/sscce -e WebMetaLecture/slides/examples -e homesteading/catb-heb -e t2/catb-heb.html | perl -lpe 's=\A(?:./)?dest/pre-incs/t2/?==' | grep -vE '^humour/fortunes' | APPLY_TEXTS=1 xargs perl -d:NYTProf bin/post-incs-v2.pl --mode=minify --minifier-conf=bin/html-min-cli-config-file.conf --texts-dir=lib/ads --source-dir=dest/pre-incs/t2 --dest-dir=dest/post-incs/t2 --
find | wc -l
finish-server
firefox
firefox -no-remote
firefox -no-remote 'http://localhost/shlomif/temp-Solitairey/dest/'
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
fortune shlomif-shlomif
fortune shlomif-shlomif-fav
g
g++ -O3 -march=native -flto -fwhole-program ecnerwala-e654.cpp
g++ -Wall -Wextra -O3 -march=native -flto -fwhole-program 660/e660-jfirester.cpp
g++ -Wall -Wextra -g 665_v1.cpp
g++ -g 665_v1.cpp
g++ -o e -Wall -Wextra -O3 -march=native -flto -fwhole-program 665-verify.cpp
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program 663_v1.cpp -Ofast
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program e451-quasisphere.cpp
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program e662-james-rauen.cpp
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program e662-james-rauen.cpp -Ofast
g++ -o e451.exe -Wall -Wextra -O3 -march=native -flto -fwhole-program e663-pwild.cpp -Ofast
gdb --command=~/cmds.gdb ./kpat
gdb -args ./black-hole-solve --game black_hole --display-boards --rank-reach-prune ../c-solver/t/data/26464608654870335080.bh.board.txt
gdb -args ./fc-solve --load-config video-editing -mi 1271 -p -t -sam -sel <(pi-make-microsoft-freecell-board -t 7186)
gdb -args python3 -m trace --trace ../../source/t/t/several-iter-limits.py
gdb -args python3 ../../source/t/t/several-iter-limits.py
gdb ./kpat
gedit emo.txt
genf
get_nums | summary
ghc -O2 mniip.hs
gimp
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
git ci -F add-more-to-log-commit-msg.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/add-README-or-LICENSE.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/add-ci-gen-travis-yml.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/add-missing-deps-to-ci.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/avoid-predeclarations.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/convert-var-to-slot.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/extract-a-class.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/extract-a-module.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/extract-common-expr-into-var.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/extract-method.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/fix-deps.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/fix-grammar.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/fix-indent.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/fix-markup-valid.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/move-to-cookiecutter-latemp.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/refactoring.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/rename-vars.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/reproducible-builds.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/semantic-markup.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/update-ci-gen-travis-yml.txt
git ci -m 'Convert a page to tt2'
git ci -m 'Convert pages to tt2'
git ci -m 'add a commit msg'
git ci -m 'add a test'
git ci -m 'add docs'
git ci -m 'add more'
git ci -m 'add test'
git ci -m 'add to gitignore'
git ci -m 'add translation'
git ci -m 'appveyor isolate'
git ci -m 'bump version'
git ci -m 'cleanups'
git ci -m 'consolidate diffs w master'
git ci -m 'convert more pages to (x)html5'
git ci -m 'convert more pages to x/html5'
git ci -m 'css fix'
git ci -m 'css tweaks - mobile devices'
git ci -m 'enable more warnings'
git ci -m 'eslint'
git ci -m 'fix build'
git ci -m 'fix deps; apt no recommends'
git ci -m 'fix for new perltidy'
git ci -m 'fix formatting'
git ci -m 'fix tests'
git ci -m 'fixes'
git ci -m 'flake8-import-order compliance'
git ci -m 'html/css tweaks'
git ci -m 'html5 semantic markup'
git ci -m 'make portable - freebsd'
git ci -m 'make portable'
git ci -m 'make the html5 markup more semantic'
git ci -m 'merge some delta_states code'
git ci -m 'more cleanups: avoid braindead portability'
git ci -m 'more cleanups: avoid checking for portable stuff'
git ci -m 'more convert away from wml'
git ci -m 'optimization'
git ci -m 'package.json'
git ci -m 'perltidy'
git ci -m 'reduce more'
git ci -m 'refactor'
git ci -m 'refactoring'
git ci -m 'remove old'
git ci -m 'remove unused'
git ci -m 'reproducible builds'
git ci -m 'split unneeded deps for fastrender'
git ci -m 'still reproducing leak'
git ci -m 'tidyall'
git ci -m 'travis: fix #1 - add dep'
git ci -m 'travis: fix'
git ci -m 'try debug for appveyor'
git ci -m 'ui/ux and css tweaks'
git ci -m 'update'
git ci -m 'validate more'
git ci -m fix
git ci -m fixes
git ci -m optimize
git ci -t ~/conf/trunk/shlomif-settings/git/commit-messages/convert-var-to-slot.txt
git ci -t ~/conf/trunk/shlomif-settings/git/commit-messages/extract-method.txt
git ci -t ~/conf/trunk/shlomif-settings/git/commit-messages/refactoring.txt
git ci .
git ci shlomif-settings/Bash/
git ci shlomif-settings/vim-conf/
git clean -dxf .
git clean -dxf ..
git clean -dxf lib/cache/
git clean -dxf lib/docbook/
git clean -dxf lib/docbook/5/
git clean -dxf lib/presentations/qp/
git clean -dxf lib/presentations/qp/Website-Meta-Lecture/
git clean -dxf lib/presentations/spork/
git cnt
git co -b pr1
git co .
git co ..
git co fc-solve--deal-and-sol--preview
git co fix-tests
git co master
git co update-rand-gen
git co use-template-toolkit
git co web-fc-solve--animated-display
git com
git dh
git dh shlomif-settings/Bash/
git dh | gvim -
git dh | less
git dhs
git di
git di --stat master
git di --stat releases/wml-2.18.0..master
git di master
git di master | gvim -
git hub
git hub apply-pr 1
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
git log -p | gvim -
git log -p | head -1000 | gvim -
git log -p | less
git log .
git log . | less
git ls
git ls .
git ls-files t2 | grep wml | xargs touch
git ls-files t2/humour/bits/facts/ | grep wml | xargs touch
git mv t/tests/* t/
git p
git push
git push --all
git push --tags
git push -f
git push -u origin master
git push origin
git push upstream
git pushu
git rebase --continue
git rebase -i master
git rebase master
git remote -v
git reset .
git rm -r inc
git rm -r inc/
git rm abstract.txt
git s o
git s u
git s u blead
git show
git st
git st -s
git stash
git stash apply
git stash drop
git stash list
git stash pop
git submodule update --init --recursive
git tag -l
gmake
go get -u github.com/tdewolff/minify/cmd/minify
grep -F found ../l4.txt
grep -F found l2.txt
gringotts
gvim
gvim $(__this_theme_source )
gvim +Ack\ \'href=\"\\./'[^"\\#]'\'\ dest
gvim +mak
gvim -S a.sess
gvim -o $homepage/lib/make/main.mak lib/make/main.mak
gvim -o $homepage/lib/sass/style.scss lib/sass/style.scss
gvim -o .tidyallrc /home/shlomif/progs/perl/cpan/App/Sky/git/Sky-uploader/App-Sky/.tidyallrc
gvim -o .travis.yml /home/shlomif/Docs/homepage/homepage/trunk/.travis.yml
gvim -o .travis.yml /home/shlomif/Download/unpack/games/pysolfc/git/PySolFC/.travis.yml
gvim -o .travis.yml /home/shlomif/progs/freecell/git/fc-solve/.travis.yml
gvim -o 658/e658_v3.jl 658/658_v1.py
gvim -o README.md $homepage/t2/open-source/resources/israel/list-of-projects/index.xhtml.wml
gvim -o TheWML/Backends/*/Main.pm
gvim -o dist.ini /home/shlomif/progs/perl/cpan/Dir/Manifest/Dir-Manifest/p5/Dir-Manifest/dist.ini
gvim -o gen-helpers /home/shlomif/Docs/homepage/homepage/trunk/gen-helpers
gvim -o lib/App/HTML/PostProc/Gezer.pm
gvim -o lib/hunspell/whitelist1.txt Tests/valid-html-tidy.t
gvim -o lib/hunspell/whitelist1.txt Tests/valid-html-tidy.t Tests/gmake-unit.t
gvim -o lib/latemp/themes/sf.org1/template.wml lib/driver.wml
gvim -o lib/make/main.mak $homepage/lib/make/main.mak
gvim -o lib/sass/common-style.sass lib/sass/style.sass t2/index.xhtml.wml dest/post-incs/t2/index.xhtml
gvim -o lib/sass/common-style.scss lib/sass/style.scss t2/humour/TOWTF/index.xhtml.wml dest/post-incs/t2/humour/TOWTF/index.xhtml
gvim -o lib/sass/common-style.scss lib/sass/style.scss t2/meta/FAQ/index.xhtml.wml
gvim -o lib/sgml/shlomif-docbook/docbook-epub-preproc.xslt /usr/share/sgml/docbook/xsl-ns-stylesheets/epub/docbook.xsl
gvim -o src/js/fcs-validate.ts src/js/web-fc-solve-tests--fcs-validate.ts
gvim -o y.txt lib/hunspell/whitelist1.txt
gvim ../../scripts/Makefile.to-javascript.mak
gvim ../.appveyor.yml
gvim ../c-solver/CMakeLists.txt
gvim ../c-solver/black_hole_solver.c
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
gvim ../src/wml_test/run_test.pl
gvim .appveyor.yml
gvim .ci-gen.ini
gvim .gen-ci.bash
gvim .gitignore
gvim .travis.bash
gvim .travis.yml
gvim .vimrc
gvim .zshrc
gvim /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/bin/dnf-py-scan.bash
gvim 630-v1.py
gvim 654_v1.py
gvim 657/657_v1.py
gvim 658/658_v1.py
gvim 658/e657.py
gvim 662_v1.py
gvim 665_v1.py
gvim CI-testing/continuous-integration-testing.pl
gvim CONTRIBUTING.md
gvim ChangeLog
gvim Changes
gvim FAQ.mdwn
gvim HACKING.asciidoc
gvim LICENSE
gvim MANIFEST
gvim MANIFEST.SKIP
gvim META6.json
gvim Makefile
gvim Makefile.PL
gvim NEWS.asciidoc
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
gvim bin/gen-sect-nav-menus.pl
gvim bin/git-info
gvim bin/html-min-cli-config-file.conf
gvim bin/post-incs-v2.pl
gvim bin/post-incs.pl
gvim bin/private/backup-exclude-list.txt
gvim bin/private/backup-extra-exclude-list-for-rsync.net.txt
gvim bin/process.pl
gvim bin/rebuild
gvim bin/render
gvim bin/render-source.pl
gvim bin/render_v2-proto.pl
gvim bin/required-modules.yml
gvim bin/travis-ci-script.bash
gvim bin/tt-render.pl
gvim black_hole_solver.c
gvim blocks.tt2
gvim board_gen/make_pysol_freecell_board.py
gvim build.sh
gvim d
gvim debondt-compact-freecell-positions--document.asciidoc
gvim dest/js/qunit.js
gvim dist.ini
gvim e662-james-rauen.cpp
gvim euler-156-v2.pl
gvim euler-248-v1.py
gvim euler_474_v1.py
gvim f.json
gvim foo.txt
gvim fr.bash
gvim freecell.c
gvim gen-helpers
gvim generate_html.js
gvim gleitkommafreundefixed.pl
gvim h.bash
gvim index.erb
gvim index.html
gvim instance.h
gvim irc2.log
gvim j
gvim lib.c
gvim lib/App/Deps/Verify.pm
gvim lib/App/Git/Info.pm
gvim lib/App/HTML/PostProc/Gezer.pm
gvim lib/CI/Gen.pm6
gvim lib/Dir/Manifest.pm
gvim lib/Games/Solitaire/BlackHole/Solver/Golf/App.pm
gvim lib/MyNavData.pm
gvim lib/NavDataRender.pm
gvim lib/Shlomif/Spelling/FindFiles.pm
gvim lib/Test/PerlTidy.pm
gvim lib/babel/js/web-fc-solve-tests.js
gvim lib/docbook/5/indiv-nodes/rindolf-spec/index.xhtml
gvim lib/driver.wml
gvim lib/hunspell/whitelist1.txt
gvim lib/latemp/themes/sf.org1/template.wml
gvim lib/local-defs.wml
gvim lib/make/docbook/sf-homepage-db-gen.tt
gvim lib/make/main.mak
gvim lib/notes/quality-software--followup-2018.md
gvim lib/rest-of-template.wml
gvim lib/sass/style.sass
gvim lib/sass/style.scss
gvim lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-common.xsl
gvim lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-onechunk.xsl
gvim m.txt +cbuf
gvim m.txt +cbuf +cope
gvim main_cl_callback_common.h
gvim mniip.hs
gvim myrsync.bash
gvim perl5/Shlomif/Quad/Pres/CmdLine.pm
gvim pysollib/hint.py
gvim rakefile
gvim rpm-qa.txt
gvim run-tests.pl
gvim setup.py
gvim shlomif-settings/setup-all/setup-all.pl
gvim shlomif-sig-quotes.txt
gvim solve-more-3.bash
gvim src/charts/fc-pro--4fc-deals-solvability--report/index.html.wml
gvim src/charts/fc-pro--4fc-intractable-deals--report/chart-using-flot.ts
gvim src/download.html.wml
gvim src/faq.html.wml
gvim src/index.html.wml
gvim src/js-fc-solve/automated-tests/index.html.wml
gvim src/js-fc-solve/text/index.html.wml
gvim src/js/fcs-base-ui.ts
gvim src/js/solver-freecell.js
gvim src/js/web-fc-solve--expand-moves.ts
gvim src/js/web-fc-solve-tests.ts
gvim src/js/web-fc-solve-ui.ts
gvim src/js/web-fc-solve.ts
gvim src/my_htaccess.conf
gvim src/vnu_validator/__init__.py
gvim src/wml_test/run_test.pl
gvim state.c
gvim t
gvim t/01-basic.t
gvim t/01-use.t
gvim t/black-hole-output.t
gvim t/sort.t
gvim t2/art/index.xhtml.wml
gvim t2/humour/fortunes/sharp-programming.xml
gvim t2/humour/fortunes/show.cgi
gvim t2/index.xhtml.wml
gvim t2/me/rindolf/index.xhtml.wml
gvim t2/meta/FAQ/index.html.wml
gvim t2/open-source/resources/graphics-programs/index.xhtml.wml
gvim t2/open-source/resources/software-tools/index.xhtml.wml
gvim t2/personal.html.wml
gvim tech-diary.xhtml
gvim templates/index.html
gvim test.js
gvim tests/valid-html-tidy.t
gvim threaded_range_solver.c
gvim tslint.json
gvim ver.txt
gvim w.st
gvim weaver.ini
gvim wml_test/run_test.pl
gvim wrapper/Makefile
gvim wrapper/src/icu-with-prepost.js
gvim wrapper/src/usearch_wrapper.c
gvim y.txt
gvim ~/.gitconfig
gvim ~/.vimrc
gvim ~/f
gvim ~/inkscape-ext-tests.txt
gvim ~/o.txt
gvimdiff $homepage/bin/gen-sect-nav-menus.pl bin/gen-sect-nav-menus.pl
gvimdiff bad--solve-more-7-log.txt solve-more-7-log.txt
gvimdiff black_hole_solver_main.c black_hole_solver_resume_api_main.c
gvimdiff delta_states_debondt_impl.h delta_states_impl.h
gvimdiff dest/web-forums/index.html ../dest/web-forums/index.html
gvimdiff dest/web-forums/index.html ../dest/web-forums/index.html +colorscheme" apprentice" +"exe \"normal \\<c-w>J\""
gvimdiff j j2
gvimdiff src/js-fc-solve/find-deal/index.html.wml src/js-fc-solve/text/index.html.wml
gwenview
gwenview .
gwenview dest/images/fedora-logo.min.svg
hc
hebrew-keymap.sh
hexchat
hg ci -m 'add more'
hg ci -m 'dzil'
hg ci -m 'mark items as done'
hg clean --all
hg paths
hg pull
hg push
hg push git:../git
hg st
hg up
history
hm
html-minifier dest/pre-incs/t2/humour/index.xhtml 2>&1 | less
htop
i
i=0; while bash SPLIT_FCC/by-depth/2/active/AAAAAAAAAAAAAAAARA==/driver.bash ; do let i++ ; done ; echo $i
i=0; while bash SPLIT_FCC/by-depth/3/active/AAAAAAAAAAAAAAABFA==/driver.bash ; do let i++ ; done ; echo $i
ifconfig -a
inkscape
java -jar /home/shlomif/Download/unpack/net/www/validator/build/dist/vnu.jar --format gnu --verbose --Werror --skip-non-html /tmp/zjzj/ 2>&1 | tee f
java -jar /home/shlomif/Download/unpack/net/www/validator/build/dist/vnu.jar --format json --Werror --skip-non-html /tmp/zjzj 2>f.json
java -jar /home/shlomif/Download/unpack/net/www/validator/build/dist/vnu.jar --format json --Werror --skip-non-html d 2>&1 | json_pp - | gvim -
java -jar /home/shlomif/Download/unpack/net/www/validator/build/dist/vnu.jar --format json lib/presentations/qp/perl-for-newbies/4/all-in-one/index.html
java -jar build/dist/vnu.jar --skip-non-html ../dest-xh/
k
k5
kate
kate Backup/Arcs/emo.txt
kill %1
kmix
kpat
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
li
load_common du
ls
ls *.webm | shuf -n 15 | xargs -d '\n' vlc
ls *.webm | shuf -n 5 | xargs -d '\n' vlc
ls -l
ls -lh
ls -lrS
ls -lrt
ls -ltA
ls -rt
ls ..
ls BUILD
ls bin
ls foo/
ls reproducible-build-dir/run-t-*.bash
ls scripts
ls t
ls ~
lynx https://www.shlomifish.org/
lynx www.shlomifish.org
m
m 2>&1 | cat > /dev/null
m clean
m clean 2>&1 | cat > /dev/null
m clean all
make
make -f ../scripts/Makefile.gnu SRC_DIR=../source
make -f ../scripts/Makefile.gnu SRC_DIR=../source clean
make -f C_arraytest.mak
make -f modsum.mak
make -j4
make -j4 PROD=1 upload
make -j4 bzImage modules
make -j4 fastrender
make -j4 test
make -j5
make -j5 bzImage modules
make -j8
make -j8 install
make -j8 test
make -j8 upload
make -j8 upload_var
make -j9
make 0126-linuxexpo-amsterdam.en.html
make 2>&1 | gvim -
make 2>&1 | less
make 2>&1 | tee f
make DEST_BABEL_JSES.show
make PROD=0 upload_beta
make PROD=1
make PROD=1 fastrender
make PROD=1 upload
make PROD=1 upload_beta
make SKIP_EMCC=0 test
make VERBOSE=1 2>&1 | gvim -
make VERBOSE=1 > m.txt 2>&1
make all_deps
make all_games_html
make check
make clean
make dest/js/web-fc-solve-ui.js
make dist
make disttest
make docbook_extended
make docs
make edit
make foo
make gen_divs
make install
make lib/docbook/5/essays/The-Enemy-English-v7/all-in-one.xhtml
make lib/docbook/5/essays/foss-and-other-beasts-v3/all-in-one.xhtml
make manifest
make oldconfig
make oldtime
make package_source
make package_source && unxz wml-2.18.0.tar.xz && xz9 wml-2.18.0.tar && rm -fr wml-2.18.0 && tar -xvf wml-2.18.0.tar.xz && (cd wml-2.18.0 && ah)
make resumes
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
mkdir tests
mock $PWD/SRPMS/*.src.rpm
mono ./630-v1.exe
mono ./630-v1.exe 2>&1 | less
mplayer 01\ See\ Her\ Out.mp3
mpv --volume=50 --vo=null Music/mp3s/Playlist\ -\ Girls\ On\ The\ Rise/003-1353450-Bohemian\ Hideaway-Brave\ Soul\ _ft.\ Juliet\ Lyons_.ogg
mpv --volume=50 --wid=0 Music/mp3s/Shine\ 4U\ -\ Carmen\ and\ Camille-B8ehY5tutHs.mp4
mpv Music/mp3s/Playlist\ -\ Summer\ 2015/006\ -\ David\ Amber\ -\ Gnarly\ _feat.\ Devyn\ Rush_.ogg
mr st
mv du-new.txt du.txt
my_update
n
n -m foo
ninja
ninja -j1
ninja -j1 install
ninja -j4
ninja check
ninja clean
node test.js
node test.js && echo succ
node test.js 2>&1 | tee f
npm i
npm test
nvim
nvim -- dbm_solver.h
nvim -o e658log2par.txt 658/par2.bash
nvim ../source/CMakeLists.txt
nvim d1.c
nvim solve-more-7-gnupar.bash
nvim state.c
nvim-qt
nvim-qt -- -o TheWML/Backends/*/Main.pm
nvim-qt -- -o src/js/fcs-validate.ts src/js/web-fc-solve-ui.ts
nvim-qt -- dbm_solver.h
nvim-qt ../src/wml_test/t/build-process.t
nvim-qt d1.c
nvim-qt state.c
okteta libfreecell-solver.a
okular Humble-Bundle-Books-Linux-No-starch/howlinuxworks.pdf
p --tags
p upstream
patch -p1 < ~/g1.diff
perl -I ../source/t/lib ../source/scripts/horne-autoplay-board.pl 24.board
perl -Ilib bin/git-info info
perl -Ilib t/001_routes.t
perl -MCarp::Always -Ilib t/001_routes.t
perl -d bin/process.pl
perl -d bin/tt-render.pl
perl ../c-solver/run-tests.pl
perl ../run-tests.pl
perl ../scripts/cmd-line-compiler compile
perl ../scripts/cmd-line-compiler compile && m && y
perl ../scripts/multi_config_tests.pl ; n --msg 'fcs test'
perl ../source/run-tests.pl --glob='*qual*'
perl ../src/wml_test/run_test.pl
perl 658/summarize.pl
perl Build.PL
perl CI-testing/continuous-integration-testing.pl test
perl Makefile.PL
perl Makefile.PL && make disttest
perl Tests/spell-check--hebrew.t
perl apply-solve-more-3-log.pl
perl bin/clean-up-xhtml5.pl t2/lecture/Pres-Tools/Perl-Point/slide00*.htm
perl bin/gen-rpm-for-build-deps --modules-conf /home/shlomif/Docs/homepage/homepage/trunk/bin/required-modules.yml -o i
perl bin/gen-rpm-for-build-deps -o f.spec
perl bin/process.pl
perl bin/rel-links-parse.pl $(find post-dest/ -name '*.html' -o -name '*.xhtml')
perl bin/sort -n --head 5 t/data/sort/ints1.txt
perl bin/sort-check-spelling-file
perl bin/tt-render.pl
perl github-dashboard
perl script/tag-release.pl
perl scripts/tag-release.pl
perl shlomif-settings/setup-all/setup-all.pl
perl test.pl
perl tests/installation/bin/wml -
perl tests/installation/lib64/wml/exec/wml_p1_ipp
perl tests/installation/lib64/wml/exec/wml_p1_ipp -
perl ~/Backup/Arcs/proc2.pl
perl ~/proc.pl
perl6 ../scripts/fuzz-build.p6 --rb
perl6 ../scripts/fuzz-build.p6 --rb -g ; n -m gcc
perl6 ../scripts/fuzz-build.p6 -g ; n -m clang
perl6 ../scripts/fuzz-build.p6 -g ; n -m gcc
perl6 ../scripts/fuzz-build.p6 ; n -m clang
perlbrew list
perlbrew use perl-5.26.2
perlbrew use perl-5.28.0
perlbrew use perl-5.28.1
perldoc IO::All
perldoc Path::Tiny
pi-make-microsoft-freecell-board -t 1109 | ./fc-solve -l ve -mi 6468
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi -1
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi -1 | tail -3
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi 200000
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -mi 900000
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing -p -t -sam -sel -mi 200000
pi-make-microsoft-freecell-board -t 830910836 | fc-solve --load-config video-editing
pi-make-microsoft-freecell-board -t 90291042 | ./fc-solve --freecells-num 0 -to 0AB
pidgin
ping 192.168.1.1
ping www.google.com
pip3 install --upgrade --user .
pkill -9 gvim
pkill claws-mail
pkill gvim
pkill sshd
pm-suspend
prettier --parser scss --arrow-parens always --tab-width 4 --trailing-comma all --write lib/sass/*.scss
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write abc-path.ts
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write src/js/*.ts
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write src/js/fcs-validate.ts
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write src/js/web-fc-solve--expand-moves.ts
prettier --parser typescript --arrow-parens always --tab-width 4 --trailing-comma all --write src/js/web-fc-solve-tests--fcs-validate.ts
prompt fire
prove --timer Tests/case-insense-file-collision.t
prove Tests/validate-html-using-vnu.py 2>&1 | tee ~/f
prove euler-156-v2.t
prove shlomif-settings/tests/*.t
ps
ps axo pid,cmd,etime | grep make
pt
pwd
py.test-3 --pdb tests/test_gimp_xcf.py
py.test-3 --pdb tests/test_media_zip.py
py.test-3 --pdb tests/test_output_scour.py
py.test-3 tests/test_output_scour.py
pymode
pypy3 -i 658/658_v1.py
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
pypy3 e451_v2_step2.py
pypy3 e451_v2_step2.py | less
pypy3 euler-248-v1.py
pypy3 euler-248-v1.py | tee good
pypy3 euler_659_v1.py
pypy3 sums_of_powers.py
pysol
python build/build.py all
python build/build.py jar
python build/build.py test
python refactor1.py
python2 650-fakesson.py
python3 -i 658/658_v1.py
python3 -m trace --trace ../../source/t/t/several-iter-limits.py >f
python3 -mpdb Tests/validate-html-using-vnu.py
python3 -mpdb pysol.py
python3 ../../source/t/t/several-iter-limits.py
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
python3 Tests/validate-html-using-vnu.py
python3 bin/split-lwall-facts.py
python3 euler-248-v1.py
python3 gen-multiple-pysol-layouts --dir=deals/ --ms --prefix '' --suffix .board seq 1 32000
python3 pysol.py
python3 setup.py build
python3 setup.py sdist
python3 setup.py test
python3 setup.py test 2>&1 | gvim -
python3 setup.py test 2>&1 | tee ~/inkscape-ext-tests.txt
pythonsetup.py sdist
qmmp 01\ See\ Her\ Out.mp3
qtb
quadp render -a
r '- New version'
rake
rake prettier
rake test
reboot
rebuild
rebuild 2>&1 | tee ~/o.txt
rebuild 2>&1 | tee ~/o.txt ; n -m rebuild
rebuild ; n -m rebuild
rec .ORIG
rec .orig
regen
rehash
rej
reprb
rgm i
rgm perl6 e396_v1.p6
rgm t
rgm zef install --force-install .
rm *~
rm -f *.npy
rm -f *~
rm -f offload/fcs_queue*
rm -f t/verify-cache/*
rm -f t/verify-cache/nht.sha
rm -fr $TIDYALL_DATA_DIR
rm -fr *
rm -fr ../b
rm -fr ../build-1
rm -fr ../dest-xh ; cp -a ../wml/dest ../dest-xh
rm -fr .tidyall.d/
rm -fr B
rm -fr C*
rm -fr CM*
rm -fr RPMS/ SRPMS/ BUILD BUILDROOT/
rm -fr SPLIT_FCC
rm -fr _CPack_Packages
rm -fr b
rm -fr b/
rm -fr d
rm -fr dest/t2/humour/fortunes/
rm -fr node_modules
rm -fr perl-*
rm -fr post-dest/
rm -fr t2/ipp.*
rm -fr tests/installation
rm -fr ~/Backup/Arcs/post-dest/post-dest/
rm -vfr offload/deal*
rm Tests/data/cache/vnu-html-validator.json
rm a.out
rm backup.tar
rm du.txt
rm f
rm foo.txt
rm foo.txt y.txt
rm git.log
rm golfs6.txt
rm htdocs/index.html~
rm inkscape-ext-tests.txt
rm irc2.log
rm l
rm lib/cache/STAMP.one
rm lib/cache/STAMP.two
rm lib/docbook/5/essays/c-and-cpp-elements-to-avoid/all-in-one.xhtml
rm lib/docbook/5/essays/foss-and-other-beasts-v3/all-in-one.xhtml
rm lib/docbook/5/indiv-nodes/rindolf-spec/index.xhtml
rm log.txt
rm o.txt
rm y.txt
rpmbuild --undefine=_disable_source_fetch -ba /home/shlomif/progs/Rpms/SPECS/lepton.spec
rpmbuild --undefine=_disable_source_fetch -ba SPECS/diff-so-fancy.spec
rpmbuild --undefine=_disable_source_fetch -ba SPECS/gumbo.spec
rpmbuild -ba /home/shlomif/progs/Rpms/SPECS/cddlib.spec
rpmbuild -ba /home/shlomif/progs/Rpms/SPECS/cocoalib.spec
rpmbuild -ba /home/shlomif/progs/Rpms/SPECS/giac.spec
rpmbuild -ba /home/shlomif/progs/Rpms/SPECS/python-google-auth.spec
rpmbuild -ba SPECS/modules.spec
rpmbuild -ba f.spec
rshasum --digest=SHA-256
rsync -a dest/ docs/
rubocop -a ./Rakefile
rubocop -a Rakefile
rubocop ./Rakefile
rubocop Rakefile
ruby 1.rb
run
s
sd
sensors
setup
sha256sum freecell-solver-* libfreecell-solver.* | sha256sum -
shutter
sky up-r ../js
sky up-r js
source myrsync.bash
spectacle
ssh hostgator
ssh lap
ssh shlomif@perlish.org
startup
strace -f -o w.st wml -p1-3 -D CUR_YEAR=2019 social_contract.wml | less
strip -s *
sub
sudo -i
sudo /usr/bin/restart-unbound
sudo /usr/bin/start-mandrake-everytime
sudo dnf -y --refresh upgrade
sudo iotop
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
tidyall -a
time ./a.out
time ./e451.exe
time ./mniip
time /home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 630-v1.py
time /home/shlomif/Download/unpack/prog/python/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy3 650/650-v1.py
time gmake
time make
time make fastrender
time perl 15/15.pl
time perl 4.pl
time perl bin/tt-render.pl
time perl stats.pl 0fc-log.txt
time pypy 630-v1.py
time pypy3 6.py
time python3 630-v1.py
time python3 650/650-v1.py
time python3 e655-brob26.py
time pythone-brob.py
time rebuild
tmux
tmux a
tmux a -t 0
tmux ls
touch lib/docbook/5/xml/*
touch lib/template.wml
touch lib/template.wml lib/template5.wml
touch src/js/fcs-base-ui.ts
touch t2/*.wml
touch t2/humour/index.xhtml.wml
touch t2/index.xhtml.wml
touch t2/links.html.wml
ts
tsc --target es6 --moduleResolution node --module commonjs --outDir lib/for-node/js --rootDir src/js src/js/jq_qs.d.ts src/js/libfcs-wrap.d.ts src/js/web-fc-solve-tests.ts || echo fail
tsc --target es6 --moduleResolution node --module commonjs --outDir lib/for-node/js --rootDir src/js src/js/jq_qs.d.ts src/js/web-fc-solve-tests.ts || echo fail
u --buildrequires /home/shlomif/Download/unpack/Mageia/SPECS-only-for-deps/inkscape/SPECS/inkscape.spec
u --buildrequires /home/shlomif/Download/unpack/Mageia/SPECS-only-for-deps/kpat/SPECS/kpat.spec
u --buildrequires /home/shlomif/Download/unpack/mageia/SPECS-only-for-deps/kpat/SPECS/kpat.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/cocoalib.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/giac.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/python-aiohttp.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/python-autobahn.spec
u --buildrequires /home/shlomif/progs/Rpms/SPECS/python-sqlalchemy-migrate.spec
u /home/shlomif/progs/Rpms/RPMS/noarch/task-shlomif-homesite-0.0.1-1.mga7.noarch.rpm
u magpie
uas
uas --split-length
uas --split-length 1
ub
ulimit -c
uname -a
unset DBUS_SESSION_BUS_ADDRESS
unset HTML_VALID_VNU_JAR
unset MAKEFLAGS
unxz < golfs6.txt.xz| wc -c
unxz wml-2.18.0.tar.xz
up
up $(dzil authordeps)
uptime
ur
uu
valgrind -v ./black-hole-solve --game black_hole --display-boards --rank-reach-prune ../c-solver/t/data/26464608654870335080.bh.board.txt
valgrind ./fc-solve 24.board
valgrind board_gen/pi-make-microsoft-freecell-board -t 1
vim 658/summarize.pl
vim d2.c
vlc *.{mp3,flv,ogg,mp4,avi,wmv,mpg,MP3,m4a,wma,webm}
vlc Arcs/vlc-all.xspf
vlc Arcs/vlc25.xspf
vlc Arcs/vlc27.xspf
vlc Arcs/vlc32.xspf
vlc Arcs/vlc4.xspf
vlc Arcs/vlc5.xspf
vlc Arcs/vlc6.xspf
vlc Download/Video/*4U*
vlc Download/Video/David_Amber_-_Wild_Hearts__feat._Ashley_Jana_.ogg
wc -l Backup/Arcs/msdeals-sha.txt
wc -l o.txt
which fc-solve
which gcc
which gvim
which latemp-config
which nvim
which quadp
which sass
which wml
wml f
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
z
zef install --force-install .
zsh
~/apps/vagrant/2.1.5/vagrant up ; n -m vagrant
