" Based on 'An example for a vimrc file.' by Bram Moolenaar
filetype plugin indent on
set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set backup              " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers

" Changed by Shlomi Fish to a much bigger setting
set history=5000                " keep 5,000 lines of command line history
set ruler                       " show the cursor position all the time

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

" See:
" https://github.com/neovim/neovim/commit/deb18a050ef522791c48c7c8c549a2c4b2043be0
" I use a light background.
set background=light

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
let g:licenses_authors_name = 'Shlomi Fish ( https://www.shlomifish.org/ )'
let g:licenses_copyright_holders_name = g:licenses_authors_name
let g:licenses_default_commands = ['apache', 'cc0', 'ccby', 'gpl', 'mit']
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
    \ 'ack',
    \ 'closetag',
    \ 'ctrlp',
    \ 'git:https://gitlab.com/dylnmc/novum.vim',
    \ 'github:Carpetsmoker/auto_mkdir2.vim',
    \ 'github:Glench/Vim-Jinja2-Syntax',
    \ 'github:JuliaEditorSupport/julia-vim',
    \ 'github:Houl/cxf_mod-vim',
    \ 'github:aaronbieber/quicktask',
    \ 'github:alessandroyorba/alduin',
    \ 'github:antoyo/vim-licenses',
    \ 'github:aperezdc/vim-template',
    \ 'github:cakebaker/scss-syntax.vim',
    \ 'github:cespare/vim-toml',
    \ 'github:dahu/Area-41',
    \ 'github:flazz/vim-colorschemes',
    \ 'github:godlygeek/csapprox',
    \ 'github:godlygeek/tabular',
    \ 'github:honza/vim-snippets',
    \ 'github:inkarkat/SyntaxAttr.vim',
    \ 'github:ironcamel/vim-script-runner',
    \ 'github:jiangmiao/auto-pairs',
    \ 'github:jeetsukumaran/vim-pythonsense',
    \ 'github:jlanzarotta/bufexplorer',
    \ 'github:junegunn/fzf',
    \ 'github:junegunn/fzf.vim',
    \ 'github:leafgarland/typescript-vim',
    \ 'github:mattn/emmet-vim',
    \ 'github:majutsushi/tagbar',
    \ 'github:nacitar/a.vim',
    \ 'github:nvie/vim-flake8',
    \ 'github:pboettch/vim-cmake-syntax',
    \ 'github:plasticboy/vim-markdown',
    \ 'github:prettier/vim-prettier',
    \ 'github:qpkorr/vim-bufkill',
    \ 'github:romainl/Apprentice',
    \ 'github:shlomif/mojovai',
    \ 'github:shlomif/syntax-spork',
    \ 'github:shlomif/vim-extract-variable',
    \ 'github:shlomif/vim-freecell',
    \ 'github:shlomif/vim-gitignore',
    \ 'github:shlomif/vim-screenplay-text',
    \ 'github:sjl/gundo.vim',
    \ 'github:terryma/vim-expand-region',
    \ 'github:thinca/vim-quickrun',
    \ 'github:timonv/vim-cargo',
    \ 'github:tomasr/molokai',
    \ 'github:tpope/vim-fugitive',
    \ 'github:tpope/vim-rhubarb',
    \ 'github:vim-airline/vim-airline-themes',
    \ 'github:vim-perl/vim-perl',
    \ 'github:vim-perl/vim-perl6',
    \ 'matchit.zip',
    \ 'range-search',
    \ 'repeat',
    \ 'spec%98',
    \ 'surround',
    \ 'textobj-rubyblock',
    \ 'textobj-user',
    \ 'vcscommand',
    \ 'vim-airline',
    \ 'xml',
    \ ],
    \ {'auto_install': 1, 'shell_commands_run_method': "system",})
set more

if $VIMSYNT == 1
    call vam#ActivateAddons([
                \ 'github:vim-syntastic/syntastic',
                \ ],
    \ {'auto_install': 1, 'shell_commands_run_method': "system",})
end
" \ 'github:sunuslee/vim-plugin-random-colorscheme-picker',

if exists("g:shlomif_is_nvim")
    call vam#ActivateAddons([
        \ 'github:raghur/vim-ghost',
        \],
        \ {'auto_install': 1, 'shell_commands_run_method': "system",})
end

let g:powerline_pycmd = 'py3'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
" Expand the syntax menu automatically
let do_syntax_sel_menu = 1
runtime! synmenu.vim
" aunmenu &Syntax.&Show\ individual\ choices

