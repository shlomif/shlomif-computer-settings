" Create a new menu item to Convert to Website Meta Language
an 50.740 &Syntax.Convert\ to\ &WML       :so $VIMRUNTIME/syntax/2html.vim<CR>:%!wml_safe.pl<CR>

autocmd BufNewFile,BufRead ~/progs/svn/*.[ch] so ~/conf/Vim/svn-dev.vim

" To make sure Python file editing is tabbed according to 2 spaces
" in the subversion Python files.
autocmd BufNewFile,BufRead ~/progs/svn/*.py retab 2 | set shiftwidth=2

" To make sure tabs in GIMP's change logs are really tabs as seems to be
" the general convention
autocmd BufNewFile,BufRead ~/Download/unpack/graphics/Gimp/gimp-cvs/*/ChangeLog set noexpandtab

" This is to import the range-search commands.
" so ~/conf/Vim/range-search.vim
" so ~/conf/Vim/ack.vim

au BufNewFile,BufRead *.io setlocal filetype=io

function Docbook_Scripts()
    so ~/conf/Vim/docbook/linuxjournal/mfuncs.vim
    so ~/conf/Vim/docbook/linuxjournal/maps.vim
    so ~/conf/Vim/docbook/linuxjournal/tagtmps.vim
    so ~/conf/Vim/docbook/linuxjournal/tfuncs.vim
endfunction

au BufNewFile,BufRead ~/Docs/Svn/Docs/*.xml call Docbook_Scripts()
au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/lib/docbook/xml/*.xml call Docbook_Scripts()

" For VILisp - http://www.vim.org/scripts/script.php?script_id=221

" autocmd BufRead *.lsp,*.lisp so ~/Download/unpack/file/editors/vim/VIlisp-2.3/VIlisp.vim
autocmd BufNewFile,BufRead ~/progs/prolog/*.pl set filetype=prolog

autocmd BufNewFile,BufRead *.arc set filetype=arc

au BufNewFile ~/conf/svn/*.sh r ~/conf/svn/sample.sh | 1d
