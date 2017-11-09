if !exists("s:flotisableStatusLine")
"
  let s:flotisableStatusLine = 1

  function Date()
  "
    return system('date "+%p %H:%M"')
  "
  endfunction

  function GitBranch()
  "
    if executable('git')
      if isdirectory('.git')
        return system('git branch | grep ''*'' | cut -d'' '' -f2')
    endif

    return ''
  "
  endfunction
"
endif