" Make the To-HTML conversion use CSS styles
let html_use_css = 1

" This is so the indent inside the arguments/parameters of function calls will
" be indented 4 spaces to the right instead of 8.
set cinoptions+='(4,W4,b1,=0,m1'

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
        " compiler perlprove
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

autocmd BufNewFile,BufRead *.gdb set filetype=gdb

if !exists("g:shlomif_is_nvim")
    set guifont=Inconsolata\ 11
endif

" Cancelling so the Hebrew keyboard won't be so bad.
" so ~/conf/Vim/hebrew.vim

" Hebrew settings:
map <F9> :set invrl<CR>
imap <F9> <ESC>:set invrl<CR>a

" To make sure gimp code can be styled correctly.
autocmd BufNewFile,BufRead ~/Download/unpack/graphics/gimp/*.[ch] so ~/conf/Vim/gimp-dev.vim

" Make the Sure the Print Icon in the toolbar does not do anything.
" By default it prints the page without a prompt, which is annoying, because
" it is sometimes pressed accidently.
an 1.40 ToolBar.Print :echo "hello"<CR>
vnoremenu ToolBar.Print         :echo "hello"<CR>

" This is to prevent gvim from creating backup files under the GIMP
" directories which just confuses the GIMP.

autocmd BufNewFile,BufRead ~/.gimp-*.scm set nobackup
autocmd BufNewFile,BufRead ~/.gimp-*.py set nobackup

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

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/t2/art/recommendations/music/shlomi-fish-music-recommendations.xml so ~/conf/Vim/amazon-asin.vim

function Homepage_Customisation()
    set path+=~/Docs/homepage/homepage/trunk/lib,~/Docs/homepage/homepage/trunk,~/Docs/homepage/homepage/trunk/src
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

function Homepage_Tests_Customisation()
    set path+=~/Docs/homepage/homepage/trunk/Tests/lib
endfunction

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/* call Homepage_Customisation()
au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/Tests/* call Homepage_Tests_Customisation()

" Remming out because let @f causes too many problems with special escapes

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/t2/humour/fortunes/*.xml map <F4> /<fortune id="<CR>f"l"tyi":!perl convert-aphorism.pl '<C-R>t'<CR>

au BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/t2/humour/fortunes/*.xml map <F5> /<raw><CR>:s!raw!quote!<CR>/<text><CR>:s!<lt>text>!<lt>p>!<CR>:s#<!\[CDATA\[##<CR>/^\]\]><CR>:s#\]\]>##<CR>k/<lt>\/text><CR>:s#<lt>/text>#<lt>/p>#<CR>/<\/raw><CR>:s!raw!quote!<CR>

au BufNewFile,BufRead ~/Docs/Diary/* so ~/conf/Vim/diary.vim

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

if 0
    autocmd BufNewFile *.pl call Perl_Load_File() | :call Perl_New_Script()
endif
autocmd BufNewFile *.pm call Perl_Load_File() | :call Perl_New_Module()
autocmd BufNewFile *.t call Perl_Load_File() | :call Perl_New_Test_Program()

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

function! NLCopyLine()
    normal 0"+y$
endfunction

command! NLCopyLine call NLCopyLine()

let g:chars_search_whitelist = ''
function! SearchForEvilChars()
    let @/=( '[^[:graph:] ' . g:chars_search_whitelist . ']' )
    normal n
endfunction

command! SearchForEvilChars call SearchForEvilChars()

function! StyledQuotes(start_line, end_line)
    let cmd = a:start_line . ',' . a:end_line . 's/"\([^"]\+\)"/“\1”/'
    exe cmd
endfunction

command! -range StyledQuotes call StyledQuotes(<line1>,<line2>)

function! UnderscorePrefix(start_line, end_line)
    let cmd = a:start_line . ',' . a:end_line . 's%' . @/ . '%_\0%g'
    exe cmd
endfunction

command! -range UnderscorePrefix call UnderscorePrefix(<line1>,<line2>)

function! SelfPrefix(start_line, end_line)
    let cmd = a:start_line . ',' . a:end_line . 's%[@\$]\(' . @/ . '\)%{$self->\1}%g'
    exe cmd
endfunction

command! -range SelfPrefix call SelfPrefix(<line1>,<line2>)

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
    " let fn = expand("<afile>:p")
    " Only for XML files under my homepage for now.
    " if (match(fn, "Docs/homepage/") >= 0)
    " For all files.
    if (1)
        syn spell toplevel
    end
endfunction

function Shlomif_DocBook_XML_file_type()
    " let fn = expand("<afile>:p")
    " Only for XML files under my homepage for now.
    " if (match(fn, "Docs/homepage/") >= 0)
    " For all files.
    call Shlomif_XML_file_type()
    " Avoid indenting tags
    set indentexpr=
endfunction

autocmd FileType xml call Shlomif_XML_file_type()
autocmd FileType docbk call Shlomif_DocBook_XML_file_type()

autocmd BufRead,BufNewFile ~/Docs/programming/Vim/vim-begin/*.html set indentexpr=

autocmd BufRead,BufNewFile ~/Docs/homepage/homepage/trunk/lib/pages/t2/philosophy/putting-all-cards-on-the-table.xhtml setlocal indentexpr=

autocmd BufRead,BufNewFile ~/Docs/homepage/homepage/trunk/*.xml setlocal indentexpr=

" For the Command-T plugin , because dest/t2-homepage in $homepage
" has more than 30K files.
let g:CommandTMaxFiles = 200000

autocmd BufRead,BufNewFile ~/progs/perl/Quizzes/Golf/* setlocal noeol binary

" Copy the current WORD (delimited by whitespace) into
" both the * and + clipboards.
map <Leader>cc viW""ygv"+ygv"*y
command! CopyWord normal viW""ygv"+ygv"*y

set wildignore+=*.o,*.obj,.git,.svn,.hg,.bzr,*~

function Shlomif_rpm_copyurl()
    let @+ = system('rpmspec -P ' . @% . ' | perl -lnE '."'".'say $_ if s/\Aurl:\s*//i'."'".' -')
    let @* = @+
