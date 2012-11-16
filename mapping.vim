"To save, press ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
"Mapping Omni Complete
imap <c-space> <c-x><c-o>
"Mapping TagList
nmap <silent> <F8> :TlistToggle<CR>
"Mapping Vtreeexplorer
" nmap <silent> <F7> :VSTreeExplore<CR>
"Mapping NERDTree
nmap <silent> <F7> :NERDTreeToggle<CR>
"Resize windows
nmap <silent> <F2> <C-W><Bar><Space>
nmap <silent> <F3> <C-W>_<Space>
nmap <silent> <F4> <C-W>=<Space>
"Gundo
nnoremap <c-F5> :GundoToggle<CR>
