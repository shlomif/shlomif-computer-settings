" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" See:
" https://github.com/neovim/neovim/commit/deb18a050ef522791c48c7c8c549a2c4b2043be0
" I use a light background.
set background=light

set runtimepath+=~/.vim/vim-addon-manager/
set nomore
let g:vim_addon_manager = {}
let g:vim_addon_manager.auto_install = 1
let g:vim_addon_manager.shell_commands_run_method = 'system'
call vam#ActivateAddons([
    \ 'github:godlygeek/csapprox',
    \ ],
    \ {'auto_install': 1, 'shell_commands_run_method': "system",})

set t_Co=256
