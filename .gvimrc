" Schriftart/ -groesse setzen
" set guifont=Dejavu\ Sans\ Mono\ 10
" Farbschema setzen:
"  - via: http://www.vim.org/scripts/script.php?script_id=2555
"  - in ~/.vim/colors/ ablegen
colorscheme desert
 
" Menueleisten, Scrollleisten nicht anzeigen
" set guioptions-=r
" set guioptions-=m
" set guioptions-=T
 
" mit F9 Anzeige der Leisten umschalten
" let g:menubar=0
" map <silent> <F9> :if g:menubar == 1<CR>:set guioptions-=mT<CR>:let g:menubar = 0<CR>
"  \ :else<CR>:set guioptions+=mT<CR>:let g:menubar = 1<CR>:endif<CR>
 
" Groesse setzen
set lines=100
set columns=130
