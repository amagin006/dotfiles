set encoding=utf-8
scriptencoding utf-8

syntax on

set visualbell t_vb=
set noerrorbells
set smarttab
set cindent
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set nu
set smartindent
set nowrap
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile

set incsearch
set ignorecase
set smartcase
set noesckeys

"----------------------------------------------------------
" 文字
"----------------------------------------------------------
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set clipboard=unnamed,autoselect "クリップボード"

"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する


call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'

Plug 'christoomey/vim-tmux-navigator'

Plug 'morhetz/gruvbox'

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Initialize plugin system
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox


command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
"スペース2回でCocList
nmap <silent> <space><space> :<C-u>CocList<cr>
"スペースhでHover
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
"スペースgdでDefinition
nmap <silent> <space>gd <Plug>(coc-definition)
"スペースrfでReferences
nmap <silent> <space>rf <Plug>(coc-references)
"スペースfmtでFormat
nmap <silent> <space>fmt <Plug>(coc-format)

nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeWinSize=30
let NERDTreeShowHidden=1
"let g:NERDTreeIgnore = ['^node_modules$']
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

let mapleader = " "

" html 補完
augroup HTMLANDXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

