set nocompatible
set viminfo='20,<1000,s1000
set number
highlight LineNr ctermfg=grey

" tabs are the devil
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
set autoindent

set noshowmode
set noshowcmd
set hidden
set noerrorbells
set novisualbell
set visualbell t_vb=
set titlestring=%t
set title
set ignorecase
set smartcase
set formatoptions+=j
set virtualedit=block
set nowritebackup
set nobackup
set whichwrap=b,s,[,],<,>
set signcolumn=yes

" Update sign column every quarter second
set updatetime=250

vmap <Tab> >
vmap <S-Tab> <

"-- AUTOCOMPLETION --
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"-- PLUGINS (Using junegunn/vim-plug) --
call plug#begin()

"NERDTree and NERDTree extensions
Plug 'preservim/NERDTree'
Plug 'PhilRunninger/nerdtree-buffer-ops'

Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-buftabline'

"coc and coc extensions
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

let g:rainbow_active = 1

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1

highlight SignColumn ctermbg=black

let g:lightline = {
    \ 'component_function': {
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \ },
    \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1 
let g:indent_guides_start_level = 2

hi IndentGuidesOdd  ctermbg=245
hi IndentGuidesEven ctermbg=237

let mapleader = " "
let g:mapleader = " "
" write
nnoremap <leader>w :w!<cr>
" quit
nnoremap <leader>q :q<cr>
" copy line, paste below
nnoremap <leader>d yyp
" select all
nnoremap <leader>a ggVG
" buffer maps
nnoremap <leader>> :bnext<CR>
nnoremap <leader>< :bprev<CR>
" open NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
" git maps
nnoremap <leader>gs :Gstatus<CR>
" - toggles changes to stage.
" Use cc to commit. 
" Save/quit the commmit message.
" Use - to push individual commits.
nnoremap <leader>gp :Gpush<CR>
" vim-plug maps
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>
" 2 horizontal windows
nnoremap <leader>h <C-w>K
" 2 vertical windows
nnoremap <leader>v <C-w>H
" add blank line
nnoremap <leader>o o<esc>

