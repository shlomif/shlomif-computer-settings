if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead ~/progs/freecell/git/*/AUTHORS.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/freecell/git/*/COPYING.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/freecell/git/*/DONE.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/freecell/git/*/HACKING.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/freecell/git/*/INSTALL.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/freecell/git/*/NEWS.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/freecell/git/*/README.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/freecell/git/*/README.win32.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/freecell/git/*/TODO.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/freecell/git/*/USAGE.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/Docs/programming/Spark/*.txt setfiletype asciidoc
    au! BufNewFile,BufRead *.asciidoc.txt setfiletype asciidoc
    au! BufNewFile,BufRead ~/progs/perl/www/web-automation/perl-5-wiki/trunk/combust/*.txt setfiletype asciidoc
augroup END
