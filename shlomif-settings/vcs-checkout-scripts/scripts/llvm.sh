#! /bin/sh
#
# llvm.sh
# Copyright (C) 2018 shlomif <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

svn co http://llvm.org/svn/llvm-project/llvm/trunk
(
    cd trunk/tools
    svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
)
(
    cd trunk/tools/clang/tools
    svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra
)
(
    cd trunk/projects
    svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
)
