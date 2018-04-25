function! Homepage_Grep()
    !bash bin/t2_find_ascii_quotes.bash
    e results.txt | cbuf | cope
endfunction
