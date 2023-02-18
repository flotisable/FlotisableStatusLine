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
  highlight User6 cterm=bold  ctermfg=Gray      ctermbg=Black     " faded field color
  " end color terminal color settings

  " gui color settings
  highlight User1 gui=bold  guifg=#35AD42     guibg='Red'       " git branch field color
  highlight User2 gui=bold  guifg='DarkCyan'  guibg='Orange'    " flag field color
  highlight User3 gui=bold  guifg='Gray'      guibg='LightGray' " file name field color
  highlight User4 gui=bold  guifg='Yellow'    guibg='DarkGreen' " cursor position field color
  highlight User5 gui=bold  guifg='White'     guibg=#00BFFF     " time field color
  highlight User6 gui=bold  guifg='Gray'      guibg='Black'     " faded field color
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
  "
    let gitBranch   = readfile('.git/HEAD', '', 1)[0]
    let submatches  = matchlist( gitBranch, 'refs/heads/\(.*\)' )

    if len( submatches ) < 2 " no submatch
      return gitBranch
    else
      return submatches[1]
    endif
  "
  catch
    return ''
  endtry
"
endfunction
" end get the current git branch

" set the status line
function! FlotisableStatusLine()
"
  let l:statusLine                = ''
  let l:cursorPositionFieldWidth  = 11
  let l:timeFieldWidth            = 10
  let l:fileNameFieldWidth        = strwidth( expand( '%:t' ) )
  let l:rightFieldMinWidth        = l:fileNameFieldWidth + l:cursorPositionFieldWidth
  let l:windowWidth               = winwidth( 0 )
  let l:isFocusWindow             = ( g:statusline_winid == win_getid() )

  if l:isFocusWindow
    let l:rightFieldMinWidth += l:timeFieldWidth
  endif

  if l:isFocusWindow
    let l:statusLine .= '%1* %{FlotisableGitBranch()} '   " git branch field
  endif

  let l:statusline .= ( l:isFocusWindow ) ? '%2*': '%6*'  " flag field
  let l:statusLine .= ' %w%h%r%m %y [%{&fileformat}]'     " flag field

  " truncate file name field if there is enough space
  if l:windowWidth > l:rightFieldMinWidth
    let l:statusLine .= '%<'                              " file name field
  endif

  let l:statusLine .= '%3* %f '                           " file name field
  let l:statusLine .= '%='                                " seperate defferent alignment
  let l:statusline  = ( l:isFocusWindow ) ? '%4*': '%6*'  " cursor position field
  let l:statusLine .= ' %.5l,%-.5c %P '                   " cursor position field

  if l:isFocusWindow
    let l:statusLine .= '%5* %{FlotisableDate()} '        " time field
  endif

  return l:statusLine
"
endfunction
" end set the status line

set statusline=%!FlotisableStatusLine() " set status line

call s:FlotisableHighlight()

autocmd ColorScheme * call s:FlotisableHighlight()
