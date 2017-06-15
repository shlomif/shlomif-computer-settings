" Based on 'An example for a vimrc file.' by Bram Moolenaar
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
"  - cancelled so old habits will die
" source $VIMRUNTIME/mswin.vim

" Make sure that indentation is 4 whitespace
set shiftwidth=4
" Cancelling because it causes problems in the file explorer (:E or whatever)
" retab 4
set tabstop=4
" Expand tabs to whitespace.
set expandtab

set backupdir=.,~/tmp,~/

" avoid handling 0.007 / etc. version numbers as octal
set nrformats=bin,hex

function File_Is_Readable(fn)
    return filereadable(fnamemodify(a:fn, ":p"))
endfunction

" Set Incremental Search (I-Search)
set incsearch

" Make sure vim searches all the upper directories for the tags file.
" See: http://www.vim.org/tips/tip.php?tip_id=94
set tags=tags;/

set runtimepath+=~/.vim/vim-addon-manager/
set nomore
let g:vim_addon_manager = {}
let g:vim_addon_manager.auto_install = 1
let g:vim_addon_manager.shell_commands_run_method = 'system'
" Removed: unite
" Removed: c%213
" Removed: 'github:bogado/file-line',
" https://github.com/thinca/vim-quickrun
call vam#ActivateAddons([
    \ 'Add_to_Word_Search',
    \ 'Command-T',
    \ 'The_NERD_tree',
    \ 'UltiSnips',
    \ 'VimClojure',
    \ 'a',
    \ 'ack',
    \ 'closetag',
    \ 'ctrlp',
    \ 'github:aaronbieber/quicktask',
    \ 'github:alessandroyorba/alduin',
    \ 'github:godlygeek/csapprox',
    \ 'github:honza/vim-snippets',
    \ 'github:ironcamel/vim-script-runner',
    \ 'github:junegunn/fzf',
    \ 'github:junegunn/fzf.vim',
    \ 'github:leafgarland/typescript-vim',
    \ 'github:mattn/emmet-vim',
    \ 'github:nvie/vim-flake8',
    \ 'github:pboettch/vim-cmake-syntax',
    \ 'github:thinca/vim-quickrun',
    \ 'github:vim-perl/vim-perl',
    \ 'hg:https://shlomif@bitbucket.org/shlomif/vim-screenplay-text',
    \ 'matchit.zip',
    \ 'range-search',
    \ 'repeat',
    \ 'spec%98',
    \ 'surround',
    \ 'textobj-rubyblock',
    \ 'textobj-user',
    \ 'vcscommand',
    \ 'xml',
    \ ],
    \ {'auto_install': 1, 'shell_commands_run_method': "system",})
set more

" Create a new menu item to Convert to Website Meta Language
an 50.740 &Syntax.Convert\ to\ &WML       :so $VIMRUNTIME/syntax/2html.vim<CR>:%!wml_safe.pl<CR>

" Expand the syntax menu automatically
let do_syntax_sel_menu = 1
runtime! synmenu.vim
" aunmenu &Syntax.&Show\ individual\ choices

" Make the To-HTML conversion use CSS styles
let html_use_css = 1

" This is so the indent inside the arguments/parameters of function calls will
" be indented 4 spaces to the right instead of 8.
set cinoptions+='(4,W4,b1,=0,m1'

