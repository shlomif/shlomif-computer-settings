" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	1999 Jul 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc

filetype plugin indent on
set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers

" Changed by Shlomi Fish to a much bigger setting
set history=5000		" keep 5,000 lines of command line history
set ruler		        " show the cursor position all the time

"Display an incomplete command in the lower right corner of the Vim window,
" left of the ruler.
set showcmd

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Add Microsoft Windows-like behaviour
" Old habits die hard.
source $VIMRUNTIME/mswin.vim

" Make sure that indentation is 4 whitespace
set shiftwidth=4
" Cancelling because it causes problems in the file explorer (:E or whatever)
" retab 4
set tabstop=4
" Expand tabs to whitespace.
set expandtab

set backupdir=.,~/tmp,~/


" Set Incremental Search (I-Search)
set incsearch

" Make sure vim searches all the upper directories for the tags file.
" See: http://www.vim.org/tips/tip.php?tip_id=94
set tags=tags;/

" Create a new menu item to Convert to Website Meta Language
an 50.740 &Syntax.Convert\ to\ &WML       :so $VIMRUNTIME/syntax/2html.vim<CR>:%!wml_safe.pl<CR>

" Expand the syntax menu automatically
let do_syntax_sel_menu = 1
runtime! synmenu.vim
" aunmenu &Syntax.&Show\ individual\ choices

" Make the To-HTML conversion use CSS styles
let html_use_css = 1

autocmd BufNewFile,BufRead ~/progs/svn/*.[ch] so ~/conf/Vim/svn-dev.vim

function Dot_t_file_type()
    let fn = expand("<afile>")
    if (match(fn, "\\.arc\\.t$") >= 0)
        set filetype=arc
    elseif (match(fn, "\\.py\\(\\.t\\)\\?$") >= 0)
        set filetype=python
    else
        set filetype=perl
        compiler perlprove
    endif
    so ~/conf/Vim/perl-test-manage.vim
    map <F3> :call Perl_Tests_Count()<CR>
endfunction

" Clear the autocmd's from filetype.vim because it confuses t/*.t
autocmd! filetypedetect BufNewFile,BufRead *.t
autocmd BufNewFile,BufRead *.t call Dot_t_file_type() 
autocmd BufNewFile,BufRead ~/progs/freecell/*/t/*.py call Dot_t_file_type() 

autocmd BufNewFile,BufRead ~/Download/unpack/graphics/*.pdb set filetype=perl

set guifont=DejaVu\ Sans\ Mono\ 11

" Cancelling so the Hebrew keyboard won't be so bad.
" so ~/conf/Vim/hebrew.vim

" Hebrew settings:
map <F9> :set invrl<CR>
imap <F9> <ESC>:set invrl<CR>a

" To make sure Python file editing is tabbed according to 2 spaces
" in the subversion Python files.
autocmd BufNewFile,BufRead ~/progs/svn/*.py retab 2 | set shiftwidth=2

" To make sure gimp code can be styled correctly.
autocmd BufNewFile,BufRead ~/Download/unpack/graphics/Gimp/gimp-cvs/*.[ch] so ~/conf/Vim/gimp-dev.vim
autocmd BufNewFile,BufRead ~/Download/unpack/graphics/Gimp/plug-ins/gimp-ace/*.[ch] so ~/conf/Vim/gimp-dev.vim
" To make sure tabs in GIMP's change logs are really tabs as seems to be
" the general convention

autocmd BufNewFile,BufRead ~/Download/unpack/graphics/Gimp/gimp-cvs/*/ChangeLog set noexpandtab

" Make the Sure the Print Icon in the toolbar does not do anything.
" By default it prints the page without a prompt, which is annoying, because
" it is sometimes pressed accidently.
an 1.40 ToolBar.Print :echo "hello"<CR>
vnoremenu ToolBar.Print		:echo "hello"<CR>

" This is to prevent gvim from creating backup files under the GIMP
" directories which just confuses the GIMP.

autocmd BufNewFile,BufRead ~/.gimp-*.scm set nobackup

" This is to import the range-search commands.
" so ~/conf/Vim/range-search.vim
" so ~/conf/Vim/ack.vim

autocmd BufNewFile,BufRead */SConstruct set filetype=python

