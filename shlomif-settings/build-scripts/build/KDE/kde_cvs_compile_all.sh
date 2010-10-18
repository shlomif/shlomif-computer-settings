#!/bin/sh

# this script will compile all dirs the modules
# needed, write a log file, and then shut down the computer.
#
#


# what commands to execute?
COMPILE_QT=0

DO_CVSUP=1
DO_CVSCLEAN=0
DO_CONFIGURE=1
DO_MAKE_CLEAN=0
DO_MAKE_CVS=1
DO_MAKE=1
DO_INSTALL=1

# what to compile?
#export LIBS_TO_COMPILE=" arts kdelibs kdebase kdeartwork kdegames kdegraphics kdemultimedia kdenetwork kdepim kdesdk kdeutils koffice "
export LIBS_TO_COMPILE="  kdelibs kdebase kdepim kdesdk kdeartwork koffice kdeadmin "

#paths for installation
export KDEDIR=/usr/local/apps/kde-3.2
export QTDIR=/usr/local/apps/qt-3.2
#export QTDIR=/usr/local/qt
export LD_LIBRARY_PATH=$QTDIR/lib:$KDEDIR/lib:$LD_LIBRARY_PATH
export PATH=$QTDIR/bin:$KDEDIR/bin:$PATH
OUTPUT_DIR=`pwd`/logs

# cvs server
export CVSROOT=:pserver:iastrubni@cvs.kde.org:/home/kde
export LANGUAGE=en

# compile + link flags
#export CXXFLAGS="-falign-functions=4 -fomit-frame-pointer -mfancy-math-387 -mcpu=athlon-xp -O3 -Os -pipe -mmx -mmx2 mfpmath=sse -msse -m3dnow"
#export CXXFLAGS="-falign-functions=4 -fomit-frame-pointer -mfancy-math-387 -mcpu=athlon-xp -O3 -Os -pipe "
#export CFLAGS=$CXXFLAGS
export LDFLAGS="-z combreloc"


rm -f $OUTPUT_DIR/*.log
clear

if [[ $COMPILE_QT = 1 ]]; then

	# first compile qt as a stand alone process
	echo Compiling QT
	echo Compiling QT 	>> $OUTPUT_DIR/work.log
	date 			>> $OUTPUT_DIR/work.log

	pushd `pwd`
	cd $QTDIR

	export QTDIR=`pwd`

	echo yes |              \
	./configure             \
	    -enable-opengl      \
	    -disable-debug      \
	    -shared             \
	    -qt-gif             \
	    -thread             \
	    -sm                 \
	    -system-zlib        \
	    -system-libpng  	\
	    -system-jpeg            


	make
	
	echo `pwd`

	sleep 10	
	popd

	echo Finished compiling QT
	echo `date` QT was compiled 		>> $OUTPUT_DIR/work.log
	echo 					>> $OUTPUT_DIR/work.log
	echo Finished compiling QT
fi


for package in $LIBS_TO_COMPILE
do
    echo Compiling package : $package
    echo `date` [$package] compilation start			>> $OUTPUT_DIR/work.log

    cd $package

    if [[ $DO_CVSUP = 1 ]]; then
	echo "updating cvs ($package)"
	echo `date` [$package] updating cvs  			>> $OUTPUT_DIR/work.log
	cvs update -dP						>& $OUTPUT_DIR/$package-cvsup.log
    fi

    if [[ $DO_CVSCLEAN = 1 ]]; then
	echo `date` [$package] configuring, before cleanning 	>> $OUTPUT_DIR/work.log    
	echo configuring before make cvsclean			>> $OUTPUT_DIR/$package-cvsclean.log
	echo 							>> $OUTPUT_DIR/$package-cvsclean.log
	rm -f -r admin
	ln -s ../kde-common/admin .
	make -f admin/Makefile.common				>& $OUTPUT_DIR/$package-makecvs.log
	./configure						>& $OUTPUT_DIR/$package-cvsclean.log
	
	echo "make cvsclean ($package)"
	echo now make cvsclean               			>> $OUTPUT_DIR/$package-cvsclean.log
	echo 							>> $OUTPUT_DIR/$package-cvsclean.log
	echo `date` [$package] cleanning cvs files  		>> $OUTPUT_DIR/work.log
	make cvs-clean		 				>& $OUTPUT_DIR/$package-cvsclean.log
    fi

    if [[ $DO_MAKE_CVS = 1 ]]; then
	echo "make config ($package)"
	echo `date` [$package] make cvs	  			>> $OUTPUT_DIR/work.log
	rm -f -r admin
	ln -s ../kde-common/admin .
	make -f admin/Makefile.common				>& $OUTPUT_DIR/$package-makecvs.log
    fi

    if [[ $DO_CONFIGURE = 1 ]]; then
	echo "configure ($package)"
	echo `date` [$package] configuring			>> $OUTPUT_DIR/work.log

	#    rm -f config.cache
	./configure --disable-debug		\
	       --prefix=$KDEDIR  		\
	       --enable-debug			\
	       --with-qtdir=$QTDIR				>& $OUTPUT_DIR/$package-configure.log

    fi

    if [[ $DO_MAKE_CLEAN = 1 ]]; then
	echo "make clean ($package)"
	echo `date` [$package] cleanning			>> $OUTPUT_DIR/work.log
	make clean						>& $OUTPUT_DIR/$package-makeclean.log
    fi

    if [[ $DO_MAKE = 1 ]]; then
	echo "make ($package)"
	echo `date` [$package] making				>> $OUTPUT_DIR/work.log
	make 							>& $OUTPUT_DIR/$package-make.log
    fi

    if [[ $DO_INSTALL = 1 ]]; then
	echo "make install ($package)"
	echo `date` [$package] installing			>> $OUTPUT_DIR/work.log
	make install  						>& $OUTPUT_DIR/$package-install.log
    fi

    echo Finished installing $package
    echo `date` [$package] all done				>> $OUTPUT_DIR/work.log
    echo			 				>> $OUTPUT_DIR/work.log

    cd ..
done

echo -----------------------------------			>> $OUTPUT_DIR/work.log
echo `date` : compilation ended		>> $OUTPUT_DIR/work.log

# shutdown -h now

