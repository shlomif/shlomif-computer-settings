" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

if has("autocmd")
 augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For C and C++ files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd FileType *      set formatoptions=tcql nocindent comments&
  autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
 augroup END

 augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files
  "	  read:	set binary mode before reading the file
  "		uncompress text in buffer after reading
  "	 write:	compress file after writing
  "	append:	uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre	*.gz set bin
  autocmd BufReadPost,FileReadPost	*.gz let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost	*.gz set nobin
  autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")

  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r

  autocmd FileAppendPre			*.gz !gunzip <afile>
  autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
  autocmd FileAppendPost		*.gz !gzip <afile>:r
 augroup END
endif

" Some useless templates.
"
" map <F8> :r /home/shlomi/Docs/lecture/html/texts/mycode.html<CR>
map <F8> :r /home/shlomi/Docs/lecture/Gimp/slides/mydemo.html<CR>
" map <F4> :r /home/shlomi/Docs/lecture/Gimp/slides/menupath.html<CR>
map <F4> :r /home/shlomi/Docs/Univ/Homework/SICP/homework/SICP/hw5/mycode.txt<CR><CR>
" map <F6> :r /home/shlomi/Docs/lecture/Gimp/slides/h3_notbold.html<CR>

autocmd BufNewFile,BufRead ~/Docs/Svn/homework/*.tex set encoding=iso8859-8

function! Prolog_Cancel()
    echo 'Hello'
    autocmd! BufNewFile *.pl
endfunction

autocmd BufNewFile,BufRead ~/progs/prolog/*.pl call Prolog_Cancel()

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
