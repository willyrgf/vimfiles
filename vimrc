"
" Configuracoes globais
" Desativa o modo de compatibilidade com o VI
set nocompatible
" Salva todos os arquivos em utf-8
set encoding=utf-8
" Apenas garante que o backspace consiga remover as identacoes
set backspace=indent,eol,start
" Don’t use Ex mode, use Q for formatting
map Q gq
" Map Y to do the same (well, almost) as the D command
map Y y$
"Se o terminal tiver mais de duas cores
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
" Minhas configuracoes.
" tamanho da tabulacao
set tabstop=2
" tamanho do identacao automatica
set shiftwidth=2
" converte tab em espacos
set expandtab
set softtabstop=2
" folding
set foldmethod=marker
" numeros de linhas visiveis
set scrolloff=3
" barra de status
set laststatus=2
" mostrar abas
set showtabline=2
" highlight de () {} e coisas do tipo.
set showmatch
" tira sons de erro
set noerrorbells
" salva o arquivo quando manda o controle para outro aplicativo.
set autowrite
" quando a linha for maior que a tela, desabilita a quebra.
set nowrap
" desabilita backup automatico
set nobackup
" tamanho do history
set history=500
" mostra status do cursos
set ruler
" mostra o comando que esta sendo executado
set showcmd
" enquanto esta digitando a pesquisa, ja vai procurando
set incsearch
" formatacao de texto
set formatoptions=tcq
" Identacao inteligente.
set smartindent
" numeracao de linha
set number
" auto completar arquivo
set wim=longest,list
" padrao colorscheme
set background=dark
" desbailita visualbell de erro
set vb t_vb=
" quantidade de cores
set t_Co=256
" nao criar arquivo de swap
set noswapfile
" mapleader, padrao /
let mapleader=","

" backup
set backup
set backupdir=~/vim_bkp/
let myvar = strftime("%y%m%d-%Hh%Mm%S")
let myvar = "set backupext=_". myvar
execute myvar

" grava onde parou na ultima vez que abriu o arquivo
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal g`\"" |
 \ endif

if has("autocmd")
  " ativa as configuracoes vindas do arquivo de sintaxe
  filetype plugin indent on
  " quando for texto textwidth=78
  autocmd FileType text setlocal textwidth=78
  " omni-complete, detecta quais elementos fazem sentido na sintaxe
  au FileType python setlocal ofu=pythoncomplete#Complete
  au FileType javascript setlocal ofu=javascriptcomplete#CompleteJS
  set completeopt-=preview
else
  set autoindent
endif " has("autocmd")

" Mapeamento de abas
map <M-1> :tabn 1<CR>
map <M-2> :tabn 2<CR>
map <M-3> :tabn 3<CR>
map <M-4> :tabn 4<CR>
map <M-5> :tabn 5<CR>
map <M-6> :tabn 6<CR>
map <M-7> :tabn 7<CR>
map <M-8> :tabn 8<CR>
map <M-9> :tabn 9<CR>
map <M-0> :tabn 10<CR>
imap <M-1> <ESC>:tabn 1<CR>a
imap <M-2> <ESC>:tabn 2<CR>a
imap <M-3> <ESC>:tabn 3<CR>a
imap <M-4> <ESC>:tabn 4<CR>a
imap <M-5> <ESC>:tabn 5<CR>a
imap <M-6> <ESC>:tabn 6<CR>a
imap <M-7> <ESC>:tabn 7<CR>a
imap <M-8> <ESC>:tabn 8<CR>a
imap <M-9> <ESC>:tabn 9<CR>a
imap <M-0> <ESC>:tabn 10<CR>a

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins instalados
Bundle 'gmarik/vundle'
" color
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'szw/vim-ctrlspace'
"comentarios
Bundle 'tpope/vim-commentary'
" multi cursores
Bundle 'terryma/vim-multiple-cursors'
" barra airline na janela
Bundle 'bling/vim-airline'
" git
Bundle 'tpope/vim-fugitive'
" tabulacao automatica
Bundle 'godlygeek/tabular'
" fecha automaticamente ',",(,[,{
Bundle 'jiangmiao/auto-pairs'
" highlight de erros
Bundle 'scrooloose/syntastic'
" autocompleta estruturas
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
" encontrar arquivos rapidamente
Bundle 'kien/ctrlp.vim'
" procura funcoes no fonte
Bundle 'tacahiroy/ctrlp-funky'
"Latex
Bundle 'vim-latex/vim-latex'
"Vim-Shebang
Bundle 'vim-scripts/Shebang'

" Variaveis dos plugins
let g:airline#extensions#powerline_fonts#enabled = 1 
" o branch ficara no airline                                                                                                                           
let g:airline#extensions#enable_branch#enabled = 1 
" mostra os erros no airline
let g:airline#extensions#enable_syntastic#enabled = 1 
" mostra as tabs
let g:airline#extensions#tabline#enabled = 1 

" Syntax color and color
set background=dark
colorscheme badwolf

" Set *.rules sh syntax highlighting
au BufNewFile,BufRead *.rules set filetype=sh

" Configuracoes para o gVim
if has("gui_running")
  set guioptions=aegit    " basically, all options, except the scrollbar, menu and toolbar
  " desbailita visualbell de erro
  set vb t_vb=
"  set columns=         " number of columns (uses most of my screen, in this case)
  set colorcolumn=+2      " put a marker at textwidth + 2
  set linespace=1         " spread the lines a bit, adding a 1px line above all
  set guifont=Monospace\ 12
"  set lines=54 
"
  " funcao usada para maximizar o gvim
  function Maximize_Window()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
  endfunction

  au GUIEnter * call Maximize_Window()
  au GUIEnter * set vb t_vb=

  colorscheme solarized
endif
