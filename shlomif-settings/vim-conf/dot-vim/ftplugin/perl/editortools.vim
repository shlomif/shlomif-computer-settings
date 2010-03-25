" App::EditorTools::Command::InstallVim generated script
" Version: 0.07

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

map <buffer> ,pp :call EditorToolsMenu()<cr>
map <buffer> ,pL :call RenameVariable()<cr>
map <buffer> ,pP :call RenamePackageFromPath()<cr>
map <buffer> ,pI :call IntroduceTemporaryVariable()<cr>

function! EditorToolsMenu()
    let list = [ "RenameVariable", "RenamePackageFromPath", "IntroduceTemporaryVariable" ]
    let command = PickFromList( "EditorTools Command", list )
    if command == ""
        echo "cancelling"
        return
    endif

    let Fn = function(command)
    call Fn()
endfunction


function! RenameVariable()
    let newvar = input("New variable name? ")
    if newvar == ""
        echo "cancelling"
        return
    endif

    let line = line('.')
    " should backtrack to $ or % or the like
    let col  = col('.')
    let filename = expand('%')

    let command = "editortools renamevariable -c " . col . " -l " . line  . " -r " . newvar 

    call Exec_command_and_replace_buffer( command )
endfunction

function! RenamePackageFromPath()
    let line = line('.')
    let col  = col('.')
    let filename = expand('%')

    let command = "editortools renamepackagefrompath -f " . filename 
    call Exec_command_and_replace_buffer( command )
endfunction

function! IntroduceTemporaryVariable() range
    let start_pos = getpos("'<")
    let end_pos = getpos("'>")

    let start_str = start_pos[1] . "," . start_pos[2]
    let end_str = end_pos[1] . "," . end_pos[2]

    let varname = input("Name for temporary variable? ")
    let cmd = "editortools introducetemporaryvariable -s " . start_str . " -e " . end_str
    if varname != ""
        let cmd .= " -v " . varname
    endif

    call Exec_command_and_replace_buffer( cmd )
endfunction

" Utility functions -------------

" Execute a command using the shell and replace the entire buffer
" with the retuned contents. TODO: Needs error handling
function! Exec_command_and_replace_buffer(command)
    " echo a:command

    let buffer_contents = join( getline(1,"$"), "\n" )
    let result_str = system(a:command, buffer_contents )
    let result = split( result_str, "\n" )
    call setline( 1, result )
endfunction

" Ovid's function to implement a simple menu
function! PickFromList( name, list, ... )
    let forcelist = a:0 && a:1 ? 1 : 0

    if 1 == len(a:list) && !forcelist
        let choice = 0
    else
        let lines = [ 'Choose a '. a:name . ':' ]
            \ + map(range(1, len(a:list)), 'v:val .": ". a:list[v:val - 1]')
        let choice  = inputlist(lines)
        if choice > 0 && choice <= len(a:list)
            let choice = choice - 1
        else
            let choice = choice - 1
        endif
    end

    return a:list[choice]
endfunction

