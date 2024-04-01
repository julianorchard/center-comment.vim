fun! s:center_comment_fmt(...) abort
  return substitute(a:1, a:1,
        \ a:2 . a:5 . a:4 . a:5 . a:6 . a:3, "g")
endfun

" TODO: Update the comment string; reverse the process of creating the comment
"       but check if the comment format is roughtly correct (line width of X,
"       starts and ends line with the comment character), then just remove the
"       comment parts of the string.

fun! s:comment_strings() abort
  " Return the comment strings l and r
  return split(get(b:, 'commentary_format', substitute(substitute(substitute(
    \ &commentstring, '^$', '%s', ''), '\S\zs%s', ' %s', '') ,'%s\ze\S', '%s ', '')), '%s', 1)
endfun

fun! s:set_width() abort
  " Get the width we should be using from either textwidth, colorcolumn, or
  " just default to 80:
  let s:ccw = get(g:, 'center_comment_width', "")
  if s:ccw != ""
    return s:ccw
  elsei &textwidth
    return &textwidth
  elsei &colorcolumn
    return split(&colorcolumn, ",")[0]
  el
    return 80
  en
endfun

fun! center_comment#run(...) abort
  " Get the width based on either wrap, colorcolumn, or default 80
  let l:set_width = s:set_width()

  " Default to spaces as the line_char if not input into the function
  let l:line_char = a:1 != "" ? a:1 : " "

  " Get the comment characters for the current buffer
  let [left_comment_char, right_comment_char ] = s:comment_strings()

  " If the right comment character is empty, set it as the left one for
  " the purposes of aesthetics
  if right_comment_char == "" && !exists("g:center_comment_disable_mirror_end")
    let right_comment_char = " " . left_comment_char
  elsei right_comment_char == "" && exists("g:center_comment_disable_mirror_end")
    let right_comment_char = repeat(l:line_char, strlen(left_comment_char))
  elsei strcharpart(right_comment_char, -1, 2) != " "
    let right_comment_char = " " . right_comment_char
  en

  if exists("g:center_comment_uppercase")
    let l:line_text = " " . toupper(substitute(substitute(
                      \getline('.'), ".*" . left_comment_char . " ", "", ""),
                      \right_comment_char, "", "")) . " "
  el
    let l:line_text = " " . substitute(substitute(
                      \getline('.'), ".*" . left_comment_char . " ", "", ""),
                      \right_comment_char, "", "") . " "
  en

  let l:line_length = ((l:set_width - strlen(l:line_text)) / 2) -
                                           \ strdisplaywidth(left_comment_char)

  " TODO: Work with multiple lines, maybe, in the future
  if (l:line_length * 2) <= 0
    throw "Comment too long for your chosen width"
  en

  " Make oddly numbered lines even
  let l:extra_char = ""
  if strlen(l:line_text) % 2 == 1
    let l:extra_char = l:line_char
  en

  " Create the Line Parts
  let l:i = 1
  wh l:i < l:line_length
    let l:i += 1
    let l:line_char = l:line_char . l:line_char[0]
  endw

  " Insert the Line and Text
  call setline(line("."), s:center_comment_fmt(
                          \line("."),
                          \left_comment_char,
                          \right_comment_char,
                          \l:line_text,
                          \l:line_char,
                          \l:extra_char))

endfun
