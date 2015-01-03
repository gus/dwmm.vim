" Exit quickly if already running
if exists("g:dwmm_version") || &diff || &cp
  finish
endif

let g:dwmm_version = "0.1.0"

" Check for Vim version 700 or greater {{{1
if v:version < 700
  echo "Sorry, dwmm.vim ".g:dwm_version."\nONLY runs with Vim 7.0 and greater."
  finish
endif

" Move the current master pane to the stack
function! DWMM_Stack()
  if winnr("$") == 1
    return
  endif

  " make sure we're in the first window, then remember its buffer and close it
  1wincmd w
  let l:curbuf = winbufnr("%")
  wincmd q

  " make sure we're in what's now the first window
  1wincmd w

  " sbuffer the old buffer into a window on top
  exec "sb " . l:curbuf
endfunction

" Add a new buffer
function! DWMM_New()
  " Move current master pane to the stack
  call DWMM_Stack()
  " Create a vertical split
  vert topleft new
endfunction


" Move the current window to the master pane (the previous master window is
" added to the top of the stack). If current window is master already - switch
" to stack top
function! DWMM_Focus()
  if winnr("$") == 1
    return
  endif

  " remember the current buffer, then close its window
  let l:curbuf = winbufnr("%")
  wincmd q

  " Move current master pane to the stack and open fancy new window
  call DWMM_Stack()
  call DWMM_New()

  " reopen our buffer in the new fancy window
  exec "b " . l:curbuf
endfunction

"nnoremap <silent> <Plug>DWMMNew   :call DWMM_New()<CR>
"nnoremap <silent> <Plug>DWMMFocus :call DWMM_Focus()<CR>
nnoremap <silent> <Plug>DWMMNew   :call DWMM_New()<CR>
nnoremap <silent> <Plug>DWMMFocus :call DWMM_Focus()<CR>

if !exists('g:dwmm_map_keys')
  let g:dwmm_map_keys = 1
endif

if g:dwmm_map_keys
  if !hasmapto('<Plug>DWMMNew')
    nmap <silent> <C-n> <Plug>DWMMNew
  endif
  if !hasmapto('<Plug>DWMMFocus')
    nmap <silent> <C-f> <Plug>DWMMFocus
  endif
endif
