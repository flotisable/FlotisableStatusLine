if !exists("g:loaded_flotisableStatusLine")
"
  let g:loaded_flotisableStatusLine = 1

  " get the system date information
  function FlotisableDate()
  "
    return system('date "+%p %H:%M"')
  "
  endfunction

  " get the current git branch
  function FlotisableGitBranch()
  "
    if executable('git')
      if isdirectory('.git')
        return system('git branch | grep ''*'' | cut -d'' '' -f2')
    endif

    return ''
  "
  endfunction

  " set the status line
  function FlotisableStatusLine()
  "
    let statusLine =  '%1*%{FlotisableGitBranch()}'
    let statusLine .= ' %2*%w%h%r%m'
    let statusLine .= ' %3*%y'
    let statusLine .= ' %4*%f'
    let statusLine .= '%='
    let statusLine .= '%5*%l,%c %P'
    let statusLine .= ' %6*%{FlotisableDate()}'

    return statusLine
  "
  endfunction

  set statusline=%!FlotisableStatusLine()
"
endif
