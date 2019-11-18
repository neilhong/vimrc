
let g:loaded_comfortable_motion = 0

set nu
set cursorline
set linebreak
set history=5000

map <c-p> :CtrlPBuffer<cr>

" 下面的颜色(darkgreen)可以自己修改
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
augroup WhitespaceMatch
  autocmd!
  autocmd BufWinEnter * let w:whitespace_match_number =
        \ matchadd('ExtraWhitespace', '\s\+$')
  autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
  autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END
function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match_number')
    call matchdelete(w:whitespace_match_number)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
  else
    let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
  endif
endfunction

autocmd BufWritePre * :%s/\s\+$//e


let g:go_fmt_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_autosave_enabled = ['vet']
let g:go_metalinter_deadline = "5s"
