function! Kakuro_Cell_Coords()
    let pos = getpos(".")

    " Find the first line of the board.
    let start_line = pos[1]
    while match(getline(start_line), "parse") == -1
        let start_line -= 1
    endwhile
    let start_line += 1

    let y = pos[1] - start_line

    " Find the x coordinate.
    let x = count(split(getline(".")[0:pos[2]], '\zs'), "[")-1

    return [y,x]
endfunction

function! Kakuro_Put_Coords_In_Clip()
    let @" = "@board.cell_yx(" . join(Kakuro_Cell_Coords(), ",") . ")"
endfunction

command! -nargs=0 KakuroPos call Kakuro_Put_Coords_In_Clip()

