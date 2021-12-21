# helper code for testing the 'mold' linker:
#
# https://github.com/rui314/mold/issues/159
#
# May not work for you.

code="set -e -x ; repo=~/progs/freecell/git/fc-solve ; if ! test -e \"\$repo\"; then mkdir -p \"\$(dirname \"\$repo\")\" ; git clone --recurse-submodules 'https://github.com/shlomif/fc-solve' \"\$repo\" ; fi ; cd \"\$repo\"  && rm -fr bmold && mkdir -p bmold && cd bmold && cmake ../fc-solve/source ; make ; export FCS_TEST_BUILD=0 ; unset HARNESS_OPTIONS TEST_JOBS ; valgrind ./fc-solve 24.board"


a='
[shlomif@telaviv1 ~]$ -t games/black-hole
shlomif[black-hole]:$c_src$ pwd
/home/shlomif/progs/games/black-hole-solitaire/trunk/black-hole-solitaire/c-solver
shlomif[black-hole]:$c_src$
'

code="set -e -x ; repo=~/progs/games/black-hole-solitaire/trunk ; if ! test -e \"\$repo\"; then mkdir -p \"\$(dirname \"\$repo\")\" ; git clone --recurse-submodules 'https://github.com/shlomif/black-hole-solitaire' \"\$repo\" ; fi ; cd \"\$repo\"  && rm -fr bmold && mkdir -p bmold && cd bmold && cmake ../black-hole-solitaire/c-solver ; make ; export FCS_TEST_BUILD=0 ; unset HARNESS_OPTIONS TEST_JOBS ; perl ../black-hole-solitaire/c-solver/run-tests.pl"


if test -n "$MOLD"
then
    "$MOLD" -run bash -c "$code"
else
    bash -c "$code"
fi
