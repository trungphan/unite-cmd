let s:save_cpo = &cpo
set cpo&vim

let s:unite_source = {
      \ 'name': 'cmd',
      \ }


function! s:unite_source.gather_candidates(args, context)
    let result = []
    if !exists('g:unite_cmd_list') || len(a:args) == 0 || !has_key(g:unite_cmd_list, a:args[0])
        return [{'word': 'Help', 'source': 'cmd', 'kind': 'command', 'action__command': ':help unite-cmd'}]
    endif
    for l in g:unite_cmd_list[a:args[0]]
        call add(result, {'word': l[0], 'source': 'cmd', 'kind': l[1], 'action__command': l[2]})
    endfor
    return result
endfunction

function! unite#sources#cmd#define()
  return s:unite_source
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
