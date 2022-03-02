# helper code for testing the 'mold' linker:
#
# https://github.com/rui314/mold/issues/159
#
# May not work for you.


code="set -e -x ; repo=~/progs/freecell/git/fc-solve ; export FCS_SRC_PATH=\"$repo/fc-solve/solve\" ; if ! test -e \"\$repo\"; then mkdir -p \"\$(dirname \"\$repo\")\" ; git clone --recurse-submodules 'https://github.com/shlomif/fc-solve' \"\$repo\" ; fi ; cd \"\$repo\"  && rm -fr bmold && mkdir -p bmold && cd bmold && cmake ../fc-solve/source ; make ; make boards ; export FCS_TEST_BUILD=0 ; _f() { unset FCS_TEST_CLANG_FORMAT FCS_USE_TEST_RUN HARNESS_OPTIONS TEST_JOBS; } ; _f ; valgrind ./fc-solve 24.board ; perl ../fc-solve/source/run-tests.pl"


a='
[shlomif@telaviv1 ~]$ -t games/black-hole
shlomif[black-hole]:$c_src$ pwd
/home/shlomif/progs/games/black-hole-solitaire/trunk/black-hole-solitaire/c-solver
shlomif[black-hole]:$c_src$
'

if test a = b
then
    code="set -e -x ; repo=~/progs/games/black-hole-solitaire/trunk ; if ! test -e \"\$repo\"; then mkdir -p \"\$(dirname \"\$repo\")\" ; git clone --recurse-submodules 'https://github.com/shlomif/black-hole-solitaire' \"\$repo\" ; fi ; cd \"\$repo\"  && rm -fr bmold && mkdir -p bmold && cd bmold && cmake ../black-hole-solitaire/c-solver ; make ; export FCS_TEST_BUILD=0 ; unset HARNESS_OPTIONS TEST_JOBS ; perl ../black-hole-solitaire/c-solver/run-tests.pl"

fi

if test -n "$MOLD"
then
    "$MOLD" -run bash -c "$code"
else
    bash -c "$code"
fi
