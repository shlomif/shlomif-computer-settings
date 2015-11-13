" perl-test-manage.vim - keeps track of the number of tests in a Perl test
" file (t/*.t) by counting '# TEST' comments.
"
" In order to keep track of the number of tests you need to have a statement
" like:
"
"     use Test::More tests => 20
"
" at the beginning of the test file. Then you need to make sure, every test
" has a corresponding '# TEST' comment. If you run several tests in a loop,
" you can append asterisks plus number to the comment. So for example the
" comment:
"
"     # TEST*3*5
"
" will add 15 tests to the test number.
"
" There's more to that - one can define variables and use them in the
" arithmetic expressions. For more information see:
"
" http://search.cpan.org/dist/Test-Count/
"
" Which needs to be installed before this plugin can be used.
"
" To use this file place it on your file-system, include it (at least for
" perl test files) and optionally bind a key to call Perl_Tests_Count(). I
" have the following in my .vimrc file, for that:
"
" autocmd BufNewFile,BufRead *.t so ~/conf/Vim/perl-test-manage.vim
" autocmd BufNewFile,BufRead *.t map <F3> :call Perl_Tests_Count()<CR>
"
" Author: Shlomi Fish
" Homepage: http://www.shlomifish.org/
" Date: 02 December 2004
" License: MIT X11
"

" function! Perl_Tests_Count()
"     execute "%!perl -MTest::Count::Filter::ByFileType::App -e \"run()\" -- --ft=".&filetype
" endfunction

function! Perl_Tests_Count()
    execute '!perl' '-MTest::Count::FileMutator::ByFileType::App' '-e' '"run()"' '--' "--ft=" . &filetype '%'
endfunction

