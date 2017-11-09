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
    return executable('git')
  "
  endfunction
"
endif
