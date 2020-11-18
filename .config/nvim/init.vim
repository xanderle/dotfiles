let g:python3_host_prog = '/usr/bin/python3'
set clipboard+=unnamedplus
source $HOME/.config/nvim/plug-config/coc.vim
set nocompatible
filetype plugin indent on                        " enable filetype detection
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

"" NERDTree related stuff
map <C-n> :NERDTreeToggle<CR>
" Define font map for status
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:nerdtree_tabs_autoclose=0