endfunction

function Shlomif_rpm_spec()
    " RPM spec - convert Url to metacpan.org
    command! MC %!perl ~/conf/trunk/shlomif-settings/home-bin-executables/bin/rpmspec-convert-to-metacpan.pl
    command! BPL %!perl ~/conf/trunk/shlomif-settings/home-bin-executables/bin/rpmspec-convert-from-Makefile.PL-to-Build.PL.pl
    " Open the url
    command! OU !rpmspec -P % | perl -lnE 'say $_ if s/\Aurl:\s*//i' - | xargs xdg-open
    command! FF !rpmspec -P % | perl -lnE 'say $_ if s/\Aurl:\s*//i' - | xargs firefox
    command! CopyUrl call Shlomif_rpm_copyurl()
    " URL for pypi dload per https://wiki.mageia.org/en/Python_policy
    let b:pypi_url="https://pypi.io/packages/source/p/%{module}/%{module}-%{version}.tar.gz"
    let @p = b:pypi_url
    if 0
        let b:fix_py_shebang = "perl -i -lpE 's{^(#!/usr/bin/env python)\\b}{${1}3}' `find %{buildroot}/%{_datadir} -name '*.py'`\n"
    endif
    let b:fix_py_shebang = "pathfix.py -pni \"%{__python3} %{py3_shbang_opts}\" `find %{buildroot}/%{_datadir} -name '*.py'`\n"
    let b:mb = "BuildRequires: perl(Module::Build)"
    map <Leader>pl Oexport PERL5LIB="$PWD:$PERL5LIB"<ESC>
    set path+=./../SOURCES/
    " See:
    " https://docs.fedoraproject.org/en-US/packaging-guidelines/Debuginfo/
    let b:debug_pkg_disable = "# Comment why\n%global debug_package %{nil}\n"
endfunction

autocmd BufRead,BufNewFile *.spec call Shlomif_rpm_spec()

" For setting ack.vim's to rg if available - see ~/.vim/ack/README.md
if executable('rg')
    let g:ackprg='rg --vimgrep --sort=path'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

let no_flake8_maps = 1
autocmd FileType python map <buffer> <F5> :call Flake8()<CR>
autocmd FileType perl map <buffer> <F5> :%!perltidy --character-encoding=none<CR>

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
    let new_fn = substitute(fn, "^" . $HOME . "/Docs/homepage/homepage/trunk/dest/\(post-incs\|pre-incs\)/", $HOME . "/Docs/homepage/homepage/trunk/", "") . '.tt2'
    exe "sp " . new_fn
endfunction

