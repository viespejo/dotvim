"disable Menubar and Toolbar
set go-=m
set go-=T
"color
colo wombat
" Size of GVim window
set lines=1000 columns=1000
"Powerline
"set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
"set guifont=Monaco\ for\ Powerline\ 10
set guifont=Monaco\ 10
"tabs
set guitablabel=%{ShortTabLabel()}   
function ShortTabLabel()
   let bufnrlist = tabpagebuflist(v:lnum)
   " show only the first 6 letters of the name..
   let label = bufname(bufnrlist[tabpagewinnr(v:lnum) – 1])
   let filename = fnamemodify(label,':h')
   " only add .. if string is more than 8 letters
   if strlen(filename) >=8
    let ret=filename[0:5].'..'
   else
    let ret = filename
   endif
   return ret
endfunction
set guitabtooltip=%!InfoGuiTooltip()
function! InfoGuiTooltip()
    "get window count
    let wincount = tabpagewinnr(tabpagenr(),'$')
    let bufferlist=''
   "get name of active buffers in windows
    for i in tabpagebuflist()
        let bufferlist .= '['.fnamemodify(bufname(i),':t').'] '
    endfor
    return bufname($).' windows: '.wincount.' ' .bufferlist ' '
endfunction
