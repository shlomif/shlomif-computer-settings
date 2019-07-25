syntax on

" See:
" https://github.com/neovim/neovim/commit/deb18a050ef522791c48c7c8c549a2c4b2043be0
" I use a light background.
set background=light

set runtimepath+=~/.vim/vim-addon-manager/
call vam#ActivateAddons([
    \ 'github:godlygeek/csapprox',
    \ ],
    \ {'auto_install': 1, 'shell_commands_run_method': "system",})

set t_Co=256
