if !exists("g:loaded_flotisableStatusLine")
"
  let g:loaded_flotisableStatusLine = 1

  highlight User1 cterm=bold  ctermfg=Green     ctermbg=DarkRed
  highlight User2 cterm=bold  ctermfg=Blue      ctermbg=Brown
  highlight User3 cterm=bold  ctermfg=DarkGray  ctermbg=Gray
  highlight User4 cterm=bold  ctermfg=Yellow    ctermbg=DarkGreen
  highlight User5 cterm=bold  ctermfg=White     ctermbg=DarkCyan

  " get the system date information
  function FlotisableDate()
  "
    return substitute( system('date "+%p %H:%M"'), '[[:cntrl:]]', '', 'g' )
  "
  endfunction

  " get the current git branch
  function FlotisableGitBranch()
  "
    if executable('git')
      if isdirectory('.git')
        return substitute( system('git branch | grep ''*'' | cut -d'' '' -f2'), '[[:cntrl:]]', '', 'g' )
    endif

    return ''
  "
  endfunction

  " set the status line
  function FlotisableStatusLine()
  "
    let statusLine =  '%1*%{FlotisableGitBranch()}'
    let statusLine .= ' %2*%w%h%r%m %y'
    let statusLine .= ' %3*%f'
    let statusLine .= '%='
    let statusLine .= '%4*%l,%c %P'
    let statusLine .= ' %5*%{FlotisableDate()}'

    return statusLine
  "
  endfunction

  set statusline=%!FlotisableStatusLine()
"
endif
