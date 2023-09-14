"                          CENTER COMMENTS LIKE THIS!                          "

if exists("g:loaded_center_comment") || v:version < 703
  finish
endif
let g:loaded_center_comment = 1

command! -nargs=? CenterComment call center_comment#run(<q-args>)
