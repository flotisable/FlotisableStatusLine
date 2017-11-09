if !exists("s:flotisableStatusLine")

  let s:flotisableStatusLine

  function Date()
    return system("date \"+%p %H:%M\"")
  endfunction

endif
