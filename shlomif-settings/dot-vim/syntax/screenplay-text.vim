" Vim syntax file
" Language: ScreenplayText - the textual source of ScreenplayXML
" Maintainer: Shlomi Fish <shlomif@iglu.org.il>
" Home: http://search.cpan.org/dist/XML-Grammar-Screenplay/
"
" Author: Shlomi Fish
" Filenames: *.screen.txt
" Last Change: Thu Jul  3 00:59:42 IDT 2008
" Version: 0.0.1

" Quit if syntax file is already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syntax match screenplayTextComment /<!--\_.\{-0,}-->/
syntax match screenplayTextDescription /^ *\[\_.\{-0,}\]/
syntax match screenplayTextAddress /^\(+\{2,\}\|[^[:+]*\):/ contained nextgroup=screenplayTextInnerDesc
syntax match screenplayTextInnerDesc /\[\_.\{-0,}\]/ contained nextgroup=screenplayTextInnerDesc

syntax region screenplayTextSaying start=/^\s*\n^\(+\{2,\}\|[^[:+]*\):/ end=/^\s*$/ contains=screenplayTextAddress,screenplayTextInnerDesc

hi def link screenplayTextComment Comment
hi def link screenplayTextDescription PreProc
hi def link screenplayTextInnerDesc PreProc
hi def screenplayTextAddress      term=bold cterm=bold gui=bold

let b:current_syntax="ScreenplayText"

runtime! syntax/xml.vim
