if exists( 'g:loaded_flotisableStatusLine' )
  finish
endif

let g:loaded_flotisableStatusLine = 1 " set flag to indicate the script is loaded

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

  " git branch field
  if l:isFocusWindow
    let l:statusLine .= '%#FtStatusLineGitBranch#'
    let l:statusLine .= ' %{FlotisableGitBranch()} '
  endif

  " flag field
  if l:isFocusWindow
    let l:statusLine .= '%#FtStatusLineFlag#'
  else
    let l:statusLine .= '%#FtStatusLineFaded#'
  endif

  let l:statusLine .= ' %w%h%r%m %y [%{&fileformat}]'

  " truncate file name field if there is enough space
  if l:windowWidth > l:rightFieldMinWidth
    let l:statusLine .= '%<'                          " file name field
  endif

  let l:statusLine .= '%#FtStatusLineFileName# %f '   " file name field
  let l:statusLine .= '%='                            " seperate defferent alignment

  " cursor position field
  if l:isFocusWindow
    let l:statusLine .= '%#FtStatusLineCursorPosition#'
  else
    let l:statusLine .= '%#FtStatusLineFaded#'
  endif

  let l:statusLine .= ' %.5l,%-.5c %P '

  " time field
  if l:isFocusWindow
    let l:statusLine .= '%#FtStatusLineTime#'
    let l:statusLine .= ' %{FlotisableDate()} '
  endif

  return l:statusLine
"
endfunction
" end set the status line

set statusline=%!FlotisableStatusLine()

" color terminal color settings
highlight default FtStatusLineGitBranch       cterm=bold  ctermfg=Green     ctermbg=DarkRed
highlight default FtStatusLineFlag            cterm=bold  ctermfg=Blue      ctermbg=Brown
highlight default FtStatusLineFileName        cterm=bold  ctermfg=DarkGray  ctermbg=Gray
highlight default FtStatusLineCursorPosition  cterm=bold  ctermfg=Yellow    ctermbg=DarkGreen
highlight default FtStatusLineTime            cterm=bold  ctermfg=White     ctermbg=DarkCyan
highlight default FtStatusLineFaded           cterm=bold  ctermfg=Gray      ctermbg=Black
" end color terminal color settings

" gui color settings
highlight default FtStatusLineGitBranch       gui=bold  guifg=#35AD42     guibg='Red'
highlight default FtStatusLineFlag            gui=bold  guifg='DarkCyan'  guibg='Orange'
highlight default FtStatusLineFileName        gui=bold  guifg='Gray'      guibg='LightGray'
highlight default FtStatusLineCursorPosition  gui=bold  guifg='Yellow'    guibg='DarkGreen'
highlight default FtStatusLineTime            gui=bold  guifg='White'     guibg=#00BFFF
highlight default FtStatusLineFaded           gui=bold  guifg='Gray'      guibg='Black'
" end gui color settings
