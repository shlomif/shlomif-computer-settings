-t 0fc
-t dotfiles
-t euler
-t fcs
-t games/black-hole
-t games/pysol
-t homepage
-t qp
-t rpm/mag
-t wml/itself
. ~/bin/Dev-Path-Configs-Source-Me.bash
../scripts/Tatzer -l extra_speed2
../source/Tatzer -l n2t
./bwbasic fizz-buzz.bas | gvim -
./gen-helpers
./kpat
./node_modules/.bin/tsc abc-path.ts | gvim -
Cancel_reminder
NODE_PATH="`pwd`"/lib/for-node/js qunit-cli lib/for-node/test-code-emcc.js
PATH="/home/shlomif/apps/golang/bin:/home/shlomif/.local/bin:/home/shlomif/apps/test/wml/bin:$PATH"
VirtualBox
WD=awe startx
WD=cin startx
WD=gnome startx
WD=jwm startx
WD=lxde startx
WD=xfce startx
ah
b
b ; n --msg bm
ba
bash /home/shlomif/conf/build/gimp-git-all-deps.bash
bash /home/shlomif/conf/build/perl/install-to-apps-perl-modules.sh
bash /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/bin/trim-installed-rpms.bash
bash /home/shlomif/conf/trunk/shlomif-settings/home-bin-executables/shlomif-specific/reddit11-11.bash
bash bin/rebuild
bash ~/bin/backup-total.sh ; bash ~/bin/backup-extra-data.sh ; bash ~/bin/backup-total.sh ; bash ~/bin/backup-extra-data.sh ; n --msg "Backup finished"
c
c7
cd -
cd ..
cd lib/repos/Solitairey
ci -m '- Add BRs'
ci-generate
claws-mail
cmake -DWITH_GOLF_SOLVER=1 -DCMAKE_BUILD_TYPE=Release ../kpat
cpan-upload HTML-T5-0.001.tar.gz
cpanp -i App::cpanminus
cpanp -i Task::BeLike::SHLOMIF ; n -m cpan
cs
ct
d
date
df
did
dolphin ~/Music/dosd-mp3s/ ~/Music/mp3s/ ~/Download/Video/
du .
dzil authordeps | xargs cpan -i
dzil build
dzil release
dzil test --all
e
et
export PATH="/home/shlomif/apps/golang/bin:/home/shlomif/.local/bin:/home/shlomif/apps/test/wml/bin:$PATH"
export VIMSYNT=1
finish-server
firefox -no-remote
flake8 .
fmt
fmt && pt
fmt && t
fortune
git au
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/extract-method.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/fix-markup-valid.txt
git ci -F ~/conf/trunk/shlomif-settings/git/commit-messages/refactoring.txt
git ci -m 'add to gitignore'
git ci -m 'package.json'
git clean -dxf .
git clean -dxf ..
git clean -dxf lib/presentations/qp/
git co master
git dh
git dhs
git i
git log --stat
git log --stat | less
git log -p
git log -p | gvim -
git log -p | less
git log .
git log . | less
git push
git pushu
git rebase master
git s o
git s u
git stash
git stash pop
git tag -l
gvim
gvim +mak
gvim .gitignore
gvim .travis.yml
gvim Changes
gvim Tests/validate-html-using-vnu.py
gvim bin/gen-docbook-make-helpers.pl
gvim dist.ini
gvim lib/make/main.mak
hc
hebrew-keymap.sh
hexchat
hg pull
hg push
hg st
hm
ifconfig -a
k5
kate
ldd freecell-solver-multi-thread-solve
less .travis.yml
ls
ls -l
ls -lrS
ls -lrt
ls -rt
lynx www.shlomifish.org
m
make
make -j8
make PROD=1 upload
make clean
make install
make package_source
make test
make upload
make upload_beta
minicpan
p --tags
perl ../scripts/cmd-line-compiler compile && m && y
perl ../scripts/multi_config_tests.pl ; n --msg 'fcs test'
perl Makefile.PL
perl bin/sort-check-spelling-file
pi-make-microsoft-freecell-board -t 830910836 | ./fc-solve --load-config video-editing  -p -t -sam -sel -mi 200000
pidgin
ping www.google.com
pm-suspend
prove Tests/validate-html-using-vnu.py 2>&1 | tee ~/f
pt
pypy3 sums_of_powers.py
python build/build.py test
python3 Tests/validate-html-using-vnu.py
python3 setup.py build
python3 setup.py test
python3 setup.py test 2>&1 | gvim -
python3 setup.py test 2>&1 | tee ~/inkscape-ext-tests.txt
pythonsetup.py sdist
rake
rake prettier
rake test
rebuild
regen
rehash
rm -fr CM*
rm -fr RPMS/ SRPMS/ BUILD BUILDROOT/
rm -fr SPLIT_FCC
rpmbuild --undefine=_disable_source_fetch -ba /home/shlomif/progs/Rpms/SPECS/lepton.spec
run
sd
strip -s *
sub
sudo -i
svn di
svn st
t
tidyall -a
time pythone-brob.py
time rebuild
tmux
tmux a
tmux ls
ts
u /home/shlomif/progs/Rpms/RPMS/noarch/task-shlomif-homesite-0.0.1-1.mga7.noarch.rpm
uas --split-length
ub
uname -a
unset HTML_VALID_VNU_JAR
unset MAKEFLAGS
up
up $(dzil authordeps)
ur
uu
which quadp
xsltproc -v -o lib/docbook//indiv-nodes/case-for-drug-legalisation-v/ --stringparam docmake.output.format xhtml --stringparam docmake.output.path_to_root ../../ --stringparam docmake.output.work_in_progress '' lib/sgml/shlomif-docbook/xsl--stylesheets/shlomif-essays--xhtml.xsl lib/docbook//xml/case-for-drug-legalisation-v.xml
