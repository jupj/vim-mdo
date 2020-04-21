" Vim syntax file for mdo

if exists("b:current_syntax")
    finish
endif

" Use markdown syntax as base
runtime! syntax/markdown.vim
unlet! b:current_syntax

syntax match todoItem "\v(^\s*- )@<=\[ \]"
syntax match doneItem "\v(^\s*- )@<=\[x\]"
syntax match waitItem "\v(^\s*- )@<=WAIT>"
syntax match fwdItem "\v(^\s*- )@<=FWD>"
syntax match nopItem "\v(^\s*- )@<=NOP>"

"highlight Done ctermfg=LightGreen
highlight link Done String

highlight link todoItem Keyword
highlight link waitItem Special
highlight link fwdItem Done
highlight link doneItem Done
highlight link nopItem Done


let b:current_syntax = "markdown.mdo"
