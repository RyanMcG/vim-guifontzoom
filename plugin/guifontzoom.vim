if &cp || exists("g:loaded_guifontzoom") || !has("gui_gtk2") || !has("gui_running")
    finish
endif
let g:loaded_guifontzoom = 1

let s:save_cpo = &cpo
set cpo&vim

let s:current_font = ''

" command
command! -narg=0 ZoomIn    :call s:ZoomIn()
command! -narg=0 ZoomOut   :call s:ZoomOut()
command! -narg=0 ZoomReset :call s:ZoomReset()

" map
nmap <silent> <leader>zi :ZoomIn<CR>
nmap <silent> <leader>zo :ZoomOut<CR>
nmap <silent> <leader>zr :ZoomReset<CR>

let s:size_match_str = '\(^.*\) \([1-9][0-9]*\(\.[0-9]*\)\?\)$'
" change gui font size
function! s:ChangeFont(amount)
  echo s:current_font
  if empty(s:current_font)
    let s:current_font = &guifont
  endif

  let l:fsize = str2float(substitute(&guifont, s:size_match_str, '\2', ''))
  let l:fsize += a:amount
  let l:fsize_str = printf('%.1f', l:fsize)

  let &guifont = substitute(&guifont, s:size_match_str, '\1 '.l:fsize_str, '')
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
  if !empty(s:current_font)
    echo s:current_font
    let &guifont = s:current_font
  endif
endfunction

let &cpo = s:save_cpo
finish
