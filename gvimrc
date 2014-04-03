set guioptions=aegit    " basically, all options, except the scrollbar, menu and toolbar
"set columns=116         " number of columns (uses most of my screen, in this case)
set lines=999 columns=999
set cursorline          " highlight the line with the cursor
set colorcolumn=+2      " put a marker at textwidth + 2
set linespace=1         " spread the lines a bit, adding a 1px line above all
set background=dark
colorscheme badwolf
set gfn=ubuntu\ mono\ 13
set lines=54

function Maximize_Window()
 silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

au GUIEnter * call Maximize_Window()
"au GUIEnter * NERDTree /home/willy/Projetos

map <silent> <S-Insert> "+p
imap <silent> <S-Insert> <Esc>"+pa

