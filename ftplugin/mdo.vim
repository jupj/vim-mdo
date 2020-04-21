" Use markdown as base
runtime! ftplugin/markdown.vim ftplugin/markdown_*.vim ftplugin/markdown/*.vim

" Commands for mdo
command MdoCheck call mdo#toggleCheck()
command MdoDay call mdo#newDay()
command MdoForward call mdo#forward()
command MdoItem call mdo#newItem()
command MdoNext call mdo#next()
command MdoNop call mdo#toggleNop()
command MdoPrev call mdo#prev()
command MdoWait call mdo#toggleWait()

" Leader key mappings
nnoremap <buffer> <LocalLeader>- :MdoItem<cr>
nnoremap <buffer> <LocalLeader>d :MdoDay<cr>
nnoremap <buffer> <LocalLeader>f :MdoForward<cr>
nnoremap <buffer> <LocalLeader>n :MdoNop<cr>
nnoremap <buffer> <LocalLeader>t :MdoWait<cr>
nnoremap <buffer> <LocalLeader>x :MdoCheck<cr>

" Navigation mappings
nnoremap <buffer> [k :MdoPrev<cr>
nnoremap <buffer> ]k :MdoNext<cr>
