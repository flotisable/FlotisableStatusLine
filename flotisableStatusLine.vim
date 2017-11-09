if !exists("s:flotisableStatusLine")
"
  let s:flotisableStatusLine = 1

  function Date()
  "
    return system('date "+%p %H:%M"')
  "
  endfunction

  function HasGit()
  "
    call system('git --version')
    let hasGit = system('$?')
    return ( hasGit == 0 )
  "
  endfunction
"
endif
