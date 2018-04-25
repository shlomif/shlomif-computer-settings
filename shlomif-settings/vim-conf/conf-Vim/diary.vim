" Write the template for a new entry.

map <buffer> <F2> i<CR><CR><div class="entry" id=""><CR><CR><h2><CR><ESC>!$date +\%Y-\%m-\%d<CR>k$Jx$a: <ESC>mda</h2><CR><CR><CR></div><CR><ESC>`da

function! Create_Blog_Entry_With_Tags()
    map <buffer> <F2> i<CR><CR><div class="entry" id=""><CR><CR><!-- Tags: --><CR><CR><h2><CR><ESC>!$date +\%Y-\%m-\%d<CR>k$Jx$a: <ESC>mda</h2><CR><CR><CR></div><CR><ESC>`da
endfunction

" Write a <p> tag.
map <buffer> <LocalLeader>p i<CR><p><CR><CR></p><CR><ESC>kkko

" Write an <li> tag.
map <buffer> <LocalLeader>li i<CR><li><CR><CR><p><CR><CR></p><CR><CR></li><CR><ESC>kkkkko

if (match(expand("%:p"), ("^" . expand("$HOME") . "/Docs/Diary/\\(tech\\|[^/]+\.html\$\\)")) >= 0)
    call Create_Blog_Entry_With_Tags()
endif
