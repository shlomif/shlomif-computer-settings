" Author: Shlomi Fish
" Homepage: http://www.shlomifish.org/
" Email: shlomif@cpan.org
" Date: 27 February 2012
" License: MIT X11 ( http://www.opensource.org/licenses/mit-license.php )
" Version: 0.2.0
"
" Motivation for this plugin:
" ---------------------------
"
" When searching through code I often found that I need to add more related
" terms to the search. For example, if I found a call to a function inside
" a different one, or when a type is typedef'ed to something else (in C).
" This module aims to allow you to convenietly add search terms to the search
" so you can find all the occurences of all of them.
" To use: put this in ~/.vim/plugin/ 
"
" Then you can type <Leader>** to add a search term to the search (mnemonic -
" * is the namespace and '*' searches forward for a keyword.

function! Append_pat_to_search(mypat)
    let @/ = @/ . '\|' . a:mypat
endfunction

" This recipe is based on:
"
" http://stackoverflow.com/questions/7093397/vim-equivalent-of-preg-quote-and-quotemeta
function! Quotemeta(mypat)
    return '\V' . substitute(a:mypat,'\\','\\\\','g') . '\m'
endfunction

function! Append_keyword_to_search(mypat)
    call Append_pat_to_search('\<' . Quotemeta(a:mypat) . '\>')
endfunction

function! Add_keyword_search_generic(search_cmd, return_cmd)
    let existing_pat = @/
    let save_cursor = getpos('.')
    " Might generate an error when :set nowrapscan is on because it reached
    " the end of the document. So we're always setting the option to 
    " 'wrapscan'.
    let orig_nowrapscan = &l:wrapscan
    if !orig_nowrapscan
        setlocal wrapscan
    endif
    execute a:search_cmd
    if !orig_nowrapscan
        setlocal nowrapscan
    endif
    let new_pat = @/
    let @/ = existing_pat
    call Append_pat_to_search(new_pat)
    call setpos('.', save_cursor)
    return a:return_cmd
endfunction

function! Star_add()
    return Add_keyword_search_generic("normal *",  "normal /\r\n")
endfunction

function! Octothorpe_add()
    return Add_keyword_search_generic("normal #", "normal ?\r\n")
endfunction

" We evaluate the function return due to:
" * http://groups.google.com/group/vim_dev/browse_thread/thread/2c692024bbd47187
" * :help function-search-undo
map <Leader>** :execute Star_add()<CR>
map <Leader>*# :execute Octothorpe_add()<CR>
map <Leader>## :execute Octothorpe_add()<CR>

" Changelog:
"
" 0.2.0:
"   first release.
"
" 0.2.1:
"   handling nowrapscan gracefully.
