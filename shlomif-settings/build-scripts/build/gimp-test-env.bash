# See:
# https://gitlab.gnome.org/GNOME/gimp/-/issues/2884
export GIMP_TESTING_ABS_TOP_SRCDIR="`pwd`"
export GIMP_TESTING_ABS_TOP_BUILDDIR="`pwd`"
export GIMP_TESTING_PLUGINDIRS="$GIMP_TESTING_ABS_TOP_BUILDDIR/plug-ins/common"
export GIMP_TESTING_PLUGINDIRS_BASENAME_IGNORES=mkgen.pl
export DISPLAY=":1.0"
# gdb app/tests/.libs/test-ui
# (gdb) run
# [… the test will run, then when the test binary crashes: ]
# (gdb) backtrace
