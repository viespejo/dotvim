if exists("b:did_jslint_clear")
  finish
else
  let b:did_jslint_clear = 1
endif
au! InsertLeave <buffer>
if(!has("win32") || v:version>702)
  au! CursorHold <buffer>
  au! CursorHoldI <buffer>
endif
unm <buffer><silent> dd
unm <buffer><silent> dw
unm <buffer><silent> u
unm <buffer><silent> <C-R>