autocmd BufRead,BufNewFile ~/Docs/homepage/homepage/trunk/dest/t2/*.html
    \ command! S call Shlomif_Open_Source()

autocmd BufRead,BufNewFile ~/Download/unpack/games/pysolfc/*.py
    \ so ~/Download/unpack/games/pysolfc/git/PySolFC/scripts/refactor1.vim

function! Shlomif_Fc_Solve()
    set path+=~/progs/freecell/git/fc-solve/fc-solve/source/t/lib/
    set path+=~/progs/freecell/git/fc-solve/fc-solve/source/
    set path+=~/progs/freecell/git/fc-solve/fc-solve/source/include
endfunction

autocmd BufRead,BufNewFile ~/progs/freecell/git/* call Shlomif_Fc_Solve()

function WML_Paths()
    set path+=~/apps/latemp/lib/wml/include/
endfunction

autocmd BufRead,BufNewFile *.wml call WML_Paths()

function Shlomif_HTML_TT2()
    setlocal ft=tt2html
    command! -range LocalLinks :<line1>,<line2>s=\vhttps?\:\/\/www\.shlomifish\.org\/=[% base_path %]=g
    command! -range LocalLinks2 :<line1>,<line2>s=\vhttps?\:\/\/www\.shlomifish\.org\/=\\\$(ROOT)/=g
    command! -range DeLocalLinks :<line1>,<line2>s=\v\[\% base.path \%\]=https://www.shlomifish.org/=g
    command! -range AbsoluteLinks :<line1>,<line2>s!\v(\<a href\=\")([a-zA-Z\.\#][^\"\:]*)\"!\1https://www.shlomifish.org/philosophy/culture/case-for-commercial-fan-fiction/\2"!g
endfunction

function Shlomif_HTML_ROOT()
    command! -range LocalRootLinks :<line1>,<line2>s=\vhttps?\:\/\/www\.shlomifish\.org\/=\$(ROOT)/=g
endfunction

autocmd BufRead,BufNewFile *.html.tt2 call Shlomif_HTML_TT2()
autocmd BufRead,BufNewFile *.xhtml.tt2 call Shlomif_HTML_TT2()
autocmd BufRead,BufNewFile ~/Docs/homepage/homepage/trunk/lib/Inc/*.tt2 call Shlomif_HTML_TT2()
autocmd BufRead,BufNewFile ~/Docs/homepage/homepage/trunk/lib/pages/*.tt2 call Shlomif_HTML_TT2()

function FCS_site_Customisation()
    set path+=~/progs/freecell/git/fc-solve/fc-solve/site/wml/lib/
endfunction

autocmd BufRead,BufNewFile ~/progs/freecell/git/fc-solve/fc-solve/site/* call FCS_site_Customisation()

autocmd BufRead,BufNewFile */.gitignore source ~/conf/Vim/gitignore-completion.vim
autocmd BufRead,BufNewFile */.gitignore inoremap <C-P> <C-x><C-u>

