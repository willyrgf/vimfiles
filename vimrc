set encoding=utf-8
set nocompatible
set backspace=indent,eol,start

" Donât use Ex mode, use Q for formatting
map Q gq
" " Map Y to do the same (well, almost) as the D command
map Y y$

" âââââââââââââââââââââââ-
"  Those are my settings
" âââââââââââââââââââââââ-
syntax on
set hlsearch
set tabstop=2           " tabs are displayed as 4 spaces
set shiftwidth=1        " by default, when auto-identing, add 4 spaces (or 1 tabstop)
set foldmethod=marker   " fold on markers
set scrolloff=1         " always show one line around the cursor
set laststatus=2        " always show the status bar (âcause I like to see the line and column, always)
set showtabline=2       " always show the tabline
set showmatch           " show matching bracket
set noerrorbells        " no error bells
set autowrite           " write the file when switching between files or something
set nowrap              " do not wrap long lines
set nobackup            " do not keep a backup file, use versions instead
set history=500          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set formatoptions=tcq   " wrap with textwidth, wrap comments, insert commend leader (twice), format comments                                                                                                                                 
set smartindent         " smart identation                                                                                                                                                                                                   
set number              " show line numbers                                                                                                                                                                                                  
set wim=longest,list    " file auto-completion                                                                                                                                                                                               
set background=dark     " to follow most of the colorschemes I use                                                                                                                                                                           
"set vb=t_vb            " convert bells to visual bells and do nothing as visual bell                                                                                                                                                        
set t_Co=256            " 256 color terminals                                                                                                                                                                                                
let mapleader=","     " use comma to start user-defined (in plugins) functions                                                                                                                                                               
                                                                                                                                                                                                                                             
"if has("autocmd")                                                                                                                                                                                                                           
                                                                                                                                                                                                                                             
filetype plugin indent on                                                                                                                                                                                                                    
" Numero de colunas maximo de cada texto                                                                                                                                                                                                     
autocmd FileType text setlocal textwidth=78                                                                                                                                                                                                  
                                                                                                                                                                                                                                             
" When editing a file, always jump to the last known cursor position.                                                                                                                                                                        
" Donât do it when the position is invalid or when inside an event handler                                                                                                                                                                   
" (happens when dropping a file on gvim).                                                                                                                                                                                                    
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif                                                                                                                                                  
                                                                                                                                                                                                                                             
" Vundle                                                                                                                                                                                                                                     
set rtp+=~/.vim/bundle/vundle/                                                                                                                                                                                                               
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle "bling/vim-airline"
Bundle 'tpope/vim-commentary'
Bundle 'jiangmiao/auto-pairs'
Bundle 'msanders/snipmate.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
"Bundle 'wincent/Command-T'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'szw/vim-ctrlspace'
" End Vundle
"
colorscheme badwolf

" Atalho
nnoremap <C-O> :CtrlPFunky<CR>

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

function Maximize_Window()
 silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

au GUIEnter * call Maximize_Window()

if has("gui_running")
  set guioptions=aegit    " basically, all options, except the scrollbar, menu and toolbar
  set lines=999 columns=999
  set cursorline          " highlight the line with the cursor
  set colorcolumn=+2      " put a marker at textwidth + 2
  set linespace=1         " spread the lines a bit, adding a 1px line above all
  set background=dark
  colorscheme badwolf
  set gfn=ubuntu\ mono\ 13
  set lines=54
  map <silent> <S-Insert> "+p
  imap <silent> <S-Insert> <Esc>"+pa
endif