autocmd BufNewFile,BufRead ~/progs/svn/*.[ch] so ~/conf/Vim/svn-dev.vim

function Dot_t_file_type()
    let fn = expand("<afile>")
    if (match(fn, "\\.arc\\.t$") >= 0)
        set filetype=arc
    elseif (match(fn, "\\.c\\(\\.t\\)\\?$") >= 0)
        set filetype=c
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
autocmd BufNewFile,BufRead ~/progs/freecell/*/t/*.c call Dot_t_file_type()

autocmd BufNewFile,BufRead ~/Download/unpack/graphics/*.pdb set filetype=perl

set guifont=DejaVu\ Sans\ Mono\ 10

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
autocmd BufNewFile,BufRead ~/.gimp-*.py set nobackup

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
if File_Is_Readable("~/conf/Work/Vim/work.vim")
    so ~/conf/Work/Vim/work.vim
endif

" Personal details for perl-support
let g:Perl_AuthorName      = 'Shlomi Fish'
let g:Perl_AuthorRef       = 'SHLOMIF'
let g:Perl_Email           = 'shlomif@shlomifish.org'
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

function Homepage_Customisation()
    set path=~/Docs/homepage/homepage/trunk/lib,~/Docs/homepage/homepage/trunk
    " so ~/conf/Vim/homepage.vim

    " see http://vim.1045645.n5.nabble.com/How-do-one-open-files-for-editing-from-a-function-td1153531.html for why.
    if !exists("*Homepage_Grep_Results")
        function Homepage_Grep_Results()
            e ascii_quotes_results.txt | cbuf | cope
        endfunction
    endif
    if !exists("*Homepage_Grep")
        function Homepage_Grep()
            !bash bin/t2_find_ascii_quotes.bash
            call Homepage_Grep_Results()
        endfunction
    endif

    command! HGrep call Homepage_Grep()
    command! Hcope call Homepage_Grep_Results()
endfunction

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/* call Homepage_Customisation()

" Remming out because let @f causes too many problems with special escapes

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/t2/humour/fortunes/*.xml map <F4> /<fortune id="<CR>f"l"tyi":!perl convert-aphorism.pl '<C-R>t'<CR>

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/t2/humour/fortunes/*.xml map <F5> /<raw><CR>:s!raw!quote!<CR>/<text><CR>:s!<lt>text>!<lt>p>!<CR>:s#<!\[CDATA\[##<CR>/^\]\]><CR>:s#\]\]>##<CR>k/<lt>\/text><CR>:s#<lt>/text>#<lt>/p>#<CR>/<\/raw><CR>:s!raw!quote!<CR>

au BufNewFile,BufRead ~/Docs/Diary/* so ~/conf/Vim/diary.vim

" For VILisp - http://www.vim.org/scripts/script.php?script_id=221

" autocmd BufRead *.lsp,*.lisp so ~/Download/unpack/file/editors/vim/VIlisp-2.3/VIlisp.vim

let g:Perl_Shlomif_Settings_Loaded = 0

" Prevent perl from highlighting POD inside which is annoying for
" commented-out blocks and stuff like that. See /syntax/perl.vim
let perl_include_pod = 0

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
au BufNewFile,BufRead *.screenplay-text.txt setlocal filetype=screenplay-text

function Set_to_Bash()
    let g:is_bash = 1
    set ft=sh
endfunction

autocmd BufNewFile,BufRead ~/progs/bash/completion/trunk/bash_completion/bash_completion call Set_to_Bash()
autocmd BufNewFile,BufRead ~/progs/bash/completion/trunk/bash_completion/cmds/* call Set_to_Bash()

autocmd BufNewFile,BufRead ~/progs/games/kakuro/trunk/*.rb so ~/conf/Vim/kakuro-ruby.vim

autocmd BufNewFile *.pl call Perl_Load_File() | :call Perl_New_Script()
autocmd BufNewFile *.pm call Perl_Load_File() | :call Perl_New_Module()
autocmd BufNewFile */t/*.t call Perl_Load_File() | :call Perl_New_Test_Program()

let perl_no_extended_vars=1

let g:surround_indent = 1

" autocmd BufRead ~/progs/freecell/trunk/fc-solve/source/* map <F4> :!echo '<C-R><C-W>' >> ~/progs/freecell/trunk/fc-solve/source/scripts/ids-whitelist.txt<CR>

if has('multi_byte')
    " So C-k.. will generate an ellipsis.
    digraphs .. 8230
    " So C-k,, will generate a Hebrew opening double-quotes
    digraphs ,, 8222
    " So C-k`` will generate a Hebrew closing double-quotes
    digraphs `` 8220
    " So C-kab (abbreviation) will generate a Hebrew abbreviation sign
    digraphs ab 1524
endif

au FileType sass setlocal shiftwidth=4

au BufNewFile ~/conf/svn/*.sh r ~/conf/svn/sample.sh | 1d

function! SetXslt()
    let g:xml_tag_syntax_prefixes='xsl\|xhtml\|db5\|db\|docbook\|xml\|xlink'
endfunction

au BufNewFile,BufRead ~/*.xsl call SetXslt()
au BufNewFile,BufRead ~/*.xslt call SetXslt()

" Local customisations
if File_Is_Readable("~/.local.vimrc.vim")
    so ~/.local.vimrc.vim
endif

function! CopyAll()
    normal ggVG"+y
endfunction

command! CopyAll call CopyAll()

function! CopyLine()
    .y +
endfunction

command! CopyLine call CopyLine()

function! StyledQuotes(start_line, end_line)
    let cmd = a:start_line . ',' . a:end_line . 's/"\([^"]\+\)"/“\1”/'
    exe cmd
endfunction

command! -range StyledQuotes call StyledQuotes(<line1>,<line2>)

" Remmed out because nuvola is a confusing color-scheme.
" source ~/.vim/colors/nuvola_shlomif.vim

let g:UltiSnipsSnippetDirectories = ["ExtraUltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

command! -nargs=+ BufOut redir => bufout | silent <args> | redir END | new | call append(0, substitute(strtrans(bufout), '\^@', "\r", 'g'))

function! Perl_FileType_Settings()
    noremap <buffer>  <silent> <LocalLeader>rs         :call Perl_SyntaxCheck()<CR>:redraw!<CR>:call Perl_SyntaxCheckMsg()<CR>
    " ---------- Add ':' to the keyword characters -----------
    "            Tokens like 'File::Find' are recognized as
    "            one keyword
    "
    setlocal iskeyword+=:
endfunction

autocmd FileType perl call Perl_FileType_Settings()

autocmd BufRead,BufNewFile *.clay set filetype=clay

set tabpagemax=200

" Unobtrusive highlighting of trailing space.
"
" Taken from http://blog.kamil.dworakowski.name/2009/09/unobtrusive-highlighting-of-trailing.html
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

command! CancelExtWS highlight clear ExtraWhiteSpace

map <F6> <ESC>:Ack -ai <C-R><C-W> t2 lib<CR>

set t_Co=256

" Spell freeform text inside XML tags.
" See:
" http://stackoverflow.com/questions/9234925/spell-check-with-vim-and-xml-automatically
function Shlomif_XML_file_type()
    let fn = expand("<afile>:p")
    " Only for XML files under my homepage for now.
    if (match(fn, "Docs/homepage/") >= 0)
        syn spell toplevel
    end
endfunction

autocmd FileType xml call Shlomif_XML_file_type()

autocmd BufRead,BufNewFile ~/Docs/programming/Vim/vim-begin/*.html set indentexpr=

autocmd BufRead,BufNewFile ~/Docs/homepage/homepage/trunk/lib/pages/t2/philosophy/putting-all-cards-on-the-table.xhtml setlocal indentexpr=

" For the Command-T plugin , because dest/t2-homepage in $homepage
" has more than 30K files.
let g:CommandTMaxFiles = 200000

autocmd BufRead,BufNewFile ~/progs/perl/Quizzes/Golf/* setlocal noeol binary

" Copy the current WORD (delimited by whitespace) into
" both the * and + clipboards.
map <Leader>cc viW""ygv"+ygv"*y

set wildignore+=*.o,*.obj,.git,.svn,.hg,.bzr,*~

" RPM spec - convert Url to metacpan.org
autocmd BufRead,BufNewFile *.spec command! MC %!perl ~/conf/trunk/shlomif-settings/home-bin-executables/bin/rpmspec-convert-to-metacpan.pl

" For setting ack.vim's to ag if available - see ~/.vim/ack/README.md
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let no_flake8_maps = 1
autocmd FileType python map <buffer> <F5> :call Flake8()<CR>

autocmd BufRead,BufNewFile */ids-whitelist.txt map <F2> o<C-R>"<ESC> | map <F4> :%!LC_ALL=C sort<CR>