autocmd BufRead,BufNewFile ~/progs/wml/wml-itself/core/*
    \ set path+=~/progs/wml/wml-itself/core/trunk/src/wml_include/ |
    \ set suffixesadd+=.src

for glob in ['/*/lib/hunspell/whitelist*.txt', '/*/lib/hunspell/hebrew-whitelist*.txt']
    exe "autocmd BufWritePost " . glob . " :!bin/sort-check-spelling-file ; test -x bin/heb-sort-check-spelling-file && bin/heb-sort-check-spelling-file"
endfor

let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_typescript_checkers = ["eslint"]
let g:ack_apply_qmappings = 0
let g:syntastic_enable_perl_checker = 1

command! SwapPP s!\(\S\+\)\(++\|--\)!\2\1!

function ArrayRefactorVar2Slot()
    let id_ = substitute(substitute(@/, '^\\<', '', ''), '\\>$', '', '')
    exe '%!perl ~/conf/trunk/shlomif-settings/home-bin-executables/bin/refactor-perl--convert-variable-to-accessor.pl --var=' . "'" . id_ . "'" . " --type='@'"
endfunction

command! ArrayRefactorVar2Slot call ArrayRefactorVar2Slot()
function ScalarRefactorVar2Slot()
    let id_ = substitute(substitute(@/, '^\\<', '', ''), '\\>$', '', '')
    exe '%!perl ~/conf/trunk/shlomif-settings/home-bin-executables/bin/refactor-perl--convert-variable-to-accessor.pl --var=' . "'" . id_ . "'" . " --type='$'"
endfunction

command! ScalarRefactorVar2Slot call ScalarRefactorVar2Slot()

let g:email = 'shlomif@cpan.org'
let g:username = 'Shlomi Fish'

let g:CommandTCursorStartMap = ['<C-a>', '<Home>']
let g:CommandTCursorEndMap = ['<C-e>', '<End>']
let g:CommandTFileScanner = 'git'
let g:vim_markdown_folding_disabled = 1
map <Leader>l :CommandTLine<CR>
map <Leader>cl V[[o][g<C-G>

function ShowSubLens()
    let fn = @%
    sp
    enew
    exe "0read !perl ~/conf/trunk/shlomif-settings/home-bin-executables/bin/subroutine-lens.pl " . fn
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
endfunction

command! ShowSubLens call ShowSubLens()

autocmd FileType scss setlocal iskeyword+=-

fun MarkdownSelfLinkRefactor()
    map <F2> viW"ada[<c-r>a](./<c-r>a)<esc>
endf

command! ReadIrcLog read !cat ~/irc.log | perl ~/bin/convert-irc-log-to-fortune-xml.pl
command! ReadBackupIrcLog read !cat ~/Backup/Arcs/irc2.log | perl ~/bin/convert-irc-log-to-fortune-xml.pl

" number of spaces per indentation level
let g:prettier#config#tab_width = 4

autocmd BufRead,BufNewFile ~/conf/trunk/*.bash
    \ set path+=~/conf/trunk/shlomif-settings/Bash/Themes/common/ | set suffixesadd+=.bash

" Convert html to markdown
" Requires
" https://metacpan.org/pod/distribution/HTML-WikiConverter/bin/html2wiki
" and https://metacpan.org/pod/HTML::WikiConverter::Markdown .
command! -range HTML2MD :<line1>,<line2>!html2wiki --dialect Markdown --link-style=inline

command! -range EscapeHTML :<line1>,<line2>!perl -lpE 'use strict; use warnings; use CGI; $_=CGI::escapeHTML($_)'
" Convert <li>...</li> to <li><p>...</p></li>
command! -range LiToLiPHTML :<line1>,<line2>!perl -lp ~/conf/trunk/shlomif-settings/home-bin-executables/bin/li-to-li-p.pl

function Python_Import_Order()
    command! -range II :<line1>,<line2>!perl -lpE 's/^(from \S+ import )(.*)$/$1 . join(", ", sort {$a cmp $b} split m[, *],$2)/e' | LC_ALL=C perl -E 'my @l=<>;print sort { $a=~/^impo/<=>$b=~/^impo/ or $a=~/^from \./<=>$b=~/^from \./ or $a cmp $b} @l'
    map <F2> vip:II<cr>
    command! -range S :<line1>,<line2>!LC_ALL=C sort -u | perl -lpE 's/, *\\$//ms;s/$/, \\/ms;' | perl -0777 -pE 's/, *\\(\n*)\z/$1/'
    map <F3> ?^\($\\|\S\)<cr>jV/^\($\\|\S\)<cr>k:S<cr>
endfunction

autocmd BufNewFile,BufRead *.py call Python_Import_Order()

function JavaScr_Commands()
    command! -range Const :<line1>,<line2>!perl -0777 -lpE 's/\A(\s*)(?:var\b)?\s*/${1}const /ms; s/[,;]?(\s*)\z/;$1/ms'
endfunction

autocmd BufNewFile,BufRead *.js call JavaScr_Commands()
let g:templates_directory = [ $HOME . '/conf/Vim/templates' ]

" Usage: add a mapping for i_CTRL-X_CTRL-F in your vimrc
imap <expr> <C-X><C-F>  nwo#mappings#cxf_mod#Plug()

au BufNewFile,BufRead *.fc.board setlocal filetype=freecell
au BufNewFile,BufRead *.fc.sol setlocal filetype=freecell
au BufNewFile,BufRead *.fc.solution setlocal filetype=freecell

