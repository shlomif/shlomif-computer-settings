" Things Shlomi Fish ( http://www.shlomifish.org/ ) wants in his Perl Vim 
" configuration.
"

" The MIT X11 Licensing Blurb.
source ~/conf/Vim/mit-x11.vim

function Perl_Switch_Syntax()
    let current = &syntax
    if current ==# "pod"
        call SetSyn("perl")
    elseif current ==# "perl"
        call SetSyn("pod")
    endif
endfunction

function Perl_New_Script()
    0read ~/conf/Vim/texts/shebang.pl
    normal G
    read ~/conf/Vim/texts/use-strict-warning.pm
    normal G
endfunction

function Perl_New_Module()
    0read !perl ~/conf/Vim/texts/get-package.pl %
    normal G
    read ~/conf/Vim/texts/use-strict-warning.pm
    normal G
endfunction

function Perl_New_Test_Program()
    call Perl_New_Script()
    normal G
    read ~/conf/Vim/texts/test-skeleton.pl
endfunction

map <F2> :call Perl_Switch_Syntax()<CR>

