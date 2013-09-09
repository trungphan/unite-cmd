let s:save_cpo = &cpo
set cpo&vim

let s:unite_source = {
      \ 'name': 'cmd',
      \ }

function! s:unite_source.gather_candidates(args, context)

  return [
      \ {'word': 'Navigate: Files', 'source': 'cmd', 'kind': 'command', 'action__command': ':Unite -start-insert -buffer-name=Files file_rec/async'},
      \ {'word': 'Navigate: Outline', 'source': 'cmd', 'kind': 'command', 'action__command': ':Unite -start-insert -buffer-name=Outline outline'},
      \ {'word': 'Run: Make', 'source': 'cmd', 'kind': 'command', 'action__command': ':make | cw'},
      \ ]
endfunction

function! unite#sources#cmd#define()
  return s:unite_source
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