au BufNewFile,BufRead *.pari setlocal filetype=gp
autocmd BufNewFile,BufRead ~/Docs/homepage/homepage/trunk/lib/blogs/shlomif-hsite/*.xhtml set indentexpr=
function PerlBegin_Customisation()
    set path+=~/Docs/programming/Perl/web-sites/perl-begin/trunk/,~/Docs/programming/Perl/web-sites/perl-begin/trunk/lib
endfunction

autocmd BufRead,BufNewFile ~/Docs/programming/Perl/web-sites/perl-begin/trunk/* call PerlBegin_Customisation()

" Requires this:
" https://www.fysh.org/~katie/computing/make.txt
"
" <<<
" This is a rule that's useful to put in all your makefiles:
"
" %.show:
"        @echo "$* = $($*)"
"
" So whenever you're not sure what a variable in the makefile is getting
" set to, you can do "make FOO.show" and it will show you the value of
" $(FOO). This helps a lot with debugging.
" >>>

py3 << EOF

import re
import subprocess
import vim

def get_show_val(var_id):
    assert re.match("^[A-Za-z0-9_]+$", var_id)
    text = subprocess.Popen(["gmake", var_id + ".show"], stdout=subprocess.PIPE).stdout.read()
    return text

def vim_get_show_val():
    return get_show_val(vim.eval('g:for_py_get_show_val'))

def vim_append_get_show_val_to_file(fn):
    with open(fn, 'at') as fh:
        fh.write(vim_get_show_val().decode('utf-8'))

EOF

function Shlomif_Makefile_show_var()
    let prev = @a
    normal viw"ay
    let g:for_py_get_show_val = @a
    let @a = prev
    echo py3eval('vim_get_show_val()')
endfunction

let g:for_py_get_show_val__log_fn = $HOME . '/Arcs/temp/gmake_vars__values.txt'

function Shlomif_Makefile_log_var()
    let prev = @a
    normal viw"ay
    let g:for_py_get_show_val = @a
    let @a = prev
    call py3eval('vim_append_get_show_val_to_file("' . g:for_py_get_show_val__log_fn . '")')
    exec "sp " . g:for_py_get_show_val__log_fn
    e
endfunction

function Shlomif_Makefile_file_type()
    command! ShowVar call Shlomif_Makefile_show_var()
    command! LogVar call Shlomif_Makefile_log_var()
endfunction

autocmd FileType make call Shlomif_Makefile_file_type()
autocmd BufNewFile,BufRead ~/progs/riddles/golf/*.py3 set filetype=python
autocmd BufNewFile,BufRead ~/Download/unpack/graphics/inkscape/* set path+=~/Download/unpack/graphics/inkscape/inkscape/src/

function Shlomif_C_and_CPP_file_type()
    let b:pragma_push = '#pragma GCC diagnostic push'
    let b:no_depr_warnings = '#pragma GCC diagnostic ignored "-Wdeprecated-declarations"'
    let b:pragma_pop = '#pragma GCC diagnostic pop'
endfunction

autocmd FileType c call Shlomif_C_and_CPP_file_type()
autocmd FileType cpp call Shlomif_C_and_CPP_file_type()

" See:
" https://stackoverflow.com/questions/26789467/how-can-i-display-the-function-name-in-vim-airline
let g:airline#extensions#tagbar#enabled = 1

" sanity check.
let g:sniptest = ( $HOME . '/.config/nvim/ExtraUltiSnips/perl.snippets' )
if (!(filereadable(g:sniptest)))
    throw ( g:sniptest . ' does not exist - run setup-all' )
endif

autocmd BufNewFile,BufRead ~/Docs/Notes/To_Do/Done.txt call UltiSnips#AddSnippetWithPriority('date', '`!v strftime("%Y-%m-%d\n----------\n")`', "date", '', 'all', 20)

function Shlomif_Apply_Whitelist()
    exe '/^==== In: dest.*sharp-perl\.html$'
    " return
    " exe '/^==== In: dest.*shlomif\.html$'
    normal 2j
    normal p
    exe '%s/\t.*//'
    w
    e
    return
endfunction

autocmd BufNewFile,BufRead */commit.msg set filetype=gitcommit
autocmd BufNewFile,BufRead ~/conf/trunk/shlomif-settings/git/commit-messages/*.txt set filetype=gitcommit
" See: https://en.wikipedia.org/wiki/.har
autocmd BufNewFile,BufRead *.har set filetype=json

function Shlomif_Tidyall_Snippets()
    let g:charenc = '--character-encoding=none'
    let g:charline = 'argv = -ci=4 -bl -cti=0 ' . g:charenc
    let @e = g:charenc
endfunction

autocmd BufNewFile,BufRead */.tidyallrc call Shlomif_Tidyall_Snippets()

function Shlomif_DistIni_Snippets()
    let g:md = "[ReadmeMarkdownFromPod]\n"
endfunction

autocmd BufNewFile,BufRead */dist.ini call Shlomif_DistIni_Snippets()
