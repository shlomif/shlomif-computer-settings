map <F2> :let a=@"<cr>:let a=substitute(a, "\\_^\\s*[0-9]\\+\\s*", "", "g")<cr>:put =a<cr>
map <F2> :let a=@"<cr>:let a=substitute(a, "\\n\\=\\zs\\s*[0-9]\\+\\s*", "", "g")<cr>:put =a<cr>
