function! Add_MIT_X_License()
    normal G
    read ~/conf/Vim/texts/mit-x11-perl.pod
    %s/\${VIM_YYYY}/\=strftime("%Y")/
    normal G
endfunction

command! AddX11License :call Add_MIT_X_License()
