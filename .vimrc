"custom
set mouse=a "interactuar con mouse en vim
set tabstop=4
set number "mostrar num de linea
set numberwidth=1 "ancho de numeros
set clipboard=unnamed "compartir clipboard del SO
set showcmd "mostrar comandos
set encoding=utf-8
set showmatch "resaltar parentisis de cierre
set sw=4 "identar texto con 2
set relativenumber "cursor numero hacia lados (numero relativos)
"set laststatus=4 "barra visible, siempre. PArece que no funciona
set laststatus=2
set noshowmode "no mostrar --Insertar--
syntax enable "habilitar syntax
set shell=/usr/bin/zsh
"set shellcmdflag=-ci
"syntax highliting error. Break large files
"https://github.com/vim/vim/issues/2790
set re=1

"syntax sync minlines=30000
autocmd BufEnter * :syntax sync fromstart
let c_minlines=1000
"default
"set showmode
set autoindent
set expandtab
"syntax on 
set ruler

"git updatetime
set updatetime=100

"polyglot
set nocompatible

" polyglot
let g:polyglot_disabled = ['autoindent']

" manejador de extensiones
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" :Plug + tab para gestionar
"
"Donde buscar los plugins?
call plug#begin('~/.vim/plugged')
" themes
Plug 'morhetz/gruvbox'
"Movimiento sobre documento
Plug 'easymotion/vim-easymotion'
" Arbol
Plug 'scrooloose/nerdtree'
"fzf search in tree
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Navegacion entre ventanas
" ctrl + h j k l para cambiar de lugar
Plug 'christoomey/vim-tmux-navigator'


"git
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'tpope/vim-fugitive'

"php
Plug 'vim-scripts/taglist.vim'
Plug 'StanAngeloff/php.vim'
Plug 'ervandew/supertab'
Plug 'nlknguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'borissov/vim-mysql-suggestions'
"Plug 'jparise/vim-graphql'
Plug 'scrooloose/syntastic'
"Plug 'yggdroot/indentline' " identar
Plug 'symfony/symfony'
"Plug 'blueshirts/darcula'
Plug 'adoy/vim-php-refactoring-toolbox'

"session save
Plug 'mhinz/vim-startify'

"THEMES
"theme colors php js jsx etc
Plug 'connorholyday/vim-snazzy'
Plug 'mhartington/oceanic-next'

"multiple languages
Plug 'sheerun/vim-polyglot'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

"bottom bar
"Plug 'itchyny/lightline.vim' Other bottom bar
call plug#end()

" config theme
"oceanicnext config
set t_Co=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" for vim 8
 if (has("termguicolors"))
  set termguicolors
 endif
"finish oceanicnext config
"colorscheme gruvbox
"colorscheme murphy
"colorscheme snazzy
colorscheme OceanicNext

let g:gruvbox_contrast_dark = "hard" "contraste alto

"config NERDTree
"cerrar cuando abre
let NERDTreeQuitOnOpen=1

" con espacio se activan los comandos (son como alias)
let mapleader=" "

" modo normal (nmap)
" espacio (<Leader>) + s y mostrar todas las coincidencias con 2 caracteres
" presionar la tecla resaltada para ir hasta el lugar que uno quiera
nmap <Leader>s <PLug>(easymotion-s2)

"espacio nt ejecuta el plugin de arbol.
nmap <Leader>nt :NERDTreeFind<CR>

"Atajos simples reemplazar el :w por espacio + w
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

"fzf.vim search
"nmap <Leader><C-f> :Files<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>fb :History<CR>

nmap <Leader>vr :vertical res 
"OpenSPlit in FZF.vim 
"C-x horizontal split 
"C-v vertical split


"startify sessions
let g:startify_session_dir = '~/.vim/session'
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_session_autoload = 1
let g:startify_session_persistence    = 1
let g:startify_files_number           = 18
" `SPC l s` - save current session
nnoremap <leader>ls :SSave<CR>

" `SPC l l` - list sessions / switch to different project
nnoremap <leader>ll :SClose<CR>


"inoremap " ""<left>
"inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


autocmd StdinReadPre * let s:std_in=1

autocmd VimEnter * NERDTree
"autocmd VimEnter * NERDTreeTabsOpen 
"autocmd VimEnter * NERDTreeMirror
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

autocmd StdinReadPre * let s:std_in=1

"sin startify
"autocmd vimenter * NERDTree
"
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"execute 'NERDTreeTabsToggle'

"autocmd VimEnter *
"                \   if !argc()
"                \ |   Startify
"		\ |   execute 'NERDTreeTabsToggle'
"                \ |   wincmd w
"                \ | endif
"
"
"
"php refactor toolbox plugin
"nnoremap <unique> <Leader>rnv :call PhpRenameLocalVariable()<CR>

if has('nvim')
function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
hi phpUseNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
hi phpClassNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
syn match phpParentOnly "[()]" contained containedin=phpParent
hi phpParentOnly guifg=#f08080 guibg=NONE gui=NONE

let g:deoplete#enable_at_startup = 1
let g:phpcd_php_cli_executable = 'php7.3'

let g:indentLine_setColors = 0
endif

"nerdtree hidden files show
let NERDTreeShowHidden=1

" Usos
" nerdtree espacio + nt
" Con m ver opciones de agregar, modif, etc.
" Con s abrir sobre ventana de nt
"
" Navegar sobre ventajas con control + hjkl
"
" Mover sobre documento Funciones basica
" Espacio + s === escribir 2 caracteres, se reemplazan y resaltan por letras .
" Tocar letra y entonces el cursor se mueve a ese punto
"
"
"
"
" Refactor tools
" nnoremap <unique> <Leader>rlv :call PhpRenameLocalVariable()<CR>
"nnoremap <unique> <Leader>rcv :call PhpRenameClassVariable()<CR>
"nnoremap <unique> <Leader>rm :call PhpRenameMethod()<CR>
"nnoremap <unique> <Leader>eu :call PhpExtractUse()<CR>
"vnoremap <unique> <Leader>ec :call PhpExtractConst()<CR>
"nnoremap <unique> <Leader>ep :call PhpExtractClassProperty()<CR>
"vnoremap <unique> <Leader>em :call PhpExtractMethod()<CR>
"nnoremap <unique> <Leader>np :call PhpCreateProperty()<CR>
"nnoremap <unique> <Leader>du :call PhpDetectUnusedUseStatements()<CR>
"vnoremap <unique> <Leader>== :call PhpAlignAssigns()<CR>
"nnoremap <unique> <Leader>sg :call PhpCreateSettersAndGetters()<CR>
"nnoremap <unique> <Leader>cog :call PhpCreateGetters()<CR>
"nnoremap <unique> <Leader>da :call PhpDocAll()<CR>
"
