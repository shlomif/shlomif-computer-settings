" Based on 'An example for a vimrc file.' by Bram Moolenaar
filetype plugin indent on
set nocompatible        " Use Vim defaults (much better!)

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

set t_Co=256
