fun! CompleteGitIgnoreFilenames(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = 0
        if line[start] == '/'
            let start += 1
        endif
        return start
    else
        return map(split(globpath('.', a:base . '*'), '\n'), {k, v -> substitute(v, '\./', '', '')})
    endif
endfun
setlocal completefunc=CompleteGitIgnoreFilenames