set scrolloff=0

" Taken from
" https://github.com/oblitum/dotfiles/blob/archlinux/.vimrc#L415-L439
" - thanks!
" QuickRun Setup {{{
let g:quickrun_config = {
    \   '_': {
    \     'outputter/buffer/close_on_empty': 1
    \   },
    \   'haskell' : {
    \     'command': 'stack',
    \     'cmdopt': 'runghc --verbosity silent'
    \   },
    \   'c' : {
    \     'command': 'clang',
    \     'cmdopt': '-g -O0 -Wall -Wextra -std=gnu11 -lpthread'
    \   },
    \   'cpp' : {
    \     'command': 'clang++',
    \     'cmdopt': '-g -O0 -Wall -Wextra -pedantic -std=c++1z -stdlib=libc++ -lc++abi -lpthread'
    \   },
    \   'swift' : {
    \     'command': 'swiftc',
    \     'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
    \     'tempfile': '%{tempname()}.swift',
    \     'hook/sweep/files': ['%S:p:r'],
    \   }
    \ }
" }}}

function! Shlomif_Open_Source()
    let fn = expand('%:p')
    let new_fn = substitute(fn, "^/home/shlomif/Docs/homepage/homepage/trunk/dest/", "/home/shlomif/Docs/homepage/homepage/trunk/", "") . '.wml'
    exe "sp " . new_fn
endfunction

autocmd BufRead,BufNewFile ~/Docs/homepage/homepage/trunk/dest/t2/*.html command! S call Shlomif_Open_Source()
