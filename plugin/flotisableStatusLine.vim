if exists( 'g:loaded_flotisableStatusLine' )
  finish
endif

let g:loaded_flotisableStatusLine = 1 " set flag to indicate the script is loaded

" status line field color settings
function! s:FlotisableHighlight()
"
  if exists( 'g:flotisableStatusLineCustomColor' )
    return
  endif

  " color terminal color settings
  highlight User1 cterm=bold  ctermfg=Green     ctermbg=DarkRed   " git branch field color
  highlight User2 cterm=bold  ctermfg=Blue      ctermbg=Brown     " flag field color
  highlight User3 cterm=bold  ctermfg=DarkGray  ctermbg=Gray      " file name field color
  highlight User4 cterm=bold  ctermfg=Yellow    ctermbg=DarkGreen " cursor position field color
  highlight User5 cterm=bold  ctermfg=White     ctermbg=DarkCyan  " time field color
  " end color terminal color settings

  " gui color settings
  highlight User1 gui=bold  guifg=#35AD42     guibg='Red'       " git branch field color
  highlight User2 gui=bold  guifg='DarkCyan'  guibg='Orange'    " flag field color
  highlight User3 gui=bold  guifg='Gray'      guibg='LightGray' " file name field color
  highlight User4 gui=bold  guifg='Yellow'    guibg='DarkGreen' " cursor position field color
  highlight User5 gui=bold  guifg='White'     guibg=#00BFFF     " time field color
  " end gui color settings
"
endfunction
" end status line field color settings

" get the system date information
function! FlotisableDate()
  return strftime("%p %H:%M")
endfunction
" end get the system date information

" get the current git branch
function! FlotisableGitBranch()
"
  try

    let gitBranch   = readfile('.git/HEAD', '', 1)[0]
    let submatches  = matchlist( gitBranch, 'refs/heads/\(.*\)' )

    if len( submatches ) < 2 " no submatch
      return gitBranch
    else
      return submatches[1]
    endif

  catch
    return ''
  endtry
"
endfunction
" end get the current git branch

" set the status line
function! FlotisableStatusLine()
"
  " file name + cursor position + time fields width
  let l:rightFieldMinWidth  = strwidth( expand( '%:t' ) ) + 21
  let l:windowWidth         = winwidth( 0 )

  let statusLine =  '%1* %{FlotisableGitBranch()} '     " git branch field
  let statusLine .= '%2* %w%h%r%m %y [%{&fileformat}]'  " flag field

  " truncate file name field if there is enough space
  if l:windowWidth > l:rightFieldMinWidth
    let statusLine .= '%<'                              " file name field
  endif

  let statusLine .= '%3* %f '                           " file name field
  let statusLine .= '%='                                " seperate defferent alignment
  let statusLine .= '%4* %.5l,%-.5c %P '                " cursor position field
  let statusLine .= '%5* %{FlotisableDate()} '          " time field

  return statusLine
"
endfunction
" end set the status line

set statusline=%!FlotisableStatusLine() " set status line

call s:FlotisableHighlight()

autocmd ColorScheme * call s:FlotisableHighlight()
