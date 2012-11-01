"saving a session when quitting Vim, and restoring the session when opening Vim
au VimLeave * call VimLeave()
au VimEnter * call VimEnter()
let g:PathToSessions = $HOME . "/.vim/sessions/"
function! VimEnter()
  if argc() == 0
    let LoadLastSession = confirm("Restore last session?", "&Yes\n&No")
    if LoadLastSession == 1
      exe "source " . g:PathToSessions . "/LastSession.vim"
    else
      call LoadSessions()
    endif
  endif
endfunction
function! LoadSessions()
  let result = "List of sessions:"
  let sessionfiles = glob(g:PathToSessions . "/*.vim")
  while stridx(sessionfiles, "\n") >= 0
    let index = stridx(sessionfiles, "\n")
    let sessionfile = strpart(sessionfiles, 0, index)
    let result = result . "\n " . fnamemodify(sessionfile, ":t:r")
    let sessionfiles = strpart(sessionfiles, index + 1)
  endwhile
  let result = result . "\n " . fnamemodify(sessionfiles, ":t:r")
  let result = result . "\n" . "Please enter a session name to load (or empty to start normally):"
  let sessionname = input(result)
  if sessionname != ""
    let g:SessionFileName = g:PathToSessions . "/" . sessionname . ".vim"   
    exe "source " . g:SessionFileName 
  endif
endfunction
function! VimLeave()
  exe "mksession! " . g:PathToSessions . "LastSession.vim"
  if exists("g:SessionFileName") == 1
    if g:SessionFileName != ""
      exe "mksession! " . g:SessionFileName
    endif
  endif
endfunction
" A command for setting the session name
com -nargs=1 SetSession :let g:SessionFileName = g:PathToSessions . <args> . ".vim"
" .. and a command to unset it
com -nargs=0 UnsetSession :let g:SessionFileName = ""

