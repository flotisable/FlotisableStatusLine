if !exists("g:loaded_flotisableStatusLine")
"
  let g:loaded_flotisableStatusLine = 1 " set flag to indicate the script is loaded

  " status line field color settings
  highlight User1 cterm=bold  ctermfg=Green     ctermbg=DarkRed   " git branch field color
  highlight User2 cterm=bold  ctermfg=Blue      ctermbg=Brown     " flag field color
  highlight User3 cterm=bold  ctermfg=DarkGray  ctermbg=Gray      " file name field color
  highlight User4 cterm=bold  ctermfg=Yellow    ctermbg=DarkGreen " cursor position field color
  highlight User5 cterm=bold  ctermfg=White     ctermbg=DarkCyan  " time field color
  " end status line field color settings

  " get the system date information
  function FlotisableDate()
  "
    return substitute( system('date "+%p %H:%M"'), '[[:cntrl:]]', '', 'g' )
  "
  endfunction
  " end get the system date information

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
  " end get the current git branch

  " set the status line
  function FlotisableStatusLine()
  "
    let statusLine =  '%1* %{FlotisableGitBranch()} ' " git branch field
    let statusLine .= '%2* %w%h%r%m %y '              " flag field
    let statusLine .= '%3* %f '                       " file name field
    let statusLine .= '%='                            " seperate defferent alignment
    let statusLine .= '%4* %.5l,%-.5c %P '            " cursor position field
    let statusLine .= '%5* %{FlotisableDate()} '      " time field

    return statusLine
  "
  endfunction
  " end set the status line

  set statusline=%!FlotisableStatusLine() " set status line
"
endif
