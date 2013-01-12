if &cp || exists("g:loaded_guifontzoom") || !has("gui_gtk2") || !has("gui_running")
    finish
endif
let g:loaded_guifontzoom = 1

let s:save_cpo = &cpo
set cpo&vim

" keep default gui font size
let s:current_font = &guifont

" command
command! -narg=0 ZoomIn    :call s:ZoomIn()
command! -narg=0 ZoomOut   :call s:ZoomOut()
command! -narg=0 ZoomReset :call s:ZoomReset()

" map
nmap + :ZoomIn<CR>
nmap - :ZoomOut<CR>
nmap = :ZoomReset<CR>

" change gui font size
function! s:ChangeFont(amount)
  let l:fsize = substitute(&guifont, '^.* \([1-9][0-9]*\)$', '\1', '')
  let l:fsize += a:amount
  let l:guifont = substitute(&guifont, '\([1-9][0-9]*\)$', l:fsize, '')
  let &guifont = l:guifont
endfunction

" increase gui font size
function! s:ZoomIn()
    call s:ChangeFont(+1)
endfunction

" decrease gui font size
function! s:ZoomOut()
    call s:ChangeFont(-1)
endfunction

" reset gui font size
function! s:ZoomReset()
  let &guifont = s:current_font
endfunction

let &cpo = s:save_cpo
finish
