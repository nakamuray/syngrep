" Syntax aware grep
"
" example: call SyntaxGrep('/example/ **/*.vim', 'Comment')

set nocompatible
syntax on

function SyntaxGrep(args, ...)
  " args: vimgrep arguments
  " optionally, you can pass regex that matches syntax name
  if a:0
    let l:target_syn_name = a:1
  endif

  silent execute 'vimgrep ' . a:args
  for l:qf in getqflist()
    " change current buffer
    silent execute 'buffer ' . l:qf['bufnr']

    " get syntax name
    let l:syn_name = synIDattr(synID(l:qf['lnum'], l:qf['col'], 0), 'name')

    if exists('l:target_syn_name') && l:syn_name !~? l:target_syn_name
      continue
    endif

    echo bufname(l:qf['bufnr']) . ':' . l:qf['lnum'] . ':' . l:syn_name . ':' . l:qf['text']
  endfor
endfunction
