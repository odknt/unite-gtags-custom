let s:save_cpo = &cpo
set cpo&vim

function! unite#filters#converter_erase_filepath#define()
    return s:filters
endfunction

let s:filters = {
    \ 'name'        : 'converter_erase_filepath',
    \ 'description' : 'erase filepath for gtags/file'
    \}

function! s:filters.filter(candidates, context)
    for candidate in a:candidates
        let candidate.word = substitute(candidate.word, '\S\+\s|\d\+|\s', '', '')
    endfor

    return a:candidates
endfunction

call unite#define_filter(s:filters)

let &cpo = s:save_cpo
unlet s:save_cpo
