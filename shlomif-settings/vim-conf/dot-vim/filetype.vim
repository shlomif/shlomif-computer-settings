function! Set_to_Asciidoc()
    setfiletype asciidoc
endfunction

if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
    let filenames = ["AUTHORS.txt", "COPYING.txt", "DONE.txt", "HACKING.txt", "INSTALL.txt", "NEWS.txt", "README.win32.txt", "TODO.txt", "USAGE.txt"]
    for fn in filenames
        execute "au! BufNewFile,BufRead ~/progs/freecell/git/*/".fn." call Set_to_Asciidoc()"
    endfor
    au! BufNewFile,BufRead ~/Docs/programming/Spark/*.txt call Set_to_Asciidoc()
    au! BufNewFile,BufRead *.asciidoc.txt call Set_to_Asciidoc()
    au! BufNewFile,BufRead ~/progs/perl/www/web-automation/perl-5-wiki/trunk/combust/*.txt call Set_to_Asciidoc()
augroup END
