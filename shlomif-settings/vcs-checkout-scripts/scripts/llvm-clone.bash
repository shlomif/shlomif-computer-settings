# set -e -x
set -x
export TOP_LEVEL_DIR=`pwd`
git clone https://github.com/llvm-project/llvm-project-20170507/ llvm-project
cd llvm-project
git config branch.master.rebase true