" This is to set the Template Toolkit stuff.
au BufNewFile,BufRead *.tt setf tt2
au BufNewFile,BufRead *.tt2 setf tt2
au BufNewFile,BufRead *.ttml setf tt2
au BufNewFile,BufRead ~/Download/unpack/kernel/* so ~/conf/Vim/kernel.vim
au BufNewFile,BufRead ~/progs/C/kernel/word-search/* so ~/conf/Vim/kernel.vim

" Work-related directives - may be somewhat confidential.
if filereadable("~/conf/Work/Vim/work.vim")
    au BufNewFile,BufRead ~/progs/Work/* so ~/conf/Work/Vim/work.vim
endif

" Personal details for perl-support
let g:Perl_AuthorName      = 'Shlomi Fish'
let g:Perl_AuthorRef       = 'SHLOMIF'
let g:Perl_Email           = 'shlomif@iglu.org.il'
let g:Perl_Company         = 'None'
let g:Perl_BraceOnNewLine  = "yes"

au BufNewFile,BufRead *.p6 setlocal filetype=perl6
au BufNewFile,BufRead *.io setlocal filetype=io

function Docbook_Scripts()
    so ~/conf/Vim/docbook/linuxjournal/mfuncs.vim
    so ~/conf/Vim/docbook/linuxjournal/maps.vim
    so ~/conf/Vim/docbook/linuxjournal/tagtmps.vim
    so ~/conf/Vim/docbook/linuxjournal/tfuncs.vim
endfunction

au BufNewFile,BufRead ~/Docs/Svn/Docs/*.xml call Docbook_Scripts()
au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/lib/docbook/xml/*.xml call Docbook_Scripts()

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/t2/art/recommendations/music/shlomi-fish-music-recommendations.xml so ~/conf/Vim/amazon-asin.vim

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/* set path=~/Docs/homepage/homepage/trunk/lib,~/Docs/homepage/homepage/trunk

" Remming out because let @f causes too many problems with special escapes

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/t2/humour/fortunes/*.xml map <F4> /<fortune id="<CR>f"l"tyi":!perl convert-aphorism.pl '<C-R>t'<CR>

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/t2/humour/fortunes/*.xml map <F5> /<raw><CR>:s!raw!quote!<CR>/<text><CR>:s!<lt>text>!<lt>p>!<CR>:s#<!\[CDATA\[##<CR>/^\]\]><CR>:s#\]\]>##<CR>k/<lt>\/text><CR>:s#<lt>/text>#<lt>/p>#<CR>/<\/raw><CR>:s!raw!quote!<CR>

au BufNewFile,BufRead ~/Docs/Diary/* so ~/conf/Vim/diary.vim

" For VILisp - http://www.vim.org/scripts/script.php?script_id=221

autocmd BufRead *.lsp,*.lisp so ~/Download/unpack/file/editors/vim/VIlisp-2.3/VIlisp.vim

let g:Perl_Shlomif_Settings_Loaded = 0

function Perl_Load_File()
    if g:Perl_Shlomif_Settings_Loaded == 0
        let g:Perl_Shlomif_Settings_Loaded = 1
        so ~/conf/Vim/shlomif-perl.vim
    endif
endfunction

autocmd FileType perl call Perl_Load_File()

autocmd BufNewFile,BufRead ~/progs/prolog/*.pl set filetype=prolog

autocmd BufNewFile,BufRead *.arc set filetype=arc

" mapping to be able to move to the left and the right windows 
" without needing to leave the Ctrl key.
map <C-W><C-Right> <C-W><Right>
map <C-W><C-Left> <C-W><Left>

" Cancel indentation on the Perl timeline's HTMLs.
autocmd BufNewFile,BufRead ~/Docs/programming/Perl/Timeline/*.html set indentexpr=

map <F8> :cn<CR>
map <F7> :cp<CR>

" Load the matchit it plugin which enhances the % for opening/closing
" XML/HTML tags/elements and stuff.
so $VIMRUNTIME/macros/matchit.vim

au BufNewFile,BufRead */screenplay-xml/txt/*.txt setlocal filetype=screenplay-text

function Set_to_Bash()
    let g:is_bash = 1
    set ft=sh
endfunction

autocmd BufNewFile,BufRead ~/progs/bash/completion/trunk/bash_completion/bash_completion call Set_to_Bash()
autocmd BufNewFile,BufRead ~/progs/bash/completion/trunk/bash_completion/cmds/* call Set_to_Bash()

autocmd BufNewFile,BufRead ~/progs/games/kakuro/trunk/*.rb so ~/conf/Vim/kakuro-ruby.vim

autocmd BufNewFile *.pl call Perl_Load_File() | :call Perl_New_Script()
autocmd BufNewFile *.pm call Perl_Load_File() | :call Perl_New_Module()

let perl_no_extended_vars=1

let g:surround_indent = 1

autocmd BufRead ~/progs/freecell/trunk/fc-solve/source/* map <F4> :!echo '<C-R><C-W>' >> ~/progs/freecell/trunk/fc-solve/source/scripts/ids-whitelist.txt<CR>

au BufNewFile,BufRead ~/progs/freecell/trunk/*.txt setfiletype asciidoc
au BufNewFile,BufRead ~/Docs/programming/Spark/*.txt setfiletype asciidoc
au BufNewFile,BufRead *.asciidoc.txt setfiletype asciidoc
au BufNewFile,BufRead ~/progs/perl/www/web-automation/perl-5-wiki/trunk/combust/*.txt setfiletype asciidoc

" So C-k.. will generate an ellipsis.
if has('multi_byte') | digraphs .. 8230 | endif

au FileType sass setlocal shiftwidth=4

" Local customisations
if filereadable("~/.local.vimrc.vim")
    so ~/.local.vimrc.vim
endif

