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
  highlight FtStatusLineGitBranch       cterm=bold  ctermfg=Green     ctermbg=DarkRed
  highlight FtStatusLineFlag            cterm=bold  ctermfg=Blue      ctermbg=Brown
  highlight FtStatusLineFileName        cterm=bold  ctermfg=DarkGray  ctermbg=Gray
  highlight FtStatusLineCursorPosition  cterm=bold  ctermfg=Yellow    ctermbg=DarkGreen
  highlight FtStatusLineTime            cterm=bold  ctermfg=White     ctermbg=DarkCyan
  highlight FtStatusLineFaded           cterm=bold  ctermfg=Gray      ctermbg=Black
  " end color terminal color settings

  " gui color settings
  if g:colors_name == 'nord'
  "
    highlight FtStatusLineGitBranch       gui=bold  guifg=#8FBCBB     guibg=#BF616A
    highlight FtStatusLineFlag            gui=bold  guifg=#88C0D0     guibg=#4C566A
    highlight FtStatusLineFileName        gui=bold  guifg=#D8DEE9     guibg=#3B4252
    highlight FtStatusLineCursorPosition  gui=bold  guifg=#EBCB8B     guibg=#81A1C1
    highlight FtStatusLineTime            gui=bold  guifg=#D8DEE9     guibg=#5E81AC
    highlight FtStatusLineFaded           gui=bold  guifg=#4C566A     guibg=#3B4252
  "
  else
  "
    highlight FtStatusLineGitBranch       gui=bold  guifg=#35AD42     guibg='Red'
    highlight FtStatusLineFlag            gui=bold  guifg='DarkCyan'  guibg='Orange'
    highlight FtStatusLineFileName        gui=bold  guifg='Gray'      guibg='LightGray'
    highlight FtStatusLineCursorPosition  gui=bold  guifg='Yellow'    guibg='DarkGreen'
    highlight FtStatusLineTime            gui=bold  guifg='White'     guibg=#00BFFF
    highlight FtStatusLineFaded           gui=bold  guifg='Gray'      guibg='Black'
  "
  endif
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

call s:FlotisableHighlight()

autocmd ColorScheme * call s:FlotisableHighlight()
