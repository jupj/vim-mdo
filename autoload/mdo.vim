" Utility functions for mdo

" mdo#next() searches for unchecked or waiting todos
function! mdo#next()
    call search('\v^\s*- (\[ \]|WAIT>)')
endfunction

" mdo#prev() searches for unchecked or waiting todos backwards
function! mdo#prev()
    call search('\v^\s*- (\[ \]|WAIT>)', 'b')
endfunction

" mdo#newDay() initiates a new day entry
function! mdo#newDay()
    call append(line('$'), [
                \ "",
                \ strftime('%Y-%m-%d'),
                \ "==========",
                \ "## Tasks"])

    " Move cursor to last line
    call cursor(line('$'), 0)
endfunction

" mdo#newItem() adds a new todo item on the next line, leaving editor in
" INSERT mode so the user can add the description
function! mdo#newItem()
    let l:lineNr = line('.')
    call append(l:lineNr, "- [ ] ")
    call cursor(l:lineNr+1, 0)
    startinsert!
endfunction

" mdo#forward marks the item as 'FWD' and copies it to the end
function! mdo#forward()
    " Read line under cursor
    let l:srcLine = getline('.')

    " Copy to end
    call append(line('$'), l:srcLine)
    " Replace '- [ ]' with '- FWD'
    call setline('.', substitute(l:srcLine, '^\s*- \zs\[ \]\ze', 'FWD', ''))
endfunction

" mdo#toggleCheck toggles the item between '[ ]' and '[x]'
function! mdo#toggleCheck()
    let l:line = getline('.')
    if match(l:line, '^\s*- \[ \]') >= 0
        " Replace '- [ ]' with '- [x]'
        call setline('.', substitute(l:line, '^\s*- \[\zs \ze\]', 'x', ''))
    elseif match(l:line, '^\s*- \[x\]') >= 0
        " Replace '- [x]' with '- [ ]'
        call setline('.', substitute(l:line, '^\s*- \[\zsx\ze\]', ' ', ''))
    endif
endfunction

" mdo#toggleNop toggles the item between '[ ]' and 'NOP'
function! mdo#toggleNop()
    let l:line = getline('.')
    if match(l:line, '^\s*- \[ \]') >= 0
        " Replace '- [ ]' with '- NOP'
        call setline('.', substitute(l:line, '^\s*- \zs\[ \]', 'NOP', ''))
    elseif match(l:line, '^\s*- NOP\>') >= 0
        " Replace '- NOP' with '- [ ]'
        call setline('.', substitute(l:line, '^\s*- \zsNOP\>', '[ ]', ''))
    endif
endfunction

" mdo#toggleWait toggles the item between '[ ]' and 'WAIT'
function! mdo#toggleWait()
    let l:line = getline('.')
    if match(l:line, '^\s*- \[ \]') >= 0
        " Replace '- [ ]' with '- WAIT'
        call setline('.', substitute(l:line, '^\s*- \zs\[ \]', 'WAIT', ''))
    elseif match(l:line, '^\s*- WAIT\>') >= 0
        " Replace '- WAIT' with '- [ ]'
        call setline('.', substitute(l:line, '^\s*- \zsWAIT\>', '[ ]', ''))
    endif
endfunction
