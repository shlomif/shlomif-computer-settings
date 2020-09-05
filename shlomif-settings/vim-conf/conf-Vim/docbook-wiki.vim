" Vim Library used for fixing https://github.com/docbook/wiki/issues/14
" MITL / Expat: https://www.gnu.org/licenses/license-list.html#Expat .
map <F2> :s/\v<(([A-Z][a-z]*){2,})>/[\1](\1)/g<cr>
map <F3> :s#\(<c-r>/\)#[\1](\1)#<cr>
map <F4> Bv/\v([^A-Za-z]\|$)<cr>"ada[<c-r>a](<c-r>a)<esc>
let g:ackprg='ack'
Ack --sort "$(ls *.md | perl -lnE 's/\.md$//;push@x,$_;END{say "(".(join"|",@x).")"}' )" $(ls *.md | perl -lnE 'say if $_ ge "UsingX" and (!/\A[f]/)')
