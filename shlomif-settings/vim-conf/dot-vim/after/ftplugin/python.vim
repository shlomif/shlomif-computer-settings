" Based on
" https://vim.fandom.com/wiki/Automatically_add_Python_paths_to_Vim_path
" Thanks!
python3 << EOF
import os
import sys
import vim
for p in sys.path:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
        # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
" Fix = and == in normal mode
setlocal formatprg=autopep8\ -
