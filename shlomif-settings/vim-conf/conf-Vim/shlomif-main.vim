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
    \ 'github:Carpetsmoker/auto_mkdir2.vim',
    \ 'github:Glench/Vim-Jinja2-Syntax',
    \ 'github:Houl/cxf_mod-vim',
    \ 'github:aaronbieber/quicktask',
    \ 'github:alessandroyorba/alduin',
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
    \ 'github:jeetsukumaran/vim-pythonsense',
    \ 'github:jlanzarotta/bufexplorer',
    \ 'github:junegunn/fzf',
    \ 'github:junegunn/fzf.vim',
    \ 'github:leafgarland/typescript-vim',
    \ 'github:mattn/emmet-vim',
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

set guifont=DejaVu\ Sans\ Mono\ 10

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
    set path+=~/Docs/homepage/homepage/trunk/lib,~/Docs/homepage/homepage/trunk
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

autocmd FileType xml call Shlomif_XML_file_type()
autocmd FileType docbk call Shlomif_XML_file_type()

autocmd BufRead,BufNewFile ~/Docs/programming/Vim/vim-begin/*.html set indentexpr=

autocmd BufRead,BufNewFile ~/Docs/homepage/homepage/trunk/lib/pages/t2/philosophy/putting-all-cards-on-the-table.xhtml setlocal indentexpr=

autocmd BufRead,BufNewFile ~/Docs/homepage/homepage/trunk/*.xml setlocal indentexpr=

" For the Command-T plugin , because dest/t2-homepage in $homepage
" has more than 30K files.
let g:CommandTMaxFiles = 200000

